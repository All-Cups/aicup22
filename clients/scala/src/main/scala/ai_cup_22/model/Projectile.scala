package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Weapon projectile
 *
 * @param id Unique id
 * @param weaponTypeIndex Index of the weapon this projectile was shot from (starts with 0)
 * @param shooterId Id of unit who made the shot
 * @param shooterPlayerId Id of player (team), whose unit made the shot
 * @param position Current position
 * @param velocity Projectile's velocity
 * @param lifeTime Left time of projectile's life
 */
case class Projectile(id: Int, weaponTypeIndex: Int, shooterId: Int, shooterPlayerId: Int, position: ai_cup_22.model.Vec2, velocity: ai_cup_22.model.Vec2, lifeTime: Double) {
    /**
     * Write Projectile to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
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
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Projectile { ")
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
        stringBuilder.toString()
    }
}

object Projectile {
    /**
     * Read Projectile from input stream
     */
    def readFrom(stream: java.io.InputStream): Projectile = Projectile(
        StreamUtil.readInt(stream),
        StreamUtil.readInt(stream),
        StreamUtil.readInt(stream),
        StreamUtil.readInt(stream),
        ai_cup_22.model.Vec2.readFrom(stream),
        ai_cup_22.model.Vec2.readFrom(stream),
        StreamUtil.readDouble(stream)
    )
}