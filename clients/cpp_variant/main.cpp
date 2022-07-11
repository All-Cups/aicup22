#include "DebugInterface.hpp"
#include "MyStrategy.hpp"
#include "TcpStream.hpp"
#include "codegame/ServerMessage.hpp"
#include "codegame/ClientMessage.hpp"
#include <memory>
#include <string>

class Runner
{
public:
    Runner(const std::string &host, int port, const std::string &token) : tcpStream(host, port)
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
        while (true)
        {
            auto message = codegame::readServerMessage(tcpStream);
            if (const codegame::UpdateConstants *updateConstantsMessage = std::get_if<codegame::UpdateConstants>(&message))
            {
                myStrategy.reset(new MyStrategy(updateConstantsMessage->constants));
            }
            else if (const codegame::GetOrder *getOrderMessage = std::get_if<codegame::GetOrder>(&message))
            {
                codegame::ClientMessage message = codegame::OrderMessage(myStrategy->getOrder(getOrderMessage->playerView, getOrderMessage->debugAvailable ? &debugInterface : nullptr));
                codegame::writeClientMessage(message, tcpStream);
                tcpStream.flush();
            }
            else if (const codegame::Finish *finishMessage = std::get_if<codegame::Finish>(&message))
            {
                myStrategy->finish();
                break;
            }
            else if (const codegame::DebugUpdate *debugUpdateMessage = std::get_if<codegame::DebugUpdate>(&message))
            {
                myStrategy->debugUpdate(debugUpdateMessage->displayedTick, debugInterface);
                codegame::ClientMessage message = codegame::DebugUpdateDone();
                codegame::writeClientMessage(message, tcpStream);
                tcpStream.flush();
            }
            else
            {
                throw std::runtime_error("Unexpected server message");
            }
        }
    }

private:
    TcpStream tcpStream;
};

int main(int argc, char *argv[])
{
    std::string host = argc < 2 ? "127.0.0.1" : argv[1];
    int port = argc < 3 ? 31001 : atoi(argv[2]);
    std::string token = argc < 4 ? "0000000000000000" : argv[3];
    Runner(host, port, token).run();
    return 0;
}