import { DebugCommand } from "../debugging/debug-command";
import { Order } from "../model/order";
import { Stream } from "../stream";

/**
 * Message sent from client
 */
export abstract class ClientMessage {
    /**
     * Write ClientMessage to output stream
     */
    abstract writeTo(stream: Stream): Promise<void>;

    /**
     * Read ClientMessage from input stream
     */
    static async readFrom(stream: Stream): Promise<ClientMessage> {
        const tag = await stream.readInt();
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

export namespace ClientMessage {
    /**
     * Ask app to perform new debug command
     */
    export class DebugMessage extends ClientMessage {
        /**
         * Command to perform
         */
        command: DebugCommand
    
        constructor(command: DebugCommand) {
            super();
            this.command = command;
        }
    
        /**
         * Read DebugMessage from input stream
         */
        static async readFrom(stream: Stream): Promise<ClientMessage.DebugMessage> {
            let command;
            command = await DebugCommand.readFrom(stream);
            return new DebugMessage(command)
        }
    
        /**
         * Write DebugMessage to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(DebugMessage.TAG);
            let command = this.command;
            await command.writeTo(stream);
        }
    }
    
    export namespace DebugMessage {
        export const TAG = 0;
    }
    /**
     * Reply for ServerMessage::GetOrder
     */
    export class OrderMessage extends ClientMessage {
        /**
         * Player's order
         */
        order: Order
    
        constructor(order: Order) {
            super();
            this.order = order;
        }
    
        /**
         * Read OrderMessage from input stream
         */
        static async readFrom(stream: Stream): Promise<ClientMessage.OrderMessage> {
            let order;
            order = await Order.readFrom(stream);
            return new OrderMessage(order)
        }
    
        /**
         * Write OrderMessage to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(OrderMessage.TAG);
            let order = this.order;
            await order.writeTo(stream);
        }
    }
    
    export namespace OrderMessage {
        export const TAG = 1;
    }
    /**
     * Signifies finish of the debug update
     */
    export class DebugUpdateDone extends ClientMessage {
    
        constructor() {
            super();
        }
    
        /**
         * Read DebugUpdateDone from input stream
         */
        static async readFrom(stream: Stream): Promise<ClientMessage.DebugUpdateDone> {
            return new DebugUpdateDone()
        }
    
        /**
         * Write DebugUpdateDone to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(DebugUpdateDone.TAG);
        }
    }
    
    export namespace DebugUpdateDone {
        export const TAG = 2;
    }
    /**
     * Request debug state from the app
     */
    export class RequestDebugState extends ClientMessage {
    
        constructor() {
            super();
        }
    
        /**
         * Read RequestDebugState from input stream
         */
        static async readFrom(stream: Stream): Promise<ClientMessage.RequestDebugState> {
            return new RequestDebugState()
        }
    
        /**
         * Write RequestDebugState to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(RequestDebugState.TAG);
        }
    }
    
    export namespace RequestDebugState {
        export const TAG = 3;
    }
}