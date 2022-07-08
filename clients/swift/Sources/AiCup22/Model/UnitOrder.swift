/// Order for specific unit
public struct UnitOrder {
    /// Target moving velocity
    let targetVelocity: Vec2

    /// Target view direction (vector length doesn't matter)
    let targetDirection: Vec2

    /// Order to perform an action, or None
    let action: ActionOrder?

    /// Read UnitOrder from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> UnitOrder {
        var targetVelocity: Vec2
        targetVelocity = Vec2.readFrom(stream)
        var targetDirection: Vec2
        targetDirection = Vec2.readFrom(stream)
        var action: ActionOrder?
        if stream.readBool() {
            action = ActionOrder.readFrom(stream)
        } else {
            action = nil
        }
        return UnitOrder(targetVelocity: targetVelocity, targetDirection: targetDirection, action: action)
    }

    /// Write UnitOrder to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        targetVelocity.writeTo(stream)
        targetDirection.writeTo(stream)
        if action == nil {
            stream.writeBool(false)
        } else {
            stream.writeBool(true)
            let actionValue = action!
            actionValue.writeTo(stream)
        }
    }
}
