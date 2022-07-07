package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * A unit
 */
class Unit {
    /**
     * Unique id
     */
    var id: Int
    /**
     * Id of the player (team) controlling the unit
     */
    var playerId: Int
    /**
     * Current health
     */
    var health: Double
    /**
     * Current shield value
     */
    var shield: Double
    /**
     * Left extra lives of this unit
     */
    var extraLives: Int
    /**
     * Current position of unit's center
     */
    var position: ai_cup_22.model.Vec2
    /**
     * Remaining time until unit will be spawned, or None
     */
    var remainingSpawnTime: Double?
    /**
     * Current velocity
     */
    var velocity: ai_cup_22.model.Vec2
    /**
     * Current view direction (vector of length 1)
     */
    var direction: ai_cup_22.model.Vec2
    /**
     * Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
     */
    var aim: Double
    /**
     * Current action unit is performing, or None
     */
    var action: ai_cup_22.model.Action?
    /**
     * Tick when health regeneration will start (can be less than current game tick)
     */
    var healthRegenerationStartTick: Int
    /**
     * Index of the weapon this unit is holding (starting with 0), or None
     */
    var weapon: Int?
    /**
     * Next tick when unit can shoot again (can be less than current game tick)
     */
    var nextShotTick: Int
    /**
     * List of ammo in unit's inventory for every weapon type
     */
    var ammo: Array<Int>
    /**
     * Number of shield potions in inventory
     */
    var shieldPotions: Int

    constructor(id: Int, playerId: Int, health: Double, shield: Double, extraLives: Int, position: ai_cup_22.model.Vec2, remainingSpawnTime: Double?, velocity: ai_cup_22.model.Vec2, direction: ai_cup_22.model.Vec2, aim: Double, action: ai_cup_22.model.Action?, healthRegenerationStartTick: Int, weapon: Int?, nextShotTick: Int, ammo: Array<Int>, shieldPotions: Int) {
        this.id = id
        this.playerId = playerId
        this.health = health
        this.shield = shield
        this.extraLives = extraLives
        this.position = position
        this.remainingSpawnTime = remainingSpawnTime
        this.velocity = velocity
        this.direction = direction
        this.aim = aim
        this.action = action
        this.healthRegenerationStartTick = healthRegenerationStartTick
        this.weapon = weapon
        this.nextShotTick = nextShotTick
        this.ammo = ammo
        this.shieldPotions = shieldPotions
    }

