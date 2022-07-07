import stream;
import std.algorithm;

const BUFFER_SIZE = 102_400;

class BufferedStream : Stream
{
    this(Stream inner)
    {
        this.inner = inner;
    }

    override ubyte[] readBytesAtMost(size_t byteCount)
    {
        if (readBufferPos == readBuffer.length)
        {
            readBuffer = inner.readBytesAtMost(BUFFER_SIZE);
            readBufferPos = 0;
        }
        auto chunk = readBuffer[readBufferPos .. min(readBufferPos + byteCount, $)];
        readBufferPos += chunk.length;
        return chunk;
    }

    override void writeBytes(const ubyte[] data)
    {
        writeBuffer ~= data;
    }

    override void flush()
    {
        inner.writeBytes(writeBuffer);
        inner.flush();
        writeBuffer = new ubyte[0];
    }

private:
    Stream inner;
    ubyte[] readBuffer = new ubyte[0];
    size_t readBufferPos = 0;
    ubyte[] writeBuffer = new ubyte[0];
}
