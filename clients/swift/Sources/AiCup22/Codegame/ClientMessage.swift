/// Message sent from client
enum ClientMessage {
    /// Ask app to perform new debug command
    ///
    /// - command: Command to perform
    case debugMessage(command: DebugCommand)

    /// Reply for ServerMessage::GetOrder
    ///
    /// - order: Player's order
    case orderMessage(order: Order)

    /// Signifies finish of the debug update
    ///
    case debugUpdateDone

    /// Request debug state from the app
    ///
    case requestDebugState

    /// Read ClientMessage from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> ClientMessage {
        switch stream.readInt32() {
            case 0:
                var command: DebugCommand
                command = DebugCommand.readFrom(stream)
                return ClientMessage.debugMessage(command: command)
            case 1:
                var order: Order
                order = Order.readFrom(stream)
                return ClientMessage.orderMessage(order: order)
            case 2:
                return ClientMessage.debugUpdateDone
            case 3:
                return ClientMessage.requestDebugState
            default:
                fatalError("Unexpected tag value")
        }
    }

    /// Write ClientMessage to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        switch self {
            case let .debugMessage(command):
                stream.writeInt32(0)
                command.writeTo(stream)
            case let .orderMessage(order):
                stream.writeInt32(1)
                order.writeTo(stream)
            case .debugUpdateDone:
                stream.writeInt32(2)
            case .requestDebugState:
                stream.writeInt32(3)
        }
    }
}