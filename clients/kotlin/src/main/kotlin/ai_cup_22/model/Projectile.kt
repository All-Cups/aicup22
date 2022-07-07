package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Weapon projectile
 */
class Projectile {
    /**
     * Unique id
     */
    var id: Int
    /**
     * Index of the weapon this projectile was shot from (starts with 0)
     */
    var weaponTypeIndex: Int
    /**
     * Id of unit who made the shot
     */
    var shooterId: Int
    /**
     * Id of player (team), whose unit made the shot
     */
    var shooterPlayerId: Int
    /**
     * Current position
     */
    var position: ai_cup_22.model.Vec2
    /**
     * Projectile's velocity
     */
    var velocity: ai_cup_22.model.Vec2
    /**
     * Left time of projectile's life
     */
    var lifeTime: Double

    constructor(id: Int, weaponTypeIndex: Int, shooterId: Int, shooterPlayerId: Int, position: ai_cup_22.model.Vec2, velocity: ai_cup_22.model.Vec2, lifeTime: Double) {
        this.id = id
        this.weaponTypeIndex = weaponTypeIndex
        this.shooterId = shooterId
        this.shooterPlayerId = shooterPlayerId
        this.position = position
        this.velocity = velocity
        this.lifeTime = lifeTime
    }

    /**
     * Write Projectile to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeInt(stream, id)
        StreamUtil.writeInt(stream, weaponTypeIndex)
        StreamUtil.writeInt(stream, shooterId)
        StreamUtil.writeInt(stream, shooterPlayerId)
        position.writeTo(stream)
        velocity.writeTo(stream)
        StreamUtil.writeDouble(stream, lifeTime)
    }

    /**
     * Get string representation of Projectile
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Projectile { ")
        stringBuilder.append("id: ")
        stringBuilder.append(id)
        stringBuilder.append(", ")
        stringBuilder.append("weaponTypeIndex: ")
        stringBuilder.append(weaponTypeIndex)
        stringBuilder.append(", ")
        stringBuilder.append("shooterId: ")
        stringBuilder.append(shooterId)
        stringBuilder.append(", ")
        stringBuilder.append("shooterPlayerId: ")
        stringBuilder.append(shooterPlayerId)
        stringBuilder.append(", ")
        stringBuilder.append("position: ")
        stringBuilder.append(position)
        stringBuilder.append(", ")
        stringBuilder.append("velocity: ")
        stringBuilder.append(velocity)
        stringBuilder.append(", ")
        stringBuilder.append("lifeTime: ")
        stringBuilder.append(lifeTime)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Projectile from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Projectile {
            var id: Int
            id = StreamUtil.readInt(stream)
            var weaponTypeIndex: Int
            weaponTypeIndex = StreamUtil.readInt(stream)
            var shooterId: Int
            shooterId = StreamUtil.readInt(stream)
            var shooterPlayerId: Int
            shooterPlayerId = StreamUtil.readInt(stream)
            var position: ai_cup_22.model.Vec2
            position = ai_cup_22.model.Vec2.readFrom(stream)
            var velocity: ai_cup_22.model.Vec2
            velocity = ai_cup_22.model.Vec2.readFrom(stream)
            var lifeTime: Double
            lifeTime = StreamUtil.readDouble(stream)
            return Projectile(id, weaponTypeIndex, shooterId, shooterPlayerId, position, velocity, lifeTime)
        }
    }
}