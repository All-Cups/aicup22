#include "DebugInterface.hpp"
#include "MyStrategy.hpp"
#include "TcpStream.hpp"
#include "codegame/ServerMessage.hpp"
#include "codegame/ClientMessage.hpp"
#include <memory>
#include <string>

class Runner {
public:
    Runner(const std::string& host, int port, const std::string& token): tcpStream(host, port)
    {
        tcpStream.write(token);
        tcpStream.write(int(1));
        tcpStream.write(int(1));
        tcpStream.write(int(0));
        tcpStream.flush();
    }
    void run()
    {
        DebugInterface debugInterface(&tcpStream);
        std::shared_ptr<MyStrategy> myStrategy = std::shared_ptr<MyStrategy>();
        while (true) {
            auto message = codegame::ServerMessage::readFrom(tcpStream);
            if (auto updateConstantsMessage = std::dynamic_pointer_cast<codegame::ServerMessage::UpdateConstants>(message)) {
                myStrategy.reset(new MyStrategy(updateConstantsMessage->constants));
            } else if (auto getOrderMessage = std::dynamic_pointer_cast<codegame::ServerMessage::GetOrder>(message)) {
                codegame::ClientMessage::OrderMessage(myStrategy->getOrder(getOrderMessage->playerView, getOrderMessage->debugAvailable ? &debugInterface : nullptr)).writeTo(tcpStream);
                tcpStream.flush();
            } else if (auto finishMessage = std::dynamic_pointer_cast<codegame::ServerMessage::Finish>(message)) {
                myStrategy->finish();
                break;
            } else if (auto debugUpdateMessage = std::dynamic_pointer_cast<codegame::ServerMessage::DebugUpdate>(message)) {
                myStrategy->debugUpdate(debugUpdateMessage->displayedTick, debugInterface);
                codegame::ClientMessage::DebugUpdateDone().writeTo(tcpStream);
                tcpStream.flush();
            } else {
                throw std::runtime_error("Unexpected server message");
            }
        }
    }

private:
    TcpStream tcpStream;
};

int main(int argc, char* argv[])
{
    std::string host = argc < 2 ? "127.0.0.1" : argv[1];
    int port = argc < 3 ? 31001 : atoi(argv[2]);
    std::string token = argc < 4 ? "0000000000000000" : argv[3];
    Runner(host, port, token).run();
    return 0;
}