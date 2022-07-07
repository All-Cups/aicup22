package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Sound properties
 *
 * @param name Name
 * @param distance Distance from which the sound can be heard
 * @param offset Offset modifier
 */
case class SoundProperties(name: String, distance: Double, offset: Double) {
    /**
     * Write SoundProperties to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeString(stream, name)
        StreamUtil.writeDouble(stream, distance)
        StreamUtil.writeDouble(stream, offset)
    }

    /**
     * Get string representation of SoundProperties
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("SoundProperties { ")
        stringBuilder.append("name: ")
        stringBuilder.append('"' + name + '"')
        stringBuilder.append(", ")
        stringBuilder.append("distance: ")
        stringBuilder.append(distance)
        stringBuilder.append(", ")
        stringBuilder.append("offset: ")
        stringBuilder.append(offset)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object SoundProperties {
    /**
     * Read SoundProperties from input stream
     */
    def readFrom(stream: java.io.InputStream): SoundProperties = SoundProperties(
        StreamUtil.readString(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream)
    )
}