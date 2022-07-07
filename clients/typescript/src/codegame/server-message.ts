import { Constants } from "../model/constants";
import { Game } from "../model/game";
import { Stream } from "../stream";

/**
 * Message sent from server
 */
export abstract class ServerMessage {
    /**
     * Write ServerMessage to output stream
     */
    abstract writeTo(stream: Stream): Promise<void>;

    /**
     * Read ServerMessage from input stream
     */
    static async readFrom(stream: Stream): Promise<ServerMessage> {
        const tag = await stream.readInt();
        if (tag == ServerMessage.UpdateConstants.TAG) {
            return await ServerMessage.UpdateConstants.readFrom(stream);
        }
        if (tag == ServerMessage.GetOrder.TAG) {
            return await ServerMessage.GetOrder.readFrom(stream);
        }
        if (tag == ServerMessage.Finish.TAG) {
            return await ServerMessage.Finish.readFrom(stream);
        }
        if (tag == ServerMessage.DebugUpdate.TAG) {
            return await ServerMessage.DebugUpdate.readFrom(stream);
        }
        throw new Error("Unexpected tag value");
    }
}

export namespace ServerMessage {
    /**
     * Update constants
     */
    export class UpdateConstants extends ServerMessage {
        /**
         * New constants
         */
        constants: Constants
    
        constructor(constants: Constants) {
            super();
            this.constants = constants;
        }
    
        /**
         * Read UpdateConstants from input stream
         */
        static async readFrom(stream: Stream): Promise<ServerMessage.UpdateConstants> {
            let constants;
            constants = await Constants.readFrom(stream);
            return new UpdateConstants(constants)
        }
    
        /**
         * Write UpdateConstants to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(UpdateConstants.TAG);
            let constants = this.constants;
            await constants.writeTo(stream);
        }
    }
    
    export namespace UpdateConstants {
        export const TAG = 0;
    }
    /**
     * Get order for next tick
     */
    export class GetOrder extends ServerMessage {
        /**
         * Player's view
         */
        playerView: Game
        /**
         * Whether app is running with debug interface available
         */
        debugAvailable: boolean
    
        constructor(playerView: Game, debugAvailable: boolean) {
            super();
            this.playerView = playerView;
            this.debugAvailable = debugAvailable;
        }
    
        /**
         * Read GetOrder from input stream
         */
        static async readFrom(stream: Stream): Promise<ServerMessage.GetOrder> {
            let playerView;
            playerView = await Game.readFrom(stream);
            let debugAvailable;
            debugAvailable = await stream.readBool();
            return new GetOrder(playerView, debugAvailable)
        }
    
        /**
         * Write GetOrder to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(GetOrder.TAG);
            let playerView = this.playerView;
            await playerView.writeTo(stream);
            let debugAvailable = this.debugAvailable;
            await stream.writeBool(debugAvailable);
        }
    }
    
    export namespace GetOrder {
        export const TAG = 1;
    }
    /**
     * Signifies end of the game
     */
    export class Finish extends ServerMessage {
    
        constructor() {
            super();
        }
    
        /**
         * Read Finish from input stream
         */
        static async readFrom(stream: Stream): Promise<ServerMessage.Finish> {
            return new Finish()
        }
    
        /**
         * Write Finish to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(Finish.TAG);
        }
    }
    
    export namespace Finish {
        export const TAG = 2;
    }
    /**
     * Debug update
     */
    export class DebugUpdate extends ServerMessage {
    
        constructor() {
            super();
        }
    
        /**
         * Read DebugUpdate from input stream
         */
        static async readFrom(stream: Stream): Promise<ServerMessage.DebugUpdate> {
            return new DebugUpdate()
        }
    
        /**
         * Write DebugUpdate to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(DebugUpdate.TAG);
        }
    }
    
    export namespace DebugUpdate {
        export const TAG = 3;
    }
}