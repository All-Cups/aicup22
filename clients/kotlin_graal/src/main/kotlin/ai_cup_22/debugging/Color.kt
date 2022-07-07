package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * RGBA Color
 */
class Color {
    /**
     * Red component
     */
    var r: Double
    /**
     * Green component
     */
    var g: Double
    /**
     * Blue component
     */
    var b: Double
    /**
     * Alpha (opacity) component
     */
    var a: Double

    constructor(r: Double, g: Double, b: Double, a: Double) {
        this.r = r
        this.g = g
        this.b = b
        this.a = a
    }

    /**
     * Write Color to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeDouble(stream, r)
        StreamUtil.writeDouble(stream, g)
        StreamUtil.writeDouble(stream, b)
        StreamUtil.writeDouble(stream, a)
    }

    /**
     * Get string representation of Color
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Color { ")
        stringBuilder.append("r: ")
        stringBuilder.append(r)
        stringBuilder.append(", ")
        stringBuilder.append("g: ")
        stringBuilder.append(g)
        stringBuilder.append(", ")
        stringBuilder.append("b: ")
        stringBuilder.append(b)
        stringBuilder.append(", ")
        stringBuilder.append("a: ")
        stringBuilder.append(a)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Color from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Color {
            var r: Double
            r = StreamUtil.readDouble(stream)
            var g: Double
            g = StreamUtil.readDouble(stream)
            var b: Double
            b = StreamUtil.readDouble(stream)
            var a: Double
            a = StreamUtil.readDouble(stream)
            return Color(r, g, b, a)
        }
    }
}