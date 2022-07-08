/// Renderer's state
public struct DebugState {
    /// Pressed keys
    let pressedKeys: [String]

    /// Cursor's position in game coordinates
    let cursorWorldPosition: Vec2

    /// Id of unit which is followed by the camera, or None
    let lockedUnit: Int32?

    /// Current camera state
    let camera: Camera

    /// Read DebugState from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> DebugState {
        var pressedKeys: [String]
        let pressedKeysSize = stream.readInt32()
        pressedKeys = (0..<pressedKeysSize).map{ _ in
            var pressedKeysSize: String
            pressedKeysSize = stream.readString()
            return pressedKeysSize
        }
        var cursorWorldPosition: Vec2
        cursorWorldPosition = Vec2.readFrom(stream)
        var lockedUnit: Int32?
        if stream.readBool() {
            lockedUnit = stream.readInt32()
        } else {
            lockedUnit = nil
        }
        var camera: Camera
        camera = Camera.readFrom(stream)
        return DebugState(pressedKeys: pressedKeys, cursorWorldPosition: cursorWorldPosition, lockedUnit: lockedUnit, camera: camera)
    }

    /// Write DebugState to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeInt32(Int32(pressedKeys.count))
        for pressedKeysElement in pressedKeys {
            stream.writeString(pressedKeysElement)
        }
        cursorWorldPosition.writeTo(stream)
        if lockedUnit == nil {
            stream.writeBool(false)
        } else {
            stream.writeBool(true)
            let lockedUnitValue = lockedUnit!
            stream.writeInt32(lockedUnitValue)
        }
        camera.writeTo(stream)
    }
}
