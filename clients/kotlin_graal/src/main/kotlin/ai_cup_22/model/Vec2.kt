package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * 2 dimensional vector.
 */
class Vec2 {
    /**
     * `x` coordinate of the vector
     */
    var x: Double
    /**
     * `y` coordinate of the vector
     */
    var y: Double

    constructor(x: Double, y: Double) {
        this.x = x
        this.y = y
    }

    /**
     * Write Vec2 to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeDouble(stream, x)
        StreamUtil.writeDouble(stream, y)
    }

    /**
     * Get string representation of Vec2
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Vec2 { ")
        stringBuilder.append("x: ")
        stringBuilder.append(x)
        stringBuilder.append(", ")
        stringBuilder.append("y: ")
        stringBuilder.append(y)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Vec2 from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Vec2 {
            var x: Double
            x = StreamUtil.readDouble(stream)
            var y: Double
            y = StreamUtil.readDouble(stream)
            return Vec2(x, y)
        }
    }
}