const UnitOrder = require.main.require('./model/unit-order');
/**
 * Player's (team's) orders
 */
class Order {
    /**
     * Orders for each of your units
     */
    unitOrders;

    constructor(unitOrders) {
        this.unitOrders = unitOrders;
    }

    /**
     * Read Order from input stream
     */
    static async readFrom(stream) {
        let unitOrders;
        unitOrders = new Map();
        for (let unitOrdersCount = await stream.readInt(); unitOrdersCount > 0; unitOrdersCount--) {
            let unitOrdersKey;
            let unitOrdersValue;
            unitOrdersKey = await stream.readInt();
            unitOrdersValue = await UnitOrder.readFrom(stream);
            unitOrders.set(unitOrdersKey, unitOrdersValue)
        }
        return new Order(unitOrders);
    }

    /**
     * Write Order to output stream
     */
    async writeTo(stream) {
        let unitOrders = this.unitOrders;
        await stream.writeInt(unitOrders.size);
        for (let [unitOrdersKey, unitOrdersValue] of unitOrders) {
            await stream.writeInt(unitOrdersKey);
            await unitOrdersValue.writeTo(stream);
        }
    }
}
module.exports = Order