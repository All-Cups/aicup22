#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

class Runner {
    private let inputStream: BufferedInputStream
    private let outputStream: BufferedOutputStream

    init(_ host: String, _ port: Int, _ token: String) {
        let tcpStream = TcpStream(host, port)
        inputStream = BufferedInputStream(tcpStream)
        outputStream = BufferedOutputStream(tcpStream)
        outputStream.writeString(token)
        outputStream.writeInt32(1)
        outputStream.writeInt32(0)
        outputStream.writeInt32(1)
        outputStream.flush()
    }

    func run() {
        var strategy: MyStrategy? = nil
        let debugInterface = DebugInterface(inputStream, outputStream)
        mainloop: while true {
            switch ServerMessage.readFrom(inputStream) {
            case .updateConstants(let constants):
                strategy = MyStrategy(constants)
            case .getOrder(let playerView, let debugAvailable):
                let order = strategy!.getOrder(playerView, debugAvailable ? debugInterface : nil)
                ClientMessage.orderMessage(order: order).writeTo(outputStream)
                outputStream.flush()
            case .finish:
                strategy!.finish()
                break mainloop
            case .debugUpdate:
                strategy!.debugUpdate(debugInterface)
                ClientMessage.debugUpdateDone.writeTo(outputStream)
                outputStream.flush()
            }
        }
    }
}

let host = CommandLine.arguments.count < 2 ? "127.0.0.1" : CommandLine.arguments[1]
let port = CommandLine.arguments.count < 3 ? 31001 : Int(CommandLine.arguments[2])!
let token = CommandLine.arguments.count < 4 ? "0000000000000000" : CommandLine.arguments[3]

Runner(host, port, token).run()