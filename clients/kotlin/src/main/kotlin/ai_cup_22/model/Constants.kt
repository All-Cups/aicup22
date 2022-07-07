package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Non changing game state
 */
class Constants {
    /**
     * Number of ticks per game second
     */
    var ticksPerSecond: Double
    /**
     * Starting number of units in each team
     */
    var teamSize: Int
    /**
     * Initial zone radius
     */
    var initialZoneRadius: Double
    /**
     * Speed of zone radius
     */
    var zoneSpeed: Double
    /**
     * Damage dealt to units outside of the zone per second
     */
    var zoneDamagePerSecond: Double
    /**
     * Unit spawning time
     */
    var spawnTime: Double
    /**
     * Damage dealt to units trying to spawn in incorrect position per second
     */
    var spawnCollisionDamagePerSecond: Double
    /**
     * Time required to perform looting actions (in seconds)
     */
    var lootingTime: Double
    /**
     * Number of bot players (teams)
     */
    var botPlayers: Int
    /**
     * Units' radius
     */
    var unitRadius: Double
    /**
     * Max units' health
     */
    var unitHealth: Double
    /**
     * Health automatically restored per second
     */
    var healthRegenerationPerSecond: Double
    /**
     * Time until automatic health regeneration since last health damage (in seconds)
     */
    var healthRegenerationDelay: Double
    /**
     * Max value of unit's shield
     */
    var maxShield: Double
    /**
     * Initial value of unit's shield
     */
    var spawnShield: Double
    /**
     * Initial number of extra lives for units
     */
    var extraLives: Int
    /**
     * Zone radius after which respawning is disabled
     */
    var lastRespawnZoneRadius: Double
    /**
     * Units' field of view without aiming (in degrees)
     */
    var fieldOfView: Double
    /**
     * Units' view distance
     */
    var viewDistance: Double
    /**
     * Whether units' view is blocked by obstacles
     */
    var viewBlocking: Boolean
    /**
     * Unit rotation speed without aiming (degrees per second)
     */
    var rotationSpeed: Double
    /**
     * Units' movement speed while spawning
     */
    var spawnMovementSpeed: Double
    /**
     * Max unit speed when walking forward
     */
    var maxUnitForwardSpeed: Double
    /**
     * Max unit speed when walking backward
     */
    var maxUnitBackwardSpeed: Double
    /**
     * Max unit acceleration
     */
    var unitAcceleration: Double
    /**
     * Whether a unit can damage units of the same team
     */
    var friendlyFire: Boolean
    /**
     * Score given for killing enemy unit
     */
    var killScore: Double
    /**
     * Score multiplier for damaging enemy units
     */
    var damageScoreMultiplier: Double
    /**
     * Score given for every team killed before you
     */
    var scorePerPlace: Double
    /**
     * List of properties of every weapon type
     */
    var weapons: Array<ai_cup_22.model.WeaponProperties>
    /**
     * Starting weapon with which units spawn, or None
     */
    var startingWeapon: Int?
    /**
     * Ammo for starting weapon given when unit spawns
     */
    var startingWeaponAmmo: Int
    /**
     * Max number of shield potions in unit's inventory
     */
    var maxShieldPotionsInInventory: Int
    /**
     * Amount of shield restored using one potion
     */
    var shieldPerPotion: Double
    /**
     * Time required to perform action of using shield potion
     */
    var shieldPotionUseTime: Double
    /**
     * List of properties of every sound type
     */
    var sounds: Array<ai_cup_22.model.SoundProperties>
    /**
     * Sound type index when moving (starting with 0), or None
     */
    var stepsSoundTypeIndex: Int?
    /**
     * Distance when steps sound will be 100% probability
     */
    var stepsSoundTravelDistance: Double
    /**
     * List of obstacles on the map
     */
    var obstacles: Array<ai_cup_22.model.Obstacle>

