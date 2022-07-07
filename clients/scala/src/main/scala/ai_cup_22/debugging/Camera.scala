package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * Camera state
 *
 * @param center Center
 * @param rotation Rotation
 * @param attack Attack angle
 * @param fov Vertical field of view
 */
case class Camera(center: ai_cup_22.model.Vec2, rotation: Double, attack: Double, fov: Double) {
    /**
     * Write Camera to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        center.writeTo(stream)
        StreamUtil.writeDouble(stream, rotation)
        StreamUtil.writeDouble(stream, attack)
        StreamUtil.writeDouble(stream, fov)
    }

    /**
     * Get string representation of Camera
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Camera { ")
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
        stringBuilder.toString()
    }
}

object Camera {
    /**
     * Read Camera from input stream
     */
    def readFrom(stream: java.io.InputStream): Camera = Camera(
        ai_cup_22.model.Vec2.readFrom(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream)
    )
}