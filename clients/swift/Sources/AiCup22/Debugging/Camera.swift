/// Camera state
public struct Camera {
    /// Center
    let center: Vec2

    /// Rotation
    let rotation: Double

    /// Attack angle
    let attack: Double

    /// Vertical field of view
    let fov: Double

    /// Read Camera from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Camera {
        var center: Vec2
        center = Vec2.readFrom(stream)
        var rotation: Double
        rotation = stream.readDouble()
        var attack: Double
        attack = stream.readDouble()
        var fov: Double
        fov = stream.readDouble()
        return Camera(center: center, rotation: rotation, attack: attack, fov: fov)
    }

    /// Write Camera to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        center.writeTo(stream)
        stream.writeDouble(rotation)
        stream.writeDouble(attack)
        stream.writeDouble(fov)
    }
}
