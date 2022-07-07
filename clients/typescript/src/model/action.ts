import { ActionType } from "./action-type";
import { Stream } from "../stream";

/**
 * Action unit is currently performing
 */
export class Action {
    /**
     * Tick when the action will be finished
     */
    finishTick: number
    /**
     * Type of the action
     */
    actionType: ActionType

    constructor(finishTick: number, actionType: ActionType) {
        this.finishTick = finishTick;
        this.actionType = actionType;
    }

    /**
     * Read Action from input stream
     */
    static async readFrom(stream: Stream): Promise<Action> {
        let finishTick;
        finishTick = await stream.readInt();
        let actionType;
        actionType = await ActionType.readFrom(stream);
        return new Action(finishTick, actionType)
    }

    /**
     * Write Action to output stream
     */
    async writeTo(stream: Stream) {
        let finishTick = this.finishTick;
        await stream.writeInt(finishTick);
        let actionType = this.actionType;
        await actionType.writeTo(stream);
    }
}