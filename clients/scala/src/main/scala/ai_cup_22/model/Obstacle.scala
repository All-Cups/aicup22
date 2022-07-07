package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * An obstacle on the map
 *
 * @param id Unique id
 * @param position Center position
 * @param radius Obstacle's radius
 * @param canSeeThrough Whether units can see through this obstacle, or it blocks the view
 * @param canShootThrough Whether projectiles can go through this obstacle
 */
case class Obstacle(id: Int, position: ai_cup_22.model.Vec2, radius: Double, canSeeThrough: Boolean, canShootThrough: Boolean) {
    /**
     * Write Obstacle to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeInt(stream, id)
        position.writeTo(stream)
        StreamUtil.writeDouble(stream, radius)
        StreamUtil.writeBoolean(stream, canSeeThrough)
        StreamUtil.writeBoolean(stream, canShootThrough)
    }

    /**
     * Get string representation of Obstacle
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Obstacle { ")
        stringBuilder.append("id: ")
        stringBuilder.append(id)
        stringBuilder.append(", ")
        stringBuilder.append("position: ")
        stringBuilder.append(position)
        stringBuilder.append(", ")
        stringBuilder.append("radius: ")
        stringBuilder.append(radius)
        stringBuilder.append(", ")
        stringBuilder.append("canSeeThrough: ")
        stringBuilder.append(canSeeThrough)
        stringBuilder.append(", ")
        stringBuilder.append("canShootThrough: ")
        stringBuilder.append(canShootThrough)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object Obstacle {
    /**
     * Read Obstacle from input stream
     */
    def readFrom(stream: java.io.InputStream): Obstacle = Obstacle(
        StreamUtil.readInt(stream),
        ai_cup_22.model.Vec2.readFrom(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readBoolean(stream),
        StreamUtil.readBoolean(stream)
    )
}