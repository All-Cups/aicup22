/// Point + color
public struct ColoredVertex {
    /// Position
    let position: Vec2

    /// Color
    let color: Color

    /// Read ColoredVertex from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> ColoredVertex {
        var position: Vec2
        position = Vec2.readFrom(stream)
        var color: Color
        color = Color.readFrom(stream)
        return ColoredVertex(position: position, color: color)
    }

    /// Write ColoredVertex to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        position.writeTo(stream)
        color.writeTo(stream)
    }
}