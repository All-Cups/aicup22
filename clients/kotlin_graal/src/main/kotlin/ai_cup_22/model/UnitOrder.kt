package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Order for specific unit
 */
class UnitOrder {
    /**
     * Target moving velocity
     */
    var targetVelocity: ai_cup_22.model.Vec2
    /**
     * Target view direction (vector length doesn't matter)
     */
    var targetDirection: ai_cup_22.model.Vec2
    /**
     * Order to perform an action, or None
     */
    var action: ai_cup_22.model.ActionOrder?

    constructor(targetVelocity: ai_cup_22.model.Vec2, targetDirection: ai_cup_22.model.Vec2, action: ai_cup_22.model.ActionOrder?) {
        this.targetVelocity = targetVelocity
        this.targetDirection = targetDirection
        this.action = action
    }

    /**
     * Write UnitOrder to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        targetVelocity.writeTo(stream)
        targetDirection.writeTo(stream)
        val actionValue = action
        if (actionValue == null) {
            StreamUtil.writeBoolean(stream, false)
        } else {
            StreamUtil.writeBoolean(stream, true)
            actionValue.writeTo(stream)
        }
    }

    /**
     * Get string representation of UnitOrder
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("UnitOrder { ")
        stringBuilder.append("targetVelocity: ")
        stringBuilder.append(targetVelocity)
        stringBuilder.append(", ")
        stringBuilder.append("targetDirection: ")
        stringBuilder.append(targetDirection)
        stringBuilder.append(", ")
        stringBuilder.append("action: ")
        stringBuilder.append(action)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read UnitOrder from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): UnitOrder {
            var targetVelocity: ai_cup_22.model.Vec2
            targetVelocity = ai_cup_22.model.Vec2.readFrom(stream)
            var targetDirection: ai_cup_22.model.Vec2
            targetDirection = ai_cup_22.model.Vec2.readFrom(stream)
            var action: ai_cup_22.model.ActionOrder?
            if (StreamUtil.readBoolean(stream)) {
                action = ai_cup_22.model.ActionOrder.readFrom(stream)
            } else {
                action = null
            }
            return UnitOrder(targetVelocity, targetDirection, action)
        }
    }
}