/// Sound heard by one of your units
public struct Sound {
    /// Sound type index (starting with 0)
    let typeIndex: Int32

    /// Id of unit that heard this sound
    let unitId: Int32

    /// Position where sound was heard (different from sound source position)
    let position: Vec2

    /// Read Sound from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Sound {
        var typeIndex: Int32
        typeIndex = stream.readInt32()
        var unitId: Int32
        unitId = stream.readInt32()
        var position: Vec2
        position = Vec2.readFrom(stream)
        return Sound(typeIndex: typeIndex, unitId: unitId, position: position)
    }

    /// Write Sound to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeInt32(typeIndex)
        stream.writeInt32(unitId)
        position.writeTo(stream)
    }
}
