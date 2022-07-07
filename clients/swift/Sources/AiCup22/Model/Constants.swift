/// Non changing game state
public struct Constants {
    /// Number of ticks per game second
    let ticksPerSecond: Double

    /// Starting number of units in each team
    let teamSize: Int32

    /// Initial zone radius
    let initialZoneRadius: Double

    /// Speed of zone radius
    let zoneSpeed: Double

    /// Damage dealt to units outside of the zone per second
    let zoneDamagePerSecond: Double

    /// Unit spawning time
    let spawnTime: Double

    /// Damage dealt to units trying to spawn in incorrect position per second
    let spawnCollisionDamagePerSecond: Double

    /// Time required to perform looting actions (in seconds)
    let lootingTime: Double

    /// Number of bot players (teams)
    let botPlayers: Int32

    /// Units' radius
    let unitRadius: Double

    /// Max units' health
    let unitHealth: Double

    /// Health automatically restored per second
    let healthRegenerationPerSecond: Double

    /// Time until automatic health regeneration since last health damage (in seconds)
    let healthRegenerationDelay: Double

    /// Max value of unit's shield
    let maxShield: Double

    /// Initial value of unit's shield
    let spawnShield: Double

    /// Initial number of extra lives for units
    let extraLives: Int32

    /// Zone radius after which respawning is disabled
    let lastRespawnZoneRadius: Double

    /// Units' field of view without aiming (in degrees)
    let fieldOfView: Double

    /// Units' view distance
    let viewDistance: Double

    /// Whether units' view is blocked by obstacles
    let viewBlocking: Bool

    /// Unit rotation speed without aiming (degrees per second)
    let rotationSpeed: Double

    /// Units' movement speed while spawning
    let spawnMovementSpeed: Double

    /// Max unit speed when walking forward
    let maxUnitForwardSpeed: Double

    /// Max unit speed when walking backward
    let maxUnitBackwardSpeed: Double

    /// Max unit acceleration
    let unitAcceleration: Double

    /// Whether a unit can damage units of the same team
    let friendlyFire: Bool

    /// Score given for killing enemy unit
    let killScore: Double

    /// Score multiplier for damaging enemy units
    let damageScoreMultiplier: Double

    /// Score given for every team killed before you
    let scorePerPlace: Double

    /// List of properties of every weapon type
    let weapons: [WeaponProperties]

    /// Starting weapon with which units spawn, or None
    let startingWeapon: Int32?

    /// Ammo for starting weapon given when unit spawns
    let startingWeaponAmmo: Int32

    /// Max number of shield potions in unit's inventory
    let maxShieldPotionsInInventory: Int32

    /// Amount of shield restored using one potion
    let shieldPerPotion: Double

    /// Time required to perform action of using shield potion
    let shieldPotionUseTime: Double

    /// List of properties of every sound type
    let sounds: [SoundProperties]

    /// Sound type index when moving (starting with 0), or None
    let stepsSoundTypeIndex: Int32?

    /// Distance when steps sound will be 100% probability
    let stepsSoundTravelDistance: Double

    /// List of obstacles on the map
    let obstacles: [Obstacle]

