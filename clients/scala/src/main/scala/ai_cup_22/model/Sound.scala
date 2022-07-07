package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Sound heard by one of your units
 *
 * @param typeIndex Sound type index (starting with 0)
 * @param unitId Id of unit that heard this sound
 * @param position Position where sound was heard (different from sound source position)
 */
case class Sound(typeIndex: Int, unitId: Int, position: ai_cup_22.model.Vec2) {
    /**
     * Write Sound to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeInt(stream, typeIndex)
        StreamUtil.writeInt(stream, unitId)
        position.writeTo(stream)
    }

    /**
     * Get string representation of Sound
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Sound { ")
        stringBuilder.append("typeIndex: ")
        stringBuilder.append(typeIndex)
        stringBuilder.append(", ")
        stringBuilder.append("unitId: ")
        stringBuilder.append(unitId)
        stringBuilder.append(", ")
        stringBuilder.append("position: ")
        stringBuilder.append(position)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object Sound {
    /**
     * Read Sound from input stream
     */
    def readFrom(stream: java.io.InputStream): Sound = Sound(
        StreamUtil.readInt(stream),
        StreamUtil.readInt(stream),
        ai_cup_22.model.Vec2.readFrom(stream)
    )
}