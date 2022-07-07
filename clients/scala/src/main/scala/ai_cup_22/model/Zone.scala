package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Current state of the game zone
 *
 * @param currentCenter Current center
 * @param currentRadius Current radius
 * @param nextCenter Next center
 * @param nextRadius Next radius
 */
case class Zone(currentCenter: ai_cup_22.model.Vec2, currentRadius: Double, nextCenter: ai_cup_22.model.Vec2, nextRadius: Double) {
    /**
     * Write Zone to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        currentCenter.writeTo(stream)
        StreamUtil.writeDouble(stream, currentRadius)
        nextCenter.writeTo(stream)
        StreamUtil.writeDouble(stream, nextRadius)
    }

    /**
     * Get string representation of Zone
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Zone { ")
        stringBuilder.append("currentCenter: ")
        stringBuilder.append(currentCenter)
        stringBuilder.append(", ")
        stringBuilder.append("currentRadius: ")
        stringBuilder.append(currentRadius)
        stringBuilder.append(", ")
        stringBuilder.append("nextCenter: ")
        stringBuilder.append(nextCenter)
        stringBuilder.append(", ")
        stringBuilder.append("nextRadius: ")
        stringBuilder.append(nextRadius)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object Zone {
    /**
     * Read Zone from input stream
     */
    def readFrom(stream: java.io.InputStream): Zone = Zone(
        ai_cup_22.model.Vec2.readFrom(stream),
        StreamUtil.readDouble(stream),
        ai_cup_22.model.Vec2.readFrom(stream),
        StreamUtil.readDouble(stream)
    )
}