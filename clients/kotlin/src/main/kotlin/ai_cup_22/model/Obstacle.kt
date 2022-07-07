package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * An obstacle on the map
 */
class Obstacle {
    /**
     * Unique id
     */
    var id: Int
    /**
     * Center position
     */
    var position: ai_cup_22.model.Vec2
    /**
     * Obstacle's radius
     */
    var radius: Double
    /**
     * Whether units can see through this obstacle, or it blocks the view
     */
    var canSeeThrough: Boolean
    /**
     * Whether projectiles can go through this obstacle
     */
    var canShootThrough: Boolean

    constructor(id: Int, position: ai_cup_22.model.Vec2, radius: Double, canSeeThrough: Boolean, canShootThrough: Boolean) {
        this.id = id
        this.position = position
        this.radius = radius
        this.canSeeThrough = canSeeThrough
        this.canShootThrough = canShootThrough
    }

    /**
     * Write Obstacle to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeInt(stream, id)
        position.writeTo(stream)
        StreamUtil.writeDouble(stream, radius)
        StreamUtil.writeBoolean(stream, canSeeThrough)
        StreamUtil.writeBoolean(stream, canShootThrough)
    }

    /**
     * Get string representation of Obstacle
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Obstacle { ")
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
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Obstacle from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Obstacle {
            var id: Int
            id = StreamUtil.readInt(stream)
            var position: ai_cup_22.model.Vec2
            position = ai_cup_22.model.Vec2.readFrom(stream)
            var radius: Double
            radius = StreamUtil.readDouble(stream)
            var canSeeThrough: Boolean
            canSeeThrough = StreamUtil.readBoolean(stream)
            var canShootThrough: Boolean
            canShootThrough = StreamUtil.readBoolean(stream)
            return Obstacle(id, position, radius, canSeeThrough, canShootThrough)
        }
    }
}