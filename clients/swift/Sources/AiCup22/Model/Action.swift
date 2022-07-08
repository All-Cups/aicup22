/// Action unit is currently performing
public struct Action {
    /// Tick when the action will be finished
    let finishTick: Int32

    /// Type of the action
    let actionType: ActionType

    /// Read Action from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Action {
        var finishTick: Int32
        finishTick = stream.readInt32()
        var actionType: ActionType
        actionType = ActionType.readFrom(stream)
        return Action(finishTick: finishTick, actionType: actionType)
    }

    /// Write Action to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeInt32(finishTick)
        actionType.writeTo(stream)
    }
}
