import my_strategy;
import stream;
import socket_stream;
import buffered_stream;
import debug_interface;
import std.socket;
import std.conv;
import std.exception;
import codegame.server_message;
import codegame.client_message;

class Runner
{
    this(string host, ushort port, string token)
    {
        auto addr = getAddress(host, port)[0];
        auto socket = new Socket(addr.addressFamily, SocketType.STREAM);
        socket.setOption(SocketOptionLevel.TCP, SocketOption.TCP_NODELAY, true);
        socket.connect(addr);
        stream = new BufferedStream(new SocketStream(socket));
        stream.write(token);
        stream.write(1);
        stream.write(0);
        stream.write(1);
        stream.flush();
    }

    void run()
    {
        MyStrategy myStrategy = null;
        auto debugInterface = new DebugInterface(stream);
        while (true)
        {
            codegame.ServerMessage message = codegame.ServerMessage.readFrom(stream);
            if (auto updateConstantsMessage = cast(codegame.ServerMessage.UpdateConstants)(message))
            {
                myStrategy = new MyStrategy(updateConstantsMessage.constants);
            }
            else if (auto getOrderMessage = cast(codegame.ServerMessage.GetOrder)(message))
            {
                new codegame.ClientMessage.OrderMessage(myStrategy.getOrder(getOrderMessage.playerView,
                    getOrderMessage.debugAvailable ? debugInterface : null)).writeTo(stream);
                stream.flush();
            }
            else if (auto finishMessage = cast(codegame.ServerMessage.Finish)(message))
            {
                myStrategy.finish();
                break;
            }
            else if (auto debugUpdateMessage = cast(codegame.ServerMessage.DebugUpdate)(message))
            {
                myStrategy.debugUpdate(debugInterface);
                new codegame.ClientMessage.DebugUpdateDone().writeTo(stream);
                stream.flush();
            }
            else
            {
                throw new Error("Unexpected server message");
            }
        }
    }

private:
    Stream stream;
}

void main(string[] args)
{
    string host = args.length < 2 ? "127.0.0.1" : args[1];
    ushort port = args.length < 3 ? 31001 : to!ushort(args[2]);
    string token = args.length < 4 ? "0000000000000000" : args[3];

    new Runner(host, port, token).run();
}