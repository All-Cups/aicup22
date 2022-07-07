package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * 2 dimensional vector.
 *
 * @param x `x` coordinate of the vector
 * @param y `y` coordinate of the vector
 */
case class Vec2(x: Double, y: Double) {
    /**
     * Write Vec2 to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeDouble(stream, x)
        StreamUtil.writeDouble(stream, y)
    }

    /**
     * Get string representation of Vec2
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Vec2 { ")
        stringBuilder.append("x: ")
        stringBuilder.append(x)
        stringBuilder.append(", ")
        stringBuilder.append("y: ")
        stringBuilder.append(y)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object Vec2 {
    /**
     * Read Vec2 from input stream
     */
    def readFrom(stream: java.io.InputStream): Vec2 = Vec2(
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream)
    )
}