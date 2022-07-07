/// Debug commands that can be sent while debugging with the app
enum DebugCommand {
    /// Add debug data to current tick
    ///
    /// - debugData: Data to add
    case add(debugData: DebugData)

    /// Clear current tick's debug data
    ///
    case clear

    /// Enable/disable auto performing of commands
    ///
    /// - enable: Enable/disable autoflush
    case setAutoFlush(enable: Bool)

    /// Perform all previously sent commands
    ///
    case flush

    /// Read DebugCommand from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> DebugCommand {
        switch stream.readInt32() {
            case 0:
                var debugData: DebugData
                debugData = DebugData.readFrom(stream)
                return DebugCommand.add(debugData: debugData)
            case 1:
                return DebugCommand.clear
            case 2:
                var enable: Bool
                enable = stream.readBool()
                return DebugCommand.setAutoFlush(enable: enable)
            case 3:
                return DebugCommand.flush
            default:
                fatalError("Unexpected tag value")
        }
    }

    /// Write DebugCommand to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        switch self {
            case let .add(debugData):
                stream.writeInt32(0)
                debugData.writeTo(stream)
            case .clear:
                stream.writeInt32(1)
            case let .setAutoFlush(enable):
                stream.writeInt32(2)
                stream.writeBool(enable)
            case .flush:
                stream.writeInt32(3)
        }
    }
}