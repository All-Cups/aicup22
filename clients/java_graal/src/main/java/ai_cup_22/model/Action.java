package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Action unit is currently performing
 */
public class Action {
    /**
     * Tick when the action will be finished
     */
    private int finishTick;

    /**
     * Tick when the action will be finished
     */
    public int getFinishTick() {
        return finishTick;
    }

    /**
     * Tick when the action will be finished
     */
    public void setFinishTick(int value) {
        this.finishTick = value;
    }
    /**
     * Type of the action
     */
    private ai_cup_22.model.ActionType actionType;

    /**
     * Type of the action
     */
    public ai_cup_22.model.ActionType getActionType() {
        return actionType;
    }

    /**
     * Type of the action
     */
    public void setActionType(ai_cup_22.model.ActionType value) {
        this.actionType = value;
    }

    public Action(int finishTick, ai_cup_22.model.ActionType actionType) {
        this.finishTick = finishTick;
        this.actionType = actionType;
    }

    /**
     * Read Action from input stream
     */
    public static Action readFrom(java.io.InputStream stream) throws java.io.IOException {
        int finishTick;
        finishTick = StreamUtil.readInt(stream);
        ai_cup_22.model.ActionType actionType;
        actionType = ai_cup_22.model.ActionType.readFrom(stream);
        return new Action(finishTick, actionType);
    }

    /**
     * Write Action to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeInt(stream, finishTick);
        StreamUtil.writeInt(stream, actionType.tag);
    }

    /**
     * Get string representation of Action
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Action { ");
        stringBuilder.append("finishTick: ");
        stringBuilder.append(String.valueOf(finishTick));
        stringBuilder.append(", ");
        stringBuilder.append("actionType: ");
        stringBuilder.append(String.valueOf(actionType));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}