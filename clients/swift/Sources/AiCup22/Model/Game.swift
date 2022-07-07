/// Current game's state
public struct Game {
    /// Your player's id
    let myId: Int32

    /// List of players (teams)
    let players: [Player]

    /// Current tick
    let currentTick: Int32

    /// List of units visible by your team
    let units: [Unit]

    /// List of loot visible by your team
    let loot: [Loot]

    /// List of projectiles visible by your team
    let projectiles: [Projectile]

    /// Current state of game zone
    let zone: Zone

    /// List of sounds heard by your team during last tick
    let sounds: [Sound]

    /// Read Game from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Game {
        var myId: Int32
        myId = stream.readInt32()
        var players: [Player]
        let playersSize = stream.readInt32()
        players = (0..<playersSize).map{ _ in
            var playersSize: Player
            playersSize = Player.readFrom(stream)
            return playersSize
        }
        var currentTick: Int32
        currentTick = stream.readInt32()
        var units: [Unit]
        let unitsSize = stream.readInt32()
        units = (0..<unitsSize).map{ _ in
            var unitsSize: Unit
            unitsSize = Unit.readFrom(stream)
            return unitsSize
        }
        var loot: [Loot]
        let lootSize = stream.readInt32()
        loot = (0..<lootSize).map{ _ in
            var lootSize: Loot
            lootSize = Loot.readFrom(stream)
            return lootSize
        }
        var projectiles: [Projectile]
        let projectilesSize = stream.readInt32()
        projectiles = (0..<projectilesSize).map{ _ in
            var projectilesSize: Projectile
            projectilesSize = Projectile.readFrom(stream)
            return projectilesSize
        }
        var zone: Zone
        zone = Zone.readFrom(stream)
        var sounds: [Sound]
        let soundsSize = stream.readInt32()
        sounds = (0..<soundsSize).map{ _ in
            var soundsSize: Sound
            soundsSize = Sound.readFrom(stream)
            return soundsSize
        }
        return Game(myId: myId, players: players, currentTick: currentTick, units: units, loot: loot, projectiles: projectiles, zone: zone, sounds: sounds)
    }

    /// Write Game to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeInt32(myId)
        stream.writeInt32(Int32(players.count))
        for playersElement in players {
            playersElement.writeTo(stream)
        }
        stream.writeInt32(currentTick)
        stream.writeInt32(Int32(units.count))
        for unitsElement in units {
            unitsElement.writeTo(stream)
        }
        stream.writeInt32(Int32(loot.count))
        for lootElement in loot {
            lootElement.writeTo(stream)
        }
        stream.writeInt32(Int32(projectiles.count))
        for projectilesElement in projectiles {
            projectilesElement.writeTo(stream)
        }
        zone.writeTo(stream)
        stream.writeInt32(Int32(sounds.count))
        for soundsElement in sounds {
            soundsElement.writeTo(stream)
        }
    }
}