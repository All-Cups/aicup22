let BUFFER_SIZE = 102_400

class BufferedInputStream : InputStream {
    init(_ inner: InputStream) {
        self.inner = inner
        buffer = []
        bufferPos = 0
    }

    func readBytesAtMost(_ byteCount: Int) -> [Byte] {
        if bufferPos == buffer.count {
            buffer = inner.readBytesAtMost(BUFFER_SIZE);
            bufferPos = 0;
        }
        let chunk = Array(buffer[bufferPos..<min(bufferPos + byteCount, buffer.count)]);
        bufferPos += chunk.count;
        return chunk;
    }

    private let inner: InputStream
    private var buffer: [Byte]
    private var bufferPos: Int
}

class BufferedOutputStream : OutputStream {
    init(_ inner: OutputStream) {
        self.inner = inner
        buffer = []
    }

    func writeBytes(_ data: [Byte]) {
        self.buffer.append(contentsOf: data)
    }

    func flush() {
        self.inner.writeBytes(self.buffer)
        self.inner.flush()
        self.buffer = []
    }
    
    private let inner: OutputStream
    private var buffer: [Byte]
}