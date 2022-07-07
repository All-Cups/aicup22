import stream;
import std.socket;
import std.exception;

class SocketStream : Stream
{
    this(Socket socket)
    {
        this.socket = socket;
    }

    override ubyte[] readBytesAtMost(size_t byteCount)
    {
        ubyte[] data = new ubyte[byteCount];
        auto received = socket.receive(data);
        enforce(received > 0);
        return data[0 .. received];
    }

    override void writeBytes(const ubyte[] data)
    {
        size_t offset = 0;
        while (offset < data.length)
        {
            auto sent = socket.send(data[offset .. data.length]);
            enforce(sent > 0);
            offset += sent;
        }
    }

    override void flush()
    {
    }

private:
    Socket socket;
}
