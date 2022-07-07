package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * Point + color
 */
class ColoredVertex {
    /**
     * Position
     */
    var position: ai_cup_22.model.Vec2
    /**
     * Color
     */
    var color: ai_cup_22.debugging.Color

    constructor(position: ai_cup_22.model.Vec2, color: ai_cup_22.debugging.Color) {
        this.position = position
        this.color = color
    }

    /**
     * Write ColoredVertex to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        position.writeTo(stream)
        color.writeTo(stream)
    }

    /**
     * Get string representation of ColoredVertex
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("ColoredVertex { ")
        stringBuilder.append("position: ")
        stringBuilder.append(position)
        stringBuilder.append(", ")
        stringBuilder.append("color: ")
        stringBuilder.append(color)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read ColoredVertex from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): ColoredVertex {
            var position: ai_cup_22.model.Vec2
            position = ai_cup_22.model.Vec2.readFrom(stream)
            var color: ai_cup_22.debugging.Color
            color = ai_cup_22.debugging.Color.readFrom(stream)
            return ColoredVertex(position, color)
        }
    }
}