    constructor(ticksPerSecond: Double, teamSize: Int, initialZoneRadius: Double, zoneSpeed: Double, zoneDamagePerSecond: Double, spawnTime: Double, spawnCollisionDamagePerSecond: Double, lootingTime: Double, botPlayers: Int, unitRadius: Double, unitHealth: Double, healthRegenerationPerSecond: Double, healthRegenerationDelay: Double, maxShield: Double, spawnShield: Double, extraLives: Int, lastRespawnZoneRadius: Double, fieldOfView: Double, viewDistance: Double, viewBlocking: Boolean, rotationSpeed: Double, spawnMovementSpeed: Double, maxUnitForwardSpeed: Double, maxUnitBackwardSpeed: Double, unitAcceleration: Double, friendlyFire: Boolean, killScore: Double, damageScoreMultiplier: Double, scorePerPlace: Double, weapons: Array<ai_cup_22.model.WeaponProperties>, startingWeapon: Int?, startingWeaponAmmo: Int, maxShieldPotionsInInventory: Int, shieldPerPotion: Double, shieldPotionUseTime: Double, sounds: Array<ai_cup_22.model.SoundProperties>, stepsSoundTypeIndex: Int?, stepsSoundTravelDistance: Double, obstacles: Array<ai_cup_22.model.Obstacle>) {
        this.ticksPerSecond = ticksPerSecond
        this.teamSize = teamSize
        this.initialZoneRadius = initialZoneRadius
        this.zoneSpeed = zoneSpeed
        this.zoneDamagePerSecond = zoneDamagePerSecond
        this.spawnTime = spawnTime
        this.spawnCollisionDamagePerSecond = spawnCollisionDamagePerSecond
        this.lootingTime = lootingTime
        this.botPlayers = botPlayers
        this.unitRadius = unitRadius
        this.unitHealth = unitHealth
        this.healthRegenerationPerSecond = healthRegenerationPerSecond
        this.healthRegenerationDelay = healthRegenerationDelay
        this.maxShield = maxShield
        this.spawnShield = spawnShield
        this.extraLives = extraLives
        this.lastRespawnZoneRadius = lastRespawnZoneRadius
        this.fieldOfView = fieldOfView
        this.viewDistance = viewDistance
        this.viewBlocking = viewBlocking
        this.rotationSpeed = rotationSpeed
        this.spawnMovementSpeed = spawnMovementSpeed
        this.maxUnitForwardSpeed = maxUnitForwardSpeed
        this.maxUnitBackwardSpeed = maxUnitBackwardSpeed
        this.unitAcceleration = unitAcceleration
        this.friendlyFire = friendlyFire
        this.killScore = killScore
        this.damageScoreMultiplier = damageScoreMultiplier
        this.scorePerPlace = scorePerPlace
        this.weapons = weapons
        this.startingWeapon = startingWeapon
        this.startingWeaponAmmo = startingWeaponAmmo
        this.maxShieldPotionsInInventory = maxShieldPotionsInInventory
        this.shieldPerPotion = shieldPerPotion
        this.shieldPotionUseTime = shieldPotionUseTime
        this.sounds = sounds
        this.stepsSoundTypeIndex = stepsSoundTypeIndex
        this.stepsSoundTravelDistance = stepsSoundTravelDistance
        this.obstacles = obstacles
    }

