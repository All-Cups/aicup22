/// Loot lying on the ground
public struct Loot {
    /// Unique id
    let id: Int32

    /// Position
    let position: Vec2

    /// Item
    let item: Item

    /// Read Loot from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Loot {
        var id: Int32
        id = stream.readInt32()
        var position: Vec2
        position = Vec2.readFrom(stream)
        var item: Item
        item = Item.readFrom(stream)
        return Loot(id: id, position: position, item: item)
    }

    /// Write Loot to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeInt32(id)
        position.writeTo(stream)
        item.writeTo(stream)
    }
}