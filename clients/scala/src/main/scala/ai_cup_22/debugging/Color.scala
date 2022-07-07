package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * RGBA Color
 *
 * @param r Red component
 * @param g Green component
 * @param b Blue component
 * @param a Alpha (opacity) component
 */
case class Color(r: Double, g: Double, b: Double, a: Double) {
    /**
     * Write Color to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeDouble(stream, r)
        StreamUtil.writeDouble(stream, g)
        StreamUtil.writeDouble(stream, b)
        StreamUtil.writeDouble(stream, a)
    }

    /**
     * Get string representation of Color
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Color { ")
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
        stringBuilder.toString()
    }
}

object Color {
    /**
     * Read Color from input stream
     */
    def readFrom(stream: java.io.InputStream): Color = Color(
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream)
    )
}