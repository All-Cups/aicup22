const ActionOrder = require.main.require('./model/action-order');
const Vec2 = require.main.require('./model/vec2');
/**
 * Order for specific unit
 */
class UnitOrder {
    /**
     * Target moving velocity
     */
    targetVelocity;
    /**
     * Target view direction (vector length doesn't matter)
     */
    targetDirection;
    /**
     * Order to perform an action, or None
     */
    action;

    constructor(targetVelocity, targetDirection, action) {
        this.targetVelocity = targetVelocity;
        this.targetDirection = targetDirection;
        this.action = action;
    }

    /**
     * Read UnitOrder from input stream
     */
    static async readFrom(stream) {
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
        return new UnitOrder(targetVelocity, targetDirection, action);
    }

    /**
     * Write UnitOrder to output stream
     */
    async writeTo(stream) {
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
module.exports = UnitOrder