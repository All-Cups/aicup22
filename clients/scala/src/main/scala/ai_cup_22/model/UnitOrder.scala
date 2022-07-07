package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Order for specific unit
 *
 * @param targetVelocity Target moving velocity
 * @param targetDirection Target view direction (vector length doesn't matter)
 * @param action Order to perform an action, or None
 */
case class UnitOrder(targetVelocity: ai_cup_22.model.Vec2, targetDirection: ai_cup_22.model.Vec2, action: Option[ai_cup_22.model.ActionOrder]) {
    /**
     * Write UnitOrder to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        targetVelocity.writeTo(stream)
        targetDirection.writeTo(stream)
        action match {
            case None => StreamUtil.writeBoolean(stream, false)
            case Some(value) => {
                StreamUtil.writeBoolean(stream, true)
                value.writeTo(stream)
            }
        }
    }

    /**
     * Get string representation of UnitOrder
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("UnitOrder { ")
        stringBuilder.append("targetVelocity: ")
        stringBuilder.append(targetVelocity)
        stringBuilder.append(", ")
        stringBuilder.append("targetDirection: ")
        stringBuilder.append(targetDirection)
        stringBuilder.append(", ")
        stringBuilder.append("action: ")
        stringBuilder.append(action)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object UnitOrder {
    /**
     * Read UnitOrder from input stream
     */
    def readFrom(stream: java.io.InputStream): UnitOrder = UnitOrder(
        ai_cup_22.model.Vec2.readFrom(stream),
        ai_cup_22.model.Vec2.readFrom(stream),
        if (StreamUtil.readBoolean(stream)) Some(
            ai_cup_22.model.ActionOrder.readFrom(stream)
        ) else None
    )
}