    /**
     * Write Constants to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeDouble(stream, ticksPerSecond)
        StreamUtil.writeInt(stream, teamSize)
        StreamUtil.writeDouble(stream, initialZoneRadius)
        StreamUtil.writeDouble(stream, zoneSpeed)
        StreamUtil.writeDouble(stream, zoneDamagePerSecond)
        StreamUtil.writeDouble(stream, spawnTime)
        StreamUtil.writeDouble(stream, spawnCollisionDamagePerSecond)
        StreamUtil.writeDouble(stream, lootingTime)
        StreamUtil.writeInt(stream, botPlayers)
        StreamUtil.writeDouble(stream, unitRadius)
        StreamUtil.writeDouble(stream, unitHealth)
        StreamUtil.writeDouble(stream, healthRegenerationPerSecond)
        StreamUtil.writeDouble(stream, healthRegenerationDelay)
        StreamUtil.writeDouble(stream, maxShield)
        StreamUtil.writeDouble(stream, spawnShield)
        StreamUtil.writeInt(stream, extraLives)
        StreamUtil.writeDouble(stream, lastRespawnZoneRadius)
        StreamUtil.writeDouble(stream, fieldOfView)
        StreamUtil.writeDouble(stream, viewDistance)
        StreamUtil.writeBoolean(stream, viewBlocking)
        StreamUtil.writeDouble(stream, rotationSpeed)
        StreamUtil.writeDouble(stream, spawnMovementSpeed)
        StreamUtil.writeDouble(stream, maxUnitForwardSpeed)
        StreamUtil.writeDouble(stream, maxUnitBackwardSpeed)
        StreamUtil.writeDouble(stream, unitAcceleration)
        StreamUtil.writeBoolean(stream, friendlyFire)
        StreamUtil.writeDouble(stream, killScore)
        StreamUtil.writeDouble(stream, damageScoreMultiplier)
        StreamUtil.writeDouble(stream, scorePerPlace)
        StreamUtil.writeInt(stream, weapons.size)
        for (weaponsElement in weapons) {
            weaponsElement.writeTo(stream)
        }
        val startingWeaponValue = startingWeapon
        if (startingWeaponValue == null) {
            StreamUtil.writeBoolean(stream, false)
        } else {
            StreamUtil.writeBoolean(stream, true)
            StreamUtil.writeInt(stream, startingWeaponValue)
        }
        StreamUtil.writeInt(stream, startingWeaponAmmo)
        StreamUtil.writeInt(stream, maxShieldPotionsInInventory)
        StreamUtil.writeDouble(stream, shieldPerPotion)
        StreamUtil.writeDouble(stream, shieldPotionUseTime)
        StreamUtil.writeInt(stream, sounds.size)
        for (soundsElement in sounds) {
            soundsElement.writeTo(stream)
        }
        val stepsSoundTypeIndexValue = stepsSoundTypeIndex
        if (stepsSoundTypeIndexValue == null) {
            StreamUtil.writeBoolean(stream, false)
        } else {
            StreamUtil.writeBoolean(stream, true)
            StreamUtil.writeInt(stream, stepsSoundTypeIndexValue)
        }
        StreamUtil.writeDouble(stream, stepsSoundTravelDistance)
        StreamUtil.writeInt(stream, obstacles.size)
        for (obstaclesElement in obstacles) {
            obstaclesElement.writeTo(stream)
        }
    }

    /**
     * Get string representation of Constants
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Constants { ")
        stringBuilder.append("ticksPerSecond: ")
        stringBuilder.append(ticksPerSecond)
        stringBuilder.append(", ")
        stringBuilder.append("teamSize: ")
        stringBuilder.append(teamSize)
        stringBuilder.append(", ")
        stringBuilder.append("initialZoneRadius: ")
        stringBuilder.append(initialZoneRadius)
        stringBuilder.append(", ")
        stringBuilder.append("zoneSpeed: ")
        stringBuilder.append(zoneSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("zoneDamagePerSecond: ")
        stringBuilder.append(zoneDamagePerSecond)
        stringBuilder.append(", ")
        stringBuilder.append("spawnTime: ")
        stringBuilder.append(spawnTime)
        stringBuilder.append(", ")
        stringBuilder.append("spawnCollisionDamagePerSecond: ")
        stringBuilder.append(spawnCollisionDamagePerSecond)
        stringBuilder.append(", ")
        stringBuilder.append("lootingTime: ")
        stringBuilder.append(lootingTime)
        stringBuilder.append(", ")
        stringBuilder.append("botPlayers: ")
        stringBuilder.append(botPlayers)
        stringBuilder.append(", ")
        stringBuilder.append("unitRadius: ")
        stringBuilder.append(unitRadius)
        stringBuilder.append(", ")
        stringBuilder.append("unitHealth: ")
        stringBuilder.append(unitHealth)
        stringBuilder.append(", ")
        stringBuilder.append("healthRegenerationPerSecond: ")
        stringBuilder.append(healthRegenerationPerSecond)
        stringBuilder.append(", ")
        stringBuilder.append("healthRegenerationDelay: ")
        stringBuilder.append(healthRegenerationDelay)
        stringBuilder.append(", ")
        stringBuilder.append("maxShield: ")
        stringBuilder.append(maxShield)
        stringBuilder.append(", ")
        stringBuilder.append("spawnShield: ")
        stringBuilder.append(spawnShield)
        stringBuilder.append(", ")
        stringBuilder.append("extraLives: ")
        stringBuilder.append(extraLives)
        stringBuilder.append(", ")
        stringBuilder.append("lastRespawnZoneRadius: ")
        stringBuilder.append(lastRespawnZoneRadius)
        stringBuilder.append(", ")
        stringBuilder.append("fieldOfView: ")
        stringBuilder.append(fieldOfView)
        stringBuilder.append(", ")
        stringBuilder.append("viewDistance: ")
        stringBuilder.append(viewDistance)
        stringBuilder.append(", ")
        stringBuilder.append("viewBlocking: ")
        stringBuilder.append(viewBlocking)
        stringBuilder.append(", ")
        stringBuilder.append("rotationSpeed: ")
        stringBuilder.append(rotationSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("spawnMovementSpeed: ")
        stringBuilder.append(spawnMovementSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("maxUnitForwardSpeed: ")
        stringBuilder.append(maxUnitForwardSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("maxUnitBackwardSpeed: ")
        stringBuilder.append(maxUnitBackwardSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("unitAcceleration: ")
        stringBuilder.append(unitAcceleration)
        stringBuilder.append(", ")
        stringBuilder.append("friendlyFire: ")
        stringBuilder.append(friendlyFire)
        stringBuilder.append(", ")
        stringBuilder.append("killScore: ")
        stringBuilder.append(killScore)
        stringBuilder.append(", ")
        stringBuilder.append("damageScoreMultiplier: ")
        stringBuilder.append(damageScoreMultiplier)
        stringBuilder.append(", ")
        stringBuilder.append("scorePerPlace: ")
        stringBuilder.append(scorePerPlace)
        stringBuilder.append(", ")
        stringBuilder.append("weapons: ")
        stringBuilder.append("[ ")
        var weaponsIndex = 0
        for (weaponsElement in weapons) {
            if (weaponsIndex != 0) {
                stringBuilder.append(", ")
            }
            stringBuilder.append(weaponsElement)
            weaponsIndex++
        }
        stringBuilder.append(" ]")
        stringBuilder.append(", ")
        stringBuilder.append("startingWeapon: ")
        stringBuilder.append(startingWeapon)
        stringBuilder.append(", ")
        stringBuilder.append("startingWeaponAmmo: ")
        stringBuilder.append(startingWeaponAmmo)
        stringBuilder.append(", ")
        stringBuilder.append("maxShieldPotionsInInventory: ")
        stringBuilder.append(maxShieldPotionsInInventory)
        stringBuilder.append(", ")
        stringBuilder.append("shieldPerPotion: ")
        stringBuilder.append(shieldPerPotion)
        stringBuilder.append(", ")
        stringBuilder.append("shieldPotionUseTime: ")
        stringBuilder.append(shieldPotionUseTime)
        stringBuilder.append(", ")
        stringBuilder.append("sounds: ")
        stringBuilder.append("[ ")
        var soundsIndex = 0
        for (soundsElement in sounds) {
            if (soundsIndex != 0) {
                stringBuilder.append(", ")
            }
            stringBuilder.append(soundsElement)
            soundsIndex++
        }
        stringBuilder.append(" ]")
        stringBuilder.append(", ")
        stringBuilder.append("stepsSoundTypeIndex: ")
        stringBuilder.append(stepsSoundTypeIndex)
        stringBuilder.append(", ")
        stringBuilder.append("stepsSoundTravelDistance: ")
        stringBuilder.append(stepsSoundTravelDistance)
        stringBuilder.append(", ")
        stringBuilder.append("obstacles: ")
        stringBuilder.append("[ ")
        var obstaclesIndex = 0
        for (obstaclesElement in obstacles) {
            if (obstaclesIndex != 0) {
                stringBuilder.append(", ")
            }
            stringBuilder.append(obstaclesElement)
            obstaclesIndex++
        }
        stringBuilder.append(" ]")
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Constants from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Constants {
            var ticksPerSecond: Double
            ticksPerSecond = StreamUtil.readDouble(stream)
            var teamSize: Int
            teamSize = StreamUtil.readInt(stream)
            var initialZoneRadius: Double
            initialZoneRadius = StreamUtil.readDouble(stream)
            var zoneSpeed: Double
            zoneSpeed = StreamUtil.readDouble(stream)
            var zoneDamagePerSecond: Double
            zoneDamagePerSecond = StreamUtil.readDouble(stream)
            var spawnTime: Double
            spawnTime = StreamUtil.readDouble(stream)
            var spawnCollisionDamagePerSecond: Double
            spawnCollisionDamagePerSecond = StreamUtil.readDouble(stream)
            var lootingTime: Double
            lootingTime = StreamUtil.readDouble(stream)
            var botPlayers: Int
            botPlayers = StreamUtil.readInt(stream)
            var unitRadius: Double
            unitRadius = StreamUtil.readDouble(stream)
            var unitHealth: Double
            unitHealth = StreamUtil.readDouble(stream)
            var healthRegenerationPerSecond: Double
            healthRegenerationPerSecond = StreamUtil.readDouble(stream)
            var healthRegenerationDelay: Double
            healthRegenerationDelay = StreamUtil.readDouble(stream)
            var maxShield: Double
            maxShield = StreamUtil.readDouble(stream)
            var spawnShield: Double
            spawnShield = StreamUtil.readDouble(stream)
            var extraLives: Int
            extraLives = StreamUtil.readInt(stream)
            var lastRespawnZoneRadius: Double
            lastRespawnZoneRadius = StreamUtil.readDouble(stream)
            var fieldOfView: Double
            fieldOfView = StreamUtil.readDouble(stream)
            var viewDistance: Double
            viewDistance = StreamUtil.readDouble(stream)
            var viewBlocking: Boolean
            viewBlocking = StreamUtil.readBoolean(stream)
            var rotationSpeed: Double
            rotationSpeed = StreamUtil.readDouble(stream)
            var spawnMovementSpeed: Double
            spawnMovementSpeed = StreamUtil.readDouble(stream)
            var maxUnitForwardSpeed: Double
            maxUnitForwardSpeed = StreamUtil.readDouble(stream)
            var maxUnitBackwardSpeed: Double
            maxUnitBackwardSpeed = StreamUtil.readDouble(stream)
            var unitAcceleration: Double
            unitAcceleration = StreamUtil.readDouble(stream)
            var friendlyFire: Boolean
            friendlyFire = StreamUtil.readBoolean(stream)
            var killScore: Double
            killScore = StreamUtil.readDouble(stream)
            var damageScoreMultiplier: Double
            damageScoreMultiplier = StreamUtil.readDouble(stream)
            var scorePerPlace: Double
            scorePerPlace = StreamUtil.readDouble(stream)
            var weapons: Array<ai_cup_22.model.WeaponProperties>
            weapons = Array(StreamUtil.readInt(stream), {
                var weaponsElement: ai_cup_22.model.WeaponProperties
                weaponsElement = ai_cup_22.model.WeaponProperties.readFrom(stream)
                weaponsElement
            })
            var startingWeapon: Int?
            if (StreamUtil.readBoolean(stream)) {
                startingWeapon = StreamUtil.readInt(stream)
            } else {
                startingWeapon = null
            }
            var startingWeaponAmmo: Int
            startingWeaponAmmo = StreamUtil.readInt(stream)
            var maxShieldPotionsInInventory: Int
            maxShieldPotionsInInventory = StreamUtil.readInt(stream)
            var shieldPerPotion: Double
            shieldPerPotion = StreamUtil.readDouble(stream)
            var shieldPotionUseTime: Double
            shieldPotionUseTime = StreamUtil.readDouble(stream)
            var sounds: Array<ai_cup_22.model.SoundProperties>
            sounds = Array(StreamUtil.readInt(stream), {
                var soundsElement: ai_cup_22.model.SoundProperties
                soundsElement = ai_cup_22.model.SoundProperties.readFrom(stream)
                soundsElement
            })
            var stepsSoundTypeIndex: Int?
            if (StreamUtil.readBoolean(stream)) {
                stepsSoundTypeIndex = StreamUtil.readInt(stream)
            } else {
                stepsSoundTypeIndex = null
            }
            var stepsSoundTravelDistance: Double
            stepsSoundTravelDistance = StreamUtil.readDouble(stream)
            var obstacles: Array<ai_cup_22.model.Obstacle>
            obstacles = Array(StreamUtil.readInt(stream), {
                var obstaclesElement: ai_cup_22.model.Obstacle
                obstaclesElement = ai_cup_22.model.Obstacle.readFrom(stream)
                obstaclesElement
            })
            return Constants(ticksPerSecond, teamSize, initialZoneRadius, zoneSpeed, zoneDamagePerSecond, spawnTime, spawnCollisionDamagePerSecond, lootingTime, botPlayers, unitRadius, unitHealth, healthRegenerationPerSecond, healthRegenerationDelay, maxShield, spawnShield, extraLives, lastRespawnZoneRadius, fieldOfView, viewDistance, viewBlocking, rotationSpeed, spawnMovementSpeed, maxUnitForwardSpeed, maxUnitBackwardSpeed, unitAcceleration, friendlyFire, killScore, damageScoreMultiplier, scorePerPlace, weapons, startingWeapon, startingWeaponAmmo, maxShieldPotionsInInventory, shieldPerPotion, shieldPotionUseTime, sounds, stepsSoundTypeIndex, stepsSoundTravelDistance, obstacles)
        }
    }
}