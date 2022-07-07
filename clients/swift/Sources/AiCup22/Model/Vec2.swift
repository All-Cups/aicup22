/// 2 dimensional vector.
public struct Vec2 {
    /// `x` coordinate of the vector
    let x: Double

    /// `y` coordinate of the vector
    let y: Double

    /// Read Vec2 from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Vec2 {
        var x: Double
        x = stream.readDouble()
        var y: Double
        y = stream.readDouble()
        return Vec2(x: x, y: y)
    }

    /// Write Vec2 to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeDouble(x)
        stream.writeDouble(y)
    }
}