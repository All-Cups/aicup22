/// Game's participant (team of units)
public struct Player {
    /// Unique id
    let id: Int32

    /// Number of kills
    let kills: Int32

    /// Total damage dealt to enemies
    let damage: Double

    /// Survival place (number of survivor teams currently/at the moment of death)
    let place: Int32

    /// Team score
    let score: Double

    /// Read Player from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Player {
        var id: Int32
        id = stream.readInt32()
        var kills: Int32
        kills = stream.readInt32()
        var damage: Double
        damage = stream.readDouble()
        var place: Int32
        place = stream.readInt32()
        var score: Double
        score = stream.readDouble()
        return Player(id: id, kills: kills, damage: damage, place: place, score: score)
    }

    /// Write Player to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeInt32(id)
        stream.writeInt32(kills)
        stream.writeDouble(damage)
        stream.writeInt32(place)
        stream.writeDouble(score)
    }
}
