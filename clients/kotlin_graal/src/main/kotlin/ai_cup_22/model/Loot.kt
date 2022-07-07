package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Loot lying on the ground
 */
class Loot {
    /**
     * Unique id
     */
    var id: Int
    /**
     * Position
     */
    var position: ai_cup_22.model.Vec2
    /**
     * Item
     */
    var item: ai_cup_22.model.Item

    constructor(id: Int, position: ai_cup_22.model.Vec2, item: ai_cup_22.model.Item) {
        this.id = id
        this.position = position
        this.item = item
    }

    /**
     * Write Loot to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeInt(stream, id)
        position.writeTo(stream)
        item.writeTo(stream)
    }

    /**
     * Get string representation of Loot
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Loot { ")
        stringBuilder.append("id: ")
        stringBuilder.append(id)
        stringBuilder.append(", ")
        stringBuilder.append("position: ")
        stringBuilder.append(position)
        stringBuilder.append(", ")
        stringBuilder.append("item: ")
        stringBuilder.append(item)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Loot from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Loot {
            var id: Int
            id = StreamUtil.readInt(stream)
            var position: ai_cup_22.model.Vec2
            position = ai_cup_22.model.Vec2.readFrom(stream)
            var item: ai_cup_22.model.Item
            item = ai_cup_22.model.Item.readFrom(stream)
            return Loot(id, position, item)
        }
    }
}