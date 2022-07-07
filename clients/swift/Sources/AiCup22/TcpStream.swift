#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

class TcpStream : InputStream, OutputStream {
    init(_ host: String, _ port: Int) {
        #if os(Linux)
            sock = socket(AF_INET, Int32(SOCK_STREAM.rawValue), 0)
        #else
            sock = socket(AF_INET, SOCK_STREAM, 0)
        #endif
        if sock == -1 {
            fatalError("Failed to create socket")
        }
        var yes: Int32 = 1
        if setsockopt(sock, Int32(IPPROTO_TCP), TCP_NODELAY, &yes, socklen_t(MemoryLayout<Int32>.size)) < 0 {
            fatalError("Failed to set TCP_NODELAY")
        }
        var hints = addrinfo()
        var servinfo: UnsafeMutablePointer<addrinfo>?
        hints.ai_family = AF_INET
        #if os(Linux)
            hints.ai_socktype = Int32(SOCK_STREAM.rawValue)
        #else
            hints.ai_socktype = SOCK_STREAM
        #endif
        if getaddrinfo(host, String(port), &hints, &servinfo) != 0 {
            fatalError("Failed to get addr info")
        }
        if connect(sock, servinfo!.pointee.ai_addr, servinfo!.pointee.ai_addrlen) == -1 {
            fatalError("Failed to connect")
        }
        freeaddrinfo(servinfo)
    }

    deinit {
        if close(sock) != 0 {
            fatalError("Failed to close socket")
        }
    }

    func readBytesAtMost(_ byteCount: Int) -> [Byte] {
        var buffer = [Byte](repeating: 0x0, count: byteCount)
        let received = buffer.withUnsafeMutableBytes { recv(sock, $0.baseAddress, byteCount, 0) }
        if received < 0 {
            fatalError("Failed to read from socket")
        }
        return Array(buffer[..<received])
    }

    func writeBytes(_ data: [Byte]) {
        if send(sock, data, data.count, 0) < 0 {
            fatalError("Failed to write to socket")
        }
    }

    func flush() {
    }

    private let sock: Int32
}