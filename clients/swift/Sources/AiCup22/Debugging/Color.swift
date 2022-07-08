/// RGBA Color
public struct Color {
    /// Red component
    let r: Double

    /// Green component
    let g: Double

    /// Blue component
    let b: Double

    /// Alpha (opacity) component
    let a: Double

    /// Read Color from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Color {
        var r: Double
        r = stream.readDouble()
        var g: Double
        g = stream.readDouble()
        var b: Double
        b = stream.readDouble()
        var a: Double
        a = stream.readDouble()
        return Color(r: r, g: g, b: b, a: a)
    }

    /// Write Color to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeDouble(r)
        stream.writeDouble(g)
        stream.writeDouble(b)
        stream.writeDouble(a)
    }
}
