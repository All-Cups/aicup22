package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Sound properties
 */
class SoundProperties {
    /**
     * Name
     */
    var name: String
    /**
     * Distance from which the sound can be heard
     */
    var distance: Double
    /**
     * Offset modifier
     */
    var offset: Double

    constructor(name: String, distance: Double, offset: Double) {
        this.name = name
        this.distance = distance
        this.offset = offset
    }

    /**
     * Write SoundProperties to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeString(stream, name)
        StreamUtil.writeDouble(stream, distance)
        StreamUtil.writeDouble(stream, offset)
    }

    /**
     * Get string representation of SoundProperties
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("SoundProperties { ")
        stringBuilder.append("name: ")
        stringBuilder.append('"' + name + '"')
        stringBuilder.append(", ")
        stringBuilder.append("distance: ")
        stringBuilder.append(distance)
        stringBuilder.append(", ")
        stringBuilder.append("offset: ")
        stringBuilder.append(offset)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read SoundProperties from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): SoundProperties {
            var name: String
            name = StreamUtil.readString(stream)
            var distance: Double
            distance = StreamUtil.readDouble(stream)
            var offset: Double
            offset = StreamUtil.readDouble(stream)
            return SoundProperties(name, distance, offset)
        }
    }
}