const DebugData = require.main.require('./debugging/debug-data');

/**
 * Debug commands that can be sent while debugging with the app
 */
class DebugCommand {
    /**
     * Read DebugCommand from input stream
     */
    static async readFrom(stream) {
        let tag = await stream.readInt();
        if (tag == DebugCommand.Add.TAG) {
            return await DebugCommand.Add.readFrom(stream);
        }
        if (tag == DebugCommand.Clear.TAG) {
            return await DebugCommand.Clear.readFrom(stream);
        }
        if (tag == DebugCommand.SetAutoFlush.TAG) {
            return await DebugCommand.SetAutoFlush.readFrom(stream);
        }
        if (tag == DebugCommand.Flush.TAG) {
            return await DebugCommand.Flush.readFrom(stream);
        }
        throw new Error("Unexpected tag value");
    }
}
/**
 * Add debug data to current tick
 */
class Add extends DebugCommand {
    /**
     * Data to add
     */
    debugData;

    constructor(debugData) {
        super();
        this.debugData = debugData;
    }

    /**
     * Read Add from input stream
     */
    static async readFrom(stream) {
        let debugData;
        debugData = await DebugData.readFrom(stream);
        return new Add(debugData);
    }

    /**
     * Write Add to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Add.TAG);
        let debugData = this.debugData;
        await debugData.writeTo(stream);
    }
}

Add.TAG = 0;
DebugCommand.Add = Add;
/**
 * Clear current tick's debug data
 */
class Clear extends DebugCommand {

    constructor() {
        super();
    }

    /**
     * Read Clear from input stream
     */
    static async readFrom(stream) {
        return new Clear();
    }

    /**
     * Write Clear to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Clear.TAG);
    }
}

Clear.TAG = 1;
DebugCommand.Clear = Clear;
/**
 * Enable/disable auto performing of commands
 */
class SetAutoFlush extends DebugCommand {
    /**
     * Enable/disable autoflush
     */
    enable;

    constructor(enable) {
        super();
        this.enable = enable;
    }

    /**
     * Read SetAutoFlush from input stream
     */
    static async readFrom(stream) {
        let enable;
        enable = await stream.readBool();
        return new SetAutoFlush(enable);
    }

    /**
     * Write SetAutoFlush to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(SetAutoFlush.TAG);
        let enable = this.enable;
        await stream.writeBool(enable);
    }
}

SetAutoFlush.TAG = 2;
DebugCommand.SetAutoFlush = SetAutoFlush;
/**
 * Perform all previously sent commands
 */
class Flush extends DebugCommand {

    constructor() {
        super();
    }

    /**
     * Read Flush from input stream
     */
    static async readFrom(stream) {
        return new Flush();
    }

    /**
     * Write Flush to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Flush.TAG);
    }
}

Flush.TAG = 3;
DebugCommand.Flush = Flush;
module.exports = DebugCommand;