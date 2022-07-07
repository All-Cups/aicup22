package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Action unit is currently performing
 */
class Action {
    /**
     * Tick when the action will be finished
     */
    var finishTick: Int
    /**
     * Type of the action
     */
    var actionType: ai_cup_22.model.ActionType

    constructor(finishTick: Int, actionType: ai_cup_22.model.ActionType) {
        this.finishTick = finishTick
        this.actionType = actionType
    }

    /**
     * Write Action to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeInt(stream, finishTick)
        StreamUtil.writeInt(stream, actionType.tag)
    }

    /**
     * Get string representation of Action
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Action { ")
        stringBuilder.append("finishTick: ")
        stringBuilder.append(finishTick)
        stringBuilder.append(", ")
        stringBuilder.append("actionType: ")
        stringBuilder.append(actionType)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Action from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Action {
            var finishTick: Int
            finishTick = StreamUtil.readInt(stream)
            var actionType: ai_cup_22.model.ActionType
            actionType = ai_cup_22.model.ActionType.readFrom(stream)
            return Action(finishTick, actionType)
        }
    }
}