package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * Camera state
 */
class Camera {
    /**
     * Center
     */
    var center: ai_cup_22.model.Vec2
    /**
     * Rotation
     */
    var rotation: Double
    /**
     * Attack angle
     */
    var attack: Double
    /**
     * Vertical field of view
     */
    var fov: Double

    constructor(center: ai_cup_22.model.Vec2, rotation: Double, attack: Double, fov: Double) {
        this.center = center
        this.rotation = rotation
        this.attack = attack
        this.fov = fov
    }

    /**
     * Write Camera to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        center.writeTo(stream)
        StreamUtil.writeDouble(stream, rotation)
        StreamUtil.writeDouble(stream, attack)
        StreamUtil.writeDouble(stream, fov)
    }

    /**
     * Get string representation of Camera
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Camera { ")
        stringBuilder.append("center: ")
        stringBuilder.append(center)
        stringBuilder.append(", ")
        stringBuilder.append("rotation: ")
        stringBuilder.append(rotation)
        stringBuilder.append(", ")
        stringBuilder.append("attack: ")
        stringBuilder.append(attack)
        stringBuilder.append(", ")
        stringBuilder.append("fov: ")
        stringBuilder.append(fov)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Camera from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Camera {
            var center: ai_cup_22.model.Vec2
            center = ai_cup_22.model.Vec2.readFrom(stream)
            var rotation: Double
            rotation = StreamUtil.readDouble(stream)
            var attack: Double
            attack = StreamUtil.readDouble(stream)
            var fov: Double
            fov = StreamUtil.readDouble(stream)
            return Camera(center, rotation, attack, fov)
        }
    }
}