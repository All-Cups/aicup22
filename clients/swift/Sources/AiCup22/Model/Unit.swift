/// A unit
public struct Unit {
    /// Unique id
    let id: Int32

    /// Id of the player (team) controlling the unit
    let playerId: Int32

    /// Current health
    let health: Double

    /// Current shield value
    let shield: Double

    /// Left extra lives of this unit
    let extraLives: Int32

    /// Current position of unit's center
    let position: Vec2

    /// Remaining time until unit will be spawned, or None
    let remainingSpawnTime: Double?

    /// Current velocity
    let velocity: Vec2

    /// Current view direction (vector of length 1)
    let direction: Vec2

    /// Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
    let aim: Double

    /// Current action unit is performing, or None
    let action: Action?

    /// Tick when health regeneration will start (can be less than current game tick)
    let healthRegenerationStartTick: Int32

    /// Index of the weapon this unit is holding (starting with 0), or None
    let weapon: Int32?

    /// Next tick when unit can shoot again (can be less than current game tick)
    let nextShotTick: Int32

    /// List of ammo in unit's inventory for every weapon type
    let ammo: [Int32]

    /// Number of shield potions in inventory
    let shieldPotions: Int32

    /// Read Unit from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Unit {
        var id: Int32
        id = stream.readInt32()
        var playerId: Int32
        playerId = stream.readInt32()
        var health: Double
        health = stream.readDouble()
        var shield: Double
        shield = stream.readDouble()
        var extraLives: Int32
        extraLives = stream.readInt32()
        var position: Vec2
        position = Vec2.readFrom(stream)
        var remainingSpawnTime: Double?
        if stream.readBool() {
            remainingSpawnTime = stream.readDouble()
        } else {
            remainingSpawnTime = nil
        }
        var velocity: Vec2
        velocity = Vec2.readFrom(stream)
        var direction: Vec2
        direction = Vec2.readFrom(stream)
        var aim: Double
        aim = stream.readDouble()
        var action: Action?
        if stream.readBool() {
            action = Action.readFrom(stream)
        } else {
            action = nil
        }
        var healthRegenerationStartTick: Int32
        healthRegenerationStartTick = stream.readInt32()
        var weapon: Int32?
        if stream.readBool() {
            weapon = stream.readInt32()
        } else {
            weapon = nil
        }
        var nextShotTick: Int32
        nextShotTick = stream.readInt32()
        var ammo: [Int32]
        let ammoSize = stream.readInt32()
        ammo = (0..<ammoSize).map{ _ in
            var ammoSize: Int32
            ammoSize = stream.readInt32()
            return ammoSize
        }
        var shieldPotions: Int32
        shieldPotions = stream.readInt32()
        return Unit(id: id, playerId: playerId, health: health, shield: shield, extraLives: extraLives, position: position, remainingSpawnTime: remainingSpawnTime, velocity: velocity, direction: direction, aim: aim, action: action, healthRegenerationStartTick: healthRegenerationStartTick, weapon: weapon, nextShotTick: nextShotTick, ammo: ammo, shieldPotions: shieldPotions)
    }

    /// Write Unit to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeInt32(id)
        stream.writeInt32(playerId)
        stream.writeDouble(health)
        stream.writeDouble(shield)
        stream.writeInt32(extraLives)
        position.writeTo(stream)
        if remainingSpawnTime == nil {
            stream.writeBool(false)
        } else {
            stream.writeBool(true)
            let remainingSpawnTimeValue = remainingSpawnTime!
            stream.writeDouble(remainingSpawnTimeValue)
        }
        velocity.writeTo(stream)
        direction.writeTo(stream)
        stream.writeDouble(aim)
        if action == nil {
            stream.writeBool(false)
        } else {
            stream.writeBool(true)
            let actionValue = action!
            actionValue.writeTo(stream)
        }
        stream.writeInt32(healthRegenerationStartTick)
        if weapon == nil {
            stream.writeBool(false)
        } else {
            stream.writeBool(true)
            let weaponValue = weapon!
            stream.writeInt32(weaponValue)
        }
        stream.writeInt32(nextShotTick)
        stream.writeInt32(Int32(ammo.count))
        for ammoElement in ammo {
            stream.writeInt32(ammoElement)
        }
        stream.writeInt32(shieldPotions)
    }
}