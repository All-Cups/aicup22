import { ActionOrder } from "./action-order";
import { Vec2 } from "./vec2";
import { Stream } from "../stream";

/**
 * Order for specific unit
 */
export class UnitOrder {
    /**
     * Target moving velocity
     */
    targetVelocity: Vec2
    /**
     * Target view direction (vector length doesn't matter)
     */
    targetDirection: Vec2
    /**
     * Order to perform an action, or None
     */
    action: ActionOrder | null

    constructor(targetVelocity: Vec2, targetDirection: Vec2, action: ActionOrder | null) {
        this.targetVelocity = targetVelocity;
        this.targetDirection = targetDirection;
        this.action = action;
    }

    /**
     * Read UnitOrder from input stream
     */
    static async readFrom(stream: Stream): Promise<UnitOrder> {
        let targetVelocity;
        targetVelocity = await Vec2.readFrom(stream);
        let targetDirection;
        targetDirection = await Vec2.readFrom(stream);
        let action;
        if (await stream.readBool()) {
            action = await ActionOrder.readFrom(stream);
        } else {
            action = null;
        }
        return new UnitOrder(targetVelocity, targetDirection, action)
    }

    /**
     * Write UnitOrder to output stream
     */
    async writeTo(stream: Stream) {
        let targetVelocity = this.targetVelocity;
        await targetVelocity.writeTo(stream);
        let targetDirection = this.targetDirection;
        await targetDirection.writeTo(stream);
        let action = this.action;
        if (action === null) {
            await stream.writeBool(false);
        } else {
            await stream.writeBool(true);
            await action.writeTo(stream);
        }
    }
}