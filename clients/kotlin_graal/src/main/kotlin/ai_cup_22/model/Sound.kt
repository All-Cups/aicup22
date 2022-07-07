package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Sound heard by one of your units
 */
class Sound {
    /**
     * Sound type index (starting with 0)
     */
    var typeIndex: Int
    /**
     * Id of unit that heard this sound
     */
    var unitId: Int
    /**
     * Position where sound was heard (different from sound source position)
     */
    var position: ai_cup_22.model.Vec2

    constructor(typeIndex: Int, unitId: Int, position: ai_cup_22.model.Vec2) {
        this.typeIndex = typeIndex
        this.unitId = unitId
        this.position = position
    }

    /**
     * Write Sound to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeInt(stream, typeIndex)
        StreamUtil.writeInt(stream, unitId)
        position.writeTo(stream)
    }

    /**
     * Get string representation of Sound
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Sound { ")
        stringBuilder.append("typeIndex: ")
        stringBuilder.append(typeIndex)
        stringBuilder.append(", ")
        stringBuilder.append("unitId: ")
        stringBuilder.append(unitId)
        stringBuilder.append(", ")
        stringBuilder.append("position: ")
        stringBuilder.append(position)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Sound from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Sound {
            var typeIndex: Int
            typeIndex = StreamUtil.readInt(stream)
            var unitId: Int
            unitId = StreamUtil.readInt(stream)
            var position: ai_cup_22.model.Vec2
            position = ai_cup_22.model.Vec2.readFrom(stream)
            return Sound(typeIndex, unitId, position)
        }
    }
}