    /// Read Constants from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Constants {
        var ticksPerSecond: Double
        ticksPerSecond = stream.readDouble()
        var teamSize: Int32
        teamSize = stream.readInt32()
        var initialZoneRadius: Double
        initialZoneRadius = stream.readDouble()
        var zoneSpeed: Double
        zoneSpeed = stream.readDouble()
        var zoneDamagePerSecond: Double
        zoneDamagePerSecond = stream.readDouble()
        var spawnTime: Double
        spawnTime = stream.readDouble()
        var spawnCollisionDamagePerSecond: Double
        spawnCollisionDamagePerSecond = stream.readDouble()
        var lootingTime: Double
        lootingTime = stream.readDouble()
        var botPlayers: Int32
        botPlayers = stream.readInt32()
        var unitRadius: Double
        unitRadius = stream.readDouble()
        var unitHealth: Double
        unitHealth = stream.readDouble()
        var healthRegenerationPerSecond: Double
        healthRegenerationPerSecond = stream.readDouble()
        var healthRegenerationDelay: Double
        healthRegenerationDelay = stream.readDouble()
        var maxShield: Double
        maxShield = stream.readDouble()
        var spawnShield: Double
        spawnShield = stream.readDouble()
        var extraLives: Int32
        extraLives = stream.readInt32()
        var lastRespawnZoneRadius: Double
        lastRespawnZoneRadius = stream.readDouble()
        var fieldOfView: Double
        fieldOfView = stream.readDouble()
        var viewDistance: Double
        viewDistance = stream.readDouble()
        var viewBlocking: Bool
        viewBlocking = stream.readBool()
        var rotationSpeed: Double
        rotationSpeed = stream.readDouble()
        var spawnMovementSpeed: Double
        spawnMovementSpeed = stream.readDouble()
        var maxUnitForwardSpeed: Double
        maxUnitForwardSpeed = stream.readDouble()
        var maxUnitBackwardSpeed: Double
        maxUnitBackwardSpeed = stream.readDouble()
        var unitAcceleration: Double
        unitAcceleration = stream.readDouble()
        var friendlyFire: Bool
        friendlyFire = stream.readBool()
        var killScore: Double
        killScore = stream.readDouble()
        var damageScoreMultiplier: Double
        damageScoreMultiplier = stream.readDouble()
        var scorePerPlace: Double
        scorePerPlace = stream.readDouble()
        var weapons: [WeaponProperties]
        let weaponsSize = stream.readInt32()
        weapons = (0..<weaponsSize).map{ _ in
            var weaponsSize: WeaponProperties
            weaponsSize = WeaponProperties.readFrom(stream)
            return weaponsSize
        }
        var startingWeapon: Int32?
        if stream.readBool() {
            startingWeapon = stream.readInt32()
        } else {
            startingWeapon = nil
        }
        var startingWeaponAmmo: Int32
        startingWeaponAmmo = stream.readInt32()
        var maxShieldPotionsInInventory: Int32
        maxShieldPotionsInInventory = stream.readInt32()
        var shieldPerPotion: Double
        shieldPerPotion = stream.readDouble()
        var shieldPotionUseTime: Double
        shieldPotionUseTime = stream.readDouble()
        var sounds: [SoundProperties]
        let soundsSize = stream.readInt32()
        sounds = (0..<soundsSize).map{ _ in
            var soundsSize: SoundProperties
            soundsSize = SoundProperties.readFrom(stream)
            return soundsSize
        }
        var stepsSoundTypeIndex: Int32?
        if stream.readBool() {
            stepsSoundTypeIndex = stream.readInt32()
        } else {
            stepsSoundTypeIndex = nil
        }
        var stepsSoundTravelDistance: Double
        stepsSoundTravelDistance = stream.readDouble()
        var obstacles: [Obstacle]
        let obstaclesSize = stream.readInt32()
        obstacles = (0..<obstaclesSize).map{ _ in
            var obstaclesSize: Obstacle
            obstaclesSize = Obstacle.readFrom(stream)
            return obstaclesSize
        }
        return Constants(ticksPerSecond: ticksPerSecond, teamSize: teamSize, initialZoneRadius: initialZoneRadius, zoneSpeed: zoneSpeed, zoneDamagePerSecond: zoneDamagePerSecond, spawnTime: spawnTime, spawnCollisionDamagePerSecond: spawnCollisionDamagePerSecond, lootingTime: lootingTime, botPlayers: botPlayers, unitRadius: unitRadius, unitHealth: unitHealth, healthRegenerationPerSecond: healthRegenerationPerSecond, healthRegenerationDelay: healthRegenerationDelay, maxShield: maxShield, spawnShield: spawnShield, extraLives: extraLives, lastRespawnZoneRadius: lastRespawnZoneRadius, fieldOfView: fieldOfView, viewDistance: viewDistance, viewBlocking: viewBlocking, rotationSpeed: rotationSpeed, spawnMovementSpeed: spawnMovementSpeed, maxUnitForwardSpeed: maxUnitForwardSpeed, maxUnitBackwardSpeed: maxUnitBackwardSpeed, unitAcceleration: unitAcceleration, friendlyFire: friendlyFire, killScore: killScore, damageScoreMultiplier: damageScoreMultiplier, scorePerPlace: scorePerPlace, weapons: weapons, startingWeapon: startingWeapon, startingWeaponAmmo: startingWeaponAmmo, maxShieldPotionsInInventory: maxShieldPotionsInInventory, shieldPerPotion: shieldPerPotion, shieldPotionUseTime: shieldPotionUseTime, sounds: sounds, stepsSoundTypeIndex: stepsSoundTypeIndex, stepsSoundTravelDistance: stepsSoundTravelDistance, obstacles: obstacles)
    }

    /// Write Constants to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeDouble(ticksPerSecond)
        stream.writeInt32(teamSize)
        stream.writeDouble(initialZoneRadius)
        stream.writeDouble(zoneSpeed)
        stream.writeDouble(zoneDamagePerSecond)
        stream.writeDouble(spawnTime)
        stream.writeDouble(spawnCollisionDamagePerSecond)
        stream.writeDouble(lootingTime)
        stream.writeInt32(botPlayers)
        stream.writeDouble(unitRadius)
        stream.writeDouble(unitHealth)
        stream.writeDouble(healthRegenerationPerSecond)
        stream.writeDouble(healthRegenerationDelay)
        stream.writeDouble(maxShield)
        stream.writeDouble(spawnShield)
        stream.writeInt32(extraLives)
        stream.writeDouble(lastRespawnZoneRadius)
        stream.writeDouble(fieldOfView)
        stream.writeDouble(viewDistance)
        stream.writeBool(viewBlocking)
        stream.writeDouble(rotationSpeed)
        stream.writeDouble(spawnMovementSpeed)
        stream.writeDouble(maxUnitForwardSpeed)
        stream.writeDouble(maxUnitBackwardSpeed)
        stream.writeDouble(unitAcceleration)
        stream.writeBool(friendlyFire)
        stream.writeDouble(killScore)
        stream.writeDouble(damageScoreMultiplier)
        stream.writeDouble(scorePerPlace)
        stream.writeInt32(Int32(weapons.count))
        for weaponsElement in weapons {
            weaponsElement.writeTo(stream)
        }
        if startingWeapon == nil {
            stream.writeBool(false)
        } else {
            stream.writeBool(true)
            let startingWeaponValue = startingWeapon!
            stream.writeInt32(startingWeaponValue)
        }
        stream.writeInt32(startingWeaponAmmo)
        stream.writeInt32(maxShieldPotionsInInventory)
        stream.writeDouble(shieldPerPotion)
        stream.writeDouble(shieldPotionUseTime)
        stream.writeInt32(Int32(sounds.count))
        for soundsElement in sounds {
            soundsElement.writeTo(stream)
        }
        if stepsSoundTypeIndex == nil {
            stream.writeBool(false)
        } else {
            stream.writeBool(true)
            let stepsSoundTypeIndexValue = stepsSoundTypeIndex!
            stream.writeInt32(stepsSoundTypeIndexValue)
        }
        stream.writeDouble(stepsSoundTravelDistance)
        stream.writeInt32(Int32(obstacles.count))
        for obstaclesElement in obstacles {
            obstaclesElement.writeTo(stream)
        }
    }
}