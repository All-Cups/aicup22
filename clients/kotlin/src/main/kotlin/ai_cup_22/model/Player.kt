package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Game's participant (team of units)
 */
class Player {
    /**
     * Unique id
     */
    var id: Int
    /**
     * Number of kills
     */
    var kills: Int
    /**
     * Total damage dealt to enemies
     */
    var damage: Double
    /**
     * Survival place (number of survivor teams currently/at the moment of death)
     */
    var place: Int
    /**
     * Team score
     */
    var score: Double

    constructor(id: Int, kills: Int, damage: Double, place: Int, score: Double) {
        this.id = id
        this.kills = kills
        this.damage = damage
        this.place = place
        this.score = score
    }

    /**
     * Write Player to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeInt(stream, id)
        StreamUtil.writeInt(stream, kills)
        StreamUtil.writeDouble(stream, damage)
        StreamUtil.writeInt(stream, place)
        StreamUtil.writeDouble(stream, score)
    }

    /**
     * Get string representation of Player
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Player { ")
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
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Player from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Player {
            var id: Int
            id = StreamUtil.readInt(stream)
            var kills: Int
            kills = StreamUtil.readInt(stream)
            var damage: Double
            damage = StreamUtil.readDouble(stream)
            var place: Int
            place = StreamUtil.readInt(stream)
            var score: Double
            score = StreamUtil.readDouble(stream)
            return Player(id, kills, damage, place, score)
        }
    }
}