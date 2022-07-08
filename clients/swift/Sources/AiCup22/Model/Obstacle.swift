/// An obstacle on the map
public struct Obstacle {
    /// Unique id
    let id: Int32

    /// Center position
    let position: Vec2

    /// Obstacle's radius
    let radius: Double

    /// Whether units can see through this obstacle, or it blocks the view
    let canSeeThrough: Bool

    /// Whether projectiles can go through this obstacle
    let canShootThrough: Bool

    /// Read Obstacle from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Obstacle {
        var id: Int32
        id = stream.readInt32()
        var position: Vec2
        position = Vec2.readFrom(stream)
        var radius: Double
        radius = stream.readDouble()
        var canSeeThrough: Bool
        canSeeThrough = stream.readBool()
        var canShootThrough: Bool
        canShootThrough = stream.readBool()
        return Obstacle(id: id, position: position, radius: radius, canSeeThrough: canSeeThrough, canShootThrough: canShootThrough)
    }

    /// Write Obstacle to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeInt32(id)
        position.writeTo(stream)
        stream.writeDouble(radius)
        stream.writeBool(canSeeThrough)
        stream.writeBool(canShootThrough)
    }
}
