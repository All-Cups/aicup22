package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Order for specific unit
 */
public class UnitOrder {
    /**
     * Target moving velocity
     */
    private ai_cup_22.model.Vec2 targetVelocity;

    /**
     * Target moving velocity
     */
    public ai_cup_22.model.Vec2 getTargetVelocity() {
        return targetVelocity;
    }

    /**
     * Target moving velocity
     */
    public void setTargetVelocity(ai_cup_22.model.Vec2 value) {
        this.targetVelocity = value;
    }
    /**
     * Target view direction (vector length doesn't matter)
     */
    private ai_cup_22.model.Vec2 targetDirection;

    /**
     * Target view direction (vector length doesn't matter)
     */
    public ai_cup_22.model.Vec2 getTargetDirection() {
        return targetDirection;
    }

    /**
     * Target view direction (vector length doesn't matter)
     */
    public void setTargetDirection(ai_cup_22.model.Vec2 value) {
        this.targetDirection = value;
    }
    /**
     * Order to perform an action, or None
     */
    private ai_cup_22.model.ActionOrder action;

    /**
     * Order to perform an action, or None
     */
    public ai_cup_22.model.ActionOrder getAction() {
        return action;
    }

    /**
     * Order to perform an action, or None
     */
    public void setAction(ai_cup_22.model.ActionOrder value) {
        this.action = value;
    }

    public UnitOrder(ai_cup_22.model.Vec2 targetVelocity, ai_cup_22.model.Vec2 targetDirection, ai_cup_22.model.ActionOrder action) {
        this.targetVelocity = targetVelocity;
        this.targetDirection = targetDirection;
        this.action = action;
    }

    /**
     * Read UnitOrder from input stream
     */
    public static UnitOrder readFrom(java.io.InputStream stream) throws java.io.IOException {
        ai_cup_22.model.Vec2 targetVelocity;
        targetVelocity = ai_cup_22.model.Vec2.readFrom(stream);
        ai_cup_22.model.Vec2 targetDirection;
        targetDirection = ai_cup_22.model.Vec2.readFrom(stream);
        ai_cup_22.model.ActionOrder action;
        if (StreamUtil.readBoolean(stream)) {
            action = ai_cup_22.model.ActionOrder.readFrom(stream);
        } else {
            action = null;
        }
        return new UnitOrder(targetVelocity, targetDirection, action);
    }

    /**
     * Write UnitOrder to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        targetVelocity.writeTo(stream);
        targetDirection.writeTo(stream);
        if (action == null) {
            StreamUtil.writeBoolean(stream, false);
        } else {
            StreamUtil.writeBoolean(stream, true);
            action.writeTo(stream);
        }
    }

    /**
     * Get string representation of UnitOrder
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("UnitOrder { ");
        stringBuilder.append("targetVelocity: ");
        stringBuilder.append(String.valueOf(targetVelocity));
        stringBuilder.append(", ");
        stringBuilder.append("targetDirection: ");
        stringBuilder.append(String.valueOf(targetDirection));
        stringBuilder.append(", ");
        stringBuilder.append("action: ");
        stringBuilder.append(String.valueOf(action));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}