const Constants = require.main.require('./model/constants');
const Game = require.main.require('./model/game');

/**
 * Message sent from server
 */
class ServerMessage {
    /**
     * Read ServerMessage from input stream
     */
    static async readFrom(stream) {
        let tag = await stream.readInt();
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
/**
 * Update constants
 */
class UpdateConstants extends ServerMessage {
    /**
     * New constants
     */
    constants;

    constructor(constants) {
        super();
        this.constants = constants;
    }

    /**
     * Read UpdateConstants from input stream
     */
    static async readFrom(stream) {
        let constants;
        constants = await Constants.readFrom(stream);
        return new UpdateConstants(constants);
    }

    /**
     * Write UpdateConstants to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(UpdateConstants.TAG);
        let constants = this.constants;
        await constants.writeTo(stream);
    }
}

UpdateConstants.TAG = 0;
ServerMessage.UpdateConstants = UpdateConstants;
/**
 * Get order for next tick
 */
class GetOrder extends ServerMessage {
    /**
     * Player's view
     */
    playerView;
    /**
     * Whether app is running with debug interface available
     */
    debugAvailable;

    constructor(playerView, debugAvailable) {
        super();
        this.playerView = playerView;
        this.debugAvailable = debugAvailable;
    }

    /**
     * Read GetOrder from input stream
     */
    static async readFrom(stream) {
        let playerView;
        playerView = await Game.readFrom(stream);
        let debugAvailable;
        debugAvailable = await stream.readBool();
        return new GetOrder(playerView, debugAvailable);
    }

    /**
     * Write GetOrder to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(GetOrder.TAG);
        let playerView = this.playerView;
        await playerView.writeTo(stream);
        let debugAvailable = this.debugAvailable;
        await stream.writeBool(debugAvailable);
    }
}

GetOrder.TAG = 1;
ServerMessage.GetOrder = GetOrder;
/**
 * Signifies end of the game
 */
class Finish extends ServerMessage {

    constructor() {
        super();
    }

    /**
     * Read Finish from input stream
     */
    static async readFrom(stream) {
        return new Finish();
    }

    /**
     * Write Finish to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Finish.TAG);
    }
}

Finish.TAG = 2;
ServerMessage.Finish = Finish;
/**
 * Debug update
 */
class DebugUpdate extends ServerMessage {

    constructor() {
        super();
    }

    /**
     * Read DebugUpdate from input stream
     */
    static async readFrom(stream) {
        return new DebugUpdate();
    }

    /**
     * Write DebugUpdate to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(DebugUpdate.TAG);
    }
}

DebugUpdate.TAG = 3;
ServerMessage.DebugUpdate = DebugUpdate;
module.exports = ServerMessage;