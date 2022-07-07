import { UnitOrder } from "./unit-order";
import { Stream } from "../stream";

/**
 * Player's (team's) orders
 */
export class Order {
    /**
     * Orders for each of your units
     */
    unitOrders: Map<number, UnitOrder>

    constructor(unitOrders: Map<number, UnitOrder>) {
        this.unitOrders = unitOrders;
    }

    /**
     * Read Order from input stream
     */
    static async readFrom(stream: Stream): Promise<Order> {
        let unitOrders;
        unitOrders = new Map();
        for (let unitOrdersCount = await stream.readInt(); unitOrdersCount > 0; unitOrdersCount--) {
            let unitOrdersKey;
            let unitOrdersValue;
            unitOrdersKey = await stream.readInt();
            unitOrdersValue = await UnitOrder.readFrom(stream);
            unitOrders.set(unitOrdersKey, unitOrdersValue)
        }
        return new Order(unitOrders)
    }

    /**
     * Write Order to output stream
     */
    async writeTo(stream: Stream) {
        let unitOrders = this.unitOrders;
        await stream.writeInt(unitOrders.size);
        for (let [unitOrdersKey, unitOrdersValue] of unitOrders) {
            await stream.writeInt(unitOrdersKey);
            await unitOrdersValue.writeTo(stream);
        }
    }
}