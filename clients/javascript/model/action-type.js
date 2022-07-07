/**
 * Type of action a unit is currently performing
 */
class ActionType {
    constructor(name, tag) {
        this.name = name;
        this.tag = tag;
    }

    /**
     * Picking up or dropping loot
     */
    static LOOTING = new ActionType("LOOTING", 0);
    /**
     * Using a shield potion
     */
    static USE_SHIELD_POTION = new ActionType("USE_SHIELD_POTION", 1);

    /**
     * Read ActionType from input stream
     */
    static async readFrom(stream) {
        const tag = await stream.readInt();
        if (tag == ActionType.LOOTING.tag) {
            return ActionType.LOOTING;
        }
        if (tag == ActionType.USE_SHIELD_POTION.tag) {
            return ActionType.USE_SHIELD_POTION;
        }
        throw new Error("Unexpected tag value");
    }

    /**
     * Write ActionType to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(this.tag);
    }

    [Symbol.for('nodejs.util.inspect.custom')]() {
        return this.name;
    }
}

module.exports = ActionType;