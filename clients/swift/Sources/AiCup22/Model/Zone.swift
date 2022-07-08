/// Current state of the game zone
public struct Zone {
    /// Current center
    let currentCenter: Vec2

    /// Current radius
    let currentRadius: Double

    /// Next center
    let nextCenter: Vec2

    /// Next radius
    let nextRadius: Double

    /// Read Zone from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Zone {
        var currentCenter: Vec2
        currentCenter = Vec2.readFrom(stream)
        var currentRadius: Double
        currentRadius = stream.readDouble()
        var nextCenter: Vec2
        nextCenter = Vec2.readFrom(stream)
        var nextRadius: Double
        nextRadius = stream.readDouble()
        return Zone(currentCenter: currentCenter, currentRadius: currentRadius, nextCenter: nextCenter, nextRadius: nextRadius)
    }

    /// Write Zone to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        currentCenter.writeTo(stream)
        stream.writeDouble(currentRadius)
        nextCenter.writeTo(stream)
        stream.writeDouble(nextRadius)
    }
}
