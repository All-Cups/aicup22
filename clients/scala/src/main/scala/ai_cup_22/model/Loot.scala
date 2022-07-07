package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Loot lying on the ground
 *
 * @param id Unique id
 * @param position Position
 * @param item Item
 */
case class Loot(id: Int, position: ai_cup_22.model.Vec2, item: ai_cup_22.model.Item) {
    /**
     * Write Loot to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeInt(stream, id)
        position.writeTo(stream)
        item.writeTo(stream)
    }

    /**
     * Get string representation of Loot
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Loot { ")
        stringBuilder.append("id: ")
        stringBuilder.append(id)
        stringBuilder.append(", ")
        stringBuilder.append("position: ")
        stringBuilder.append(position)
        stringBuilder.append(", ")
        stringBuilder.append("item: ")
        stringBuilder.append(item)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object Loot {
    /**
     * Read Loot from input stream
     */
    def readFrom(stream: java.io.InputStream): Loot = Loot(
        StreamUtil.readInt(stream),
        ai_cup_22.model.Vec2.readFrom(stream),
        ai_cup_22.model.Item.readFrom(stream)
    )
}