    /**
     * Write Unit to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeInt(stream, id)
        StreamUtil.writeInt(stream, playerId)
        StreamUtil.writeDouble(stream, health)
        StreamUtil.writeDouble(stream, shield)
        StreamUtil.writeInt(stream, extraLives)
        position.writeTo(stream)
        val remainingSpawnTimeValue = remainingSpawnTime
        if (remainingSpawnTimeValue == null) {
            StreamUtil.writeBoolean(stream, false)
        } else {
            StreamUtil.writeBoolean(stream, true)
            StreamUtil.writeDouble(stream, remainingSpawnTimeValue)
        }
        velocity.writeTo(stream)
        direction.writeTo(stream)
        StreamUtil.writeDouble(stream, aim)
        val actionValue = action
        if (actionValue == null) {
            StreamUtil.writeBoolean(stream, false)
        } else {
            StreamUtil.writeBoolean(stream, true)
            actionValue.writeTo(stream)
        }
        StreamUtil.writeInt(stream, healthRegenerationStartTick)
        val weaponValue = weapon
        if (weaponValue == null) {
            StreamUtil.writeBoolean(stream, false)
        } else {
            StreamUtil.writeBoolean(stream, true)
            StreamUtil.writeInt(stream, weaponValue)
        }
        StreamUtil.writeInt(stream, nextShotTick)
        StreamUtil.writeInt(stream, ammo.size)
        for (ammoElement in ammo) {
            StreamUtil.writeInt(stream, ammoElement)
        }
        StreamUtil.writeInt(stream, shieldPotions)
    }

    /**
     * Get string representation of Unit
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Unit { ")
        stringBuilder.append("id: ")
        stringBuilder.append(id)
        stringBuilder.append(", ")
        stringBuilder.append("playerId: ")
        stringBuilder.append(playerId)
        stringBuilder.append(", ")
        stringBuilder.append("health: ")
        stringBuilder.append(health)
        stringBuilder.append(", ")
        stringBuilder.append("shield: ")
        stringBuilder.append(shield)
        stringBuilder.append(", ")
        stringBuilder.append("extraLives: ")
        stringBuilder.append(extraLives)
        stringBuilder.append(", ")
        stringBuilder.append("position: ")
        stringBuilder.append(position)
        stringBuilder.append(", ")
        stringBuilder.append("remainingSpawnTime: ")
        stringBuilder.append(remainingSpawnTime)
        stringBuilder.append(", ")
        stringBuilder.append("velocity: ")
        stringBuilder.append(velocity)
        stringBuilder.append(", ")
        stringBuilder.append("direction: ")
        stringBuilder.append(direction)
        stringBuilder.append(", ")
        stringBuilder.append("aim: ")
        stringBuilder.append(aim)
        stringBuilder.append(", ")
        stringBuilder.append("action: ")
        stringBuilder.append(action)
        stringBuilder.append(", ")
        stringBuilder.append("healthRegenerationStartTick: ")
        stringBuilder.append(healthRegenerationStartTick)
        stringBuilder.append(", ")
        stringBuilder.append("weapon: ")
        stringBuilder.append(weapon)
        stringBuilder.append(", ")
        stringBuilder.append("nextShotTick: ")
        stringBuilder.append(nextShotTick)
        stringBuilder.append(", ")
        stringBuilder.append("ammo: ")
        stringBuilder.append("[ ")
        var ammoIndex = 0
        for (ammoElement in ammo) {
            if (ammoIndex != 0) {
                stringBuilder.append(", ")
            }
            stringBuilder.append(ammoElement)
            ammoIndex++
        }
        stringBuilder.append(" ]")
        stringBuilder.append(", ")
        stringBuilder.append("shieldPotions: ")
        stringBuilder.append(shieldPotions)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Unit from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Unit {
            var id: Int
            id = StreamUtil.readInt(stream)
            var playerId: Int
            playerId = StreamUtil.readInt(stream)
            var health: Double
            health = StreamUtil.readDouble(stream)
            var shield: Double
            shield = StreamUtil.readDouble(stream)
            var extraLives: Int
            extraLives = StreamUtil.readInt(stream)
            var position: ai_cup_22.model.Vec2
            position = ai_cup_22.model.Vec2.readFrom(stream)
            var remainingSpawnTime: Double?
            if (StreamUtil.readBoolean(stream)) {
                remainingSpawnTime = StreamUtil.readDouble(stream)
            } else {
                remainingSpawnTime = null
            }
            var velocity: ai_cup_22.model.Vec2
            velocity = ai_cup_22.model.Vec2.readFrom(stream)
            var direction: ai_cup_22.model.Vec2
            direction = ai_cup_22.model.Vec2.readFrom(stream)
            var aim: Double
            aim = StreamUtil.readDouble(stream)
            var action: ai_cup_22.model.Action?
            if (StreamUtil.readBoolean(stream)) {
                action = ai_cup_22.model.Action.readFrom(stream)
            } else {
                action = null
            }
            var healthRegenerationStartTick: Int
            healthRegenerationStartTick = StreamUtil.readInt(stream)
            var weapon: Int?
            if (StreamUtil.readBoolean(stream)) {
                weapon = StreamUtil.readInt(stream)
            } else {
                weapon = null
            }
            var nextShotTick: Int
            nextShotTick = StreamUtil.readInt(stream)
            var ammo: Array<Int>
            ammo = Array(StreamUtil.readInt(stream), {
                var ammoElement: Int
                ammoElement = StreamUtil.readInt(stream)
                ammoElement
            })
            var shieldPotions: Int
            shieldPotions = StreamUtil.readInt(stream)
            return Unit(id, playerId, health, shield, extraLives, position, remainingSpawnTime, velocity, direction, aim, action, healthRegenerationStartTick, weapon, nextShotTick, ammo, shieldPotions)
        }
    }
}