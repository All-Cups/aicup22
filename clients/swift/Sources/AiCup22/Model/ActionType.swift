/// Type of action a unit is currently performing
public enum ActionType: Int32 {
    /// Picking up or dropping loot
    case looting = 0

    /// Using a shield potion
    case useShieldPotion = 1

    /// Read ActionType from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> ActionType {
        return ActionType(rawValue: stream.readInt32())!
    }

    /// Write ActionType to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeInt32(rawValue)
    }
}
