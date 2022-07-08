/// Message sent from server
enum ServerMessage {
    /// Update constants
    ///
    /// - constants: New constants
    case updateConstants(constants: Constants)

    /// Get order for next tick
    ///
    /// - playerView: Player's view
    /// - debugAvailable: Whether app is running with debug interface available
    case getOrder(playerView: Game, debugAvailable: Bool)

    /// Signifies end of the game
    ///
    case finish

    /// Debug update
    ///
    case debugUpdate

    /// Read ServerMessage from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> ServerMessage {
        switch stream.readInt32() {
            case 0:
                var constants: Constants
                constants = Constants.readFrom(stream)
                return ServerMessage.updateConstants(constants: constants)
            case 1:
                var playerView: Game
                playerView = Game.readFrom(stream)
                var debugAvailable: Bool
                debugAvailable = stream.readBool()
                return ServerMessage.getOrder(playerView: playerView, debugAvailable: debugAvailable)
            case 2:
                return ServerMessage.finish
            case 3:
                return ServerMessage.debugUpdate
            default:
                fatalError("Unexpected tag value")
        }
    }

    /// Write ServerMessage to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        switch self {
            case let .updateConstants(constants):
                stream.writeInt32(0)
                constants.writeTo(stream)
            case let .getOrder(playerView, debugAvailable):
                stream.writeInt32(1)
                playerView.writeTo(stream)
                stream.writeBool(debugAvailable)
            case .finish:
                stream.writeInt32(2)
            case .debugUpdate:
                stream.writeInt32(3)
        }
    }
}
