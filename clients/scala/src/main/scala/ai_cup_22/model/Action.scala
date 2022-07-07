package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Action unit is currently performing
 *
 * @param finishTick Tick when the action will be finished
 * @param actionType Type of the action
 */
case class Action(finishTick: Int, actionType: ai_cup_22.model.ActionType) {
    /**
     * Write Action to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeInt(stream, finishTick)
        actionType.writeTo(stream)
    }

    /**
     * Get string representation of Action
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Action { ")
        stringBuilder.append("finishTick: ")
        stringBuilder.append(finishTick)
        stringBuilder.append(", ")
        stringBuilder.append("actionType: ")
        stringBuilder.append(actionType)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object Action {
    /**
     * Read Action from input stream
     */
    def readFrom(stream: java.io.InputStream): Action = Action(
        StreamUtil.readInt(stream),
        ai_cup_22.model.ActionType.readFrom(stream)
    )
}