const DebugCommand = require.main.require('./debugging/debug-command');
const Order = require.main.require('./model/order');

/**
 * Message sent from client
 */
class ClientMessage {
    /**
     * Read ClientMessage from input stream
     */
    static async readFrom(stream) {
        let tag = await stream.readInt();
        if (tag == ClientMessage.DebugMessage.TAG) {
            return await ClientMessage.DebugMessage.readFrom(stream);
        }
        if (tag == ClientMessage.OrderMessage.TAG) {
            return await ClientMessage.OrderMessage.readFrom(stream);
        }
        if (tag == ClientMessage.DebugUpdateDone.TAG) {
            return await ClientMessage.DebugUpdateDone.readFrom(stream);
        }
        if (tag == ClientMessage.RequestDebugState.TAG) {
            return await ClientMessage.RequestDebugState.readFrom(stream);
        }
        throw new Error("Unexpected tag value");
    }
}
/**
 * Ask app to perform new debug command
 */
class DebugMessage extends ClientMessage {
    /**
     * Command to perform
     */
    command;

    constructor(command) {
        super();
        this.command = command;
    }

    /**
     * Read DebugMessage from input stream
     */
    static async readFrom(stream) {
        let command;
        command = await DebugCommand.readFrom(stream);
        return new DebugMessage(command);
    }

    /**
     * Write DebugMessage to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(DebugMessage.TAG);
        let command = this.command;
        await command.writeTo(stream);
    }
}

DebugMessage.TAG = 0;
ClientMessage.DebugMessage = DebugMessage;
/**
 * Reply for ServerMessage::GetOrder
 */
class OrderMessage extends ClientMessage {
    /**
     * Player's order
     */
    order;

    constructor(order) {
        super();
        this.order = order;
    }

    /**
     * Read OrderMessage from input stream
     */
    static async readFrom(stream) {
        let order;
        order = await Order.readFrom(stream);
        return new OrderMessage(order);
    }

    /**
     * Write OrderMessage to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(OrderMessage.TAG);
        let order = this.order;
        await order.writeTo(stream);
    }
}

OrderMessage.TAG = 1;
ClientMessage.OrderMessage = OrderMessage;
/**
 * Signifies finish of the debug update
 */
class DebugUpdateDone extends ClientMessage {

    constructor() {
        super();
    }

    /**
     * Read DebugUpdateDone from input stream
     */
    static async readFrom(stream) {
        return new DebugUpdateDone();
    }

    /**
     * Write DebugUpdateDone to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(DebugUpdateDone.TAG);
    }
}

DebugUpdateDone.TAG = 2;
ClientMessage.DebugUpdateDone = DebugUpdateDone;
/**
 * Request debug state from the app
 */
class RequestDebugState extends ClientMessage {

    constructor() {
        super();
    }

    /**
     * Read RequestDebugState from input stream
     */
    static async readFrom(stream) {
        return new RequestDebugState();
    }

    /**
     * Write RequestDebugState to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(RequestDebugState.TAG);
    }
}

RequestDebugState.TAG = 3;
ClientMessage.RequestDebugState = RequestDebugState;
module.exports = ClientMessage;