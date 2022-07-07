import { Game } from "./model/game";
import { Order } from "./model/order";
import { Constants } from "./model/constants";
import { DebugInterface } from "./debug-interface";

export class MyStrategy {
    constructor(constants: Constants) {}
    async getOrder(game: Game, debug_interface: DebugInterface | null): Promise<Order> {
        return new Order(new Map());
    }
    async debugUpdate(debug_interface: DebugInterface) {}
    finish() {}
}