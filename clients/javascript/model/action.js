const ActionType = require.main.require('./model/action-type');
/**
 * Action unit is currently performing
 */
class Action {
    /**
     * Tick when the action will be finished
     */
    finishTick;
    /**
     * Type of the action
     */
    actionType;

    constructor(finishTick, actionType) {
        this.finishTick = finishTick;
        this.actionType = actionType;
    }

    /**
     * Read Action from input stream
     */
    static async readFrom(stream) {
        let finishTick;
        finishTick = await stream.readInt();
        let actionType;
        actionType = await ActionType.readFrom(stream);
        return new Action(finishTick, actionType);
    }

    /**
     * Write Action to output stream
     */
    async writeTo(stream) {
        let finishTick = this.finishTick;
        await stream.writeInt(finishTick);
        let actionType = this.actionType;
        await actionType.writeTo(stream);
    }
}
module.exports = Action