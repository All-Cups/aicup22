package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Game's participant (team of units)
 *
 * @param id Unique id
 * @param kills Number of kills
 * @param damage Total damage dealt to enemies
 * @param place Survival place (number of survivor teams currently/at the moment of death)
 * @param score Team score
 */
case class Player(id: Int, kills: Int, damage: Double, place: Int, score: Double) {
    /**
     * Write Player to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeInt(stream, id)
        StreamUtil.writeInt(stream, kills)
        StreamUtil.writeDouble(stream, damage)
        StreamUtil.writeInt(stream, place)
        StreamUtil.writeDouble(stream, score)
    }

    /**
     * Get string representation of Player
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Player { ")
        stringBuilder.append("id: ")
        stringBuilder.append(id)
        stringBuilder.append(", ")
        stringBuilder.append("kills: ")
        stringBuilder.append(kills)
        stringBuilder.append(", ")
        stringBuilder.append("damage: ")
        stringBuilder.append(damage)
        stringBuilder.append(", ")
        stringBuilder.append("place: ")
        stringBuilder.append(place)
        stringBuilder.append(", ")
        stringBuilder.append("score: ")
        stringBuilder.append(score)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object Player {
    /**
     * Read Player from input stream
     */
    def readFrom(stream: java.io.InputStream): Player = Player(
        StreamUtil.readInt(stream),
        StreamUtil.readInt(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readInt(stream),
        StreamUtil.readDouble(stream)
    )
}