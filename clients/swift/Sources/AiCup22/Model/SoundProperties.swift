/// Sound properties
public struct SoundProperties {
    /// Name
    let name: String

    /// Distance from which the sound can be heard
    let distance: Double

    /// Offset modifier
    let offset: Double

    /// Read SoundProperties from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> SoundProperties {
        var name: String
        name = stream.readString()
        var distance: Double
        distance = stream.readDouble()
        var offset: Double
        offset = stream.readDouble()
        return SoundProperties(name: name, distance: distance, offset: offset)
    }

    /// Write SoundProperties to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeString(name)
        stream.writeDouble(distance)
        stream.writeDouble(offset)
    }
}