package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Current state of the game zone
 */
class Zone {
    /**
     * Current center
     */
    var currentCenter: ai_cup_22.model.Vec2
    /**
     * Current radius
     */
    var currentRadius: Double
    /**
     * Next center
     */
    var nextCenter: ai_cup_22.model.Vec2
    /**
     * Next radius
     */
    var nextRadius: Double

    constructor(currentCenter: ai_cup_22.model.Vec2, currentRadius: Double, nextCenter: ai_cup_22.model.Vec2, nextRadius: Double) {
        this.currentCenter = currentCenter
        this.currentRadius = currentRadius
        this.nextCenter = nextCenter
        this.nextRadius = nextRadius
    }

    /**
     * Write Zone to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        currentCenter.writeTo(stream)
        StreamUtil.writeDouble(stream, currentRadius)
        nextCenter.writeTo(stream)
        StreamUtil.writeDouble(stream, nextRadius)
    }

    /**
     * Get string representation of Zone
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Zone { ")
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
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Zone from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Zone {
            var currentCenter: ai_cup_22.model.Vec2
            currentCenter = ai_cup_22.model.Vec2.readFrom(stream)
            var currentRadius: Double
            currentRadius = StreamUtil.readDouble(stream)
            var nextCenter: ai_cup_22.model.Vec2
            nextCenter = ai_cup_22.model.Vec2.readFrom(stream)
            var nextRadius: Double
            nextRadius = StreamUtil.readDouble(stream)
            return Zone(currentCenter, currentRadius, nextCenter, nextRadius)
        }
    }
}