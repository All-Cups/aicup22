const Order = require('./model/order');

class MyStrategy {
    constructor(constants) {}
    async getOrder(game, debugInterface) {
        return new Order(new Map());
    }
    async debugUpdate(debugInterface) {}
    finish() {}
}

module.exports = MyStrategy;