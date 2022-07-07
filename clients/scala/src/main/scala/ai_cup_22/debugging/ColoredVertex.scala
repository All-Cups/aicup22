package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * Point + color
 *
 * @param position Position
 * @param color Color
 */
case class ColoredVertex(position: ai_cup_22.model.Vec2, color: ai_cup_22.debugging.Color) {
    /**
     * Write ColoredVertex to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        position.writeTo(stream)
        color.writeTo(stream)
    }

    /**
     * Get string representation of ColoredVertex
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("ColoredVertex { ")
        stringBuilder.append("position: ")
        stringBuilder.append(position)
        stringBuilder.append(", ")
        stringBuilder.append("color: ")
        stringBuilder.append(color)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object ColoredVertex {
    /**
     * Read ColoredVertex from input stream
     */
    def readFrom(stream: java.io.InputStream): ColoredVertex = ColoredVertex(
        ai_cup_22.model.Vec2.readFrom(stream),
        ai_cup_22.debugging.Color.readFrom(stream)
    )
}