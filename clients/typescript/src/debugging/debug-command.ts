import { DebugData } from "./debug-data";
import { Stream } from "../stream";

/**
 * Debug commands that can be sent while debugging with the app
 */
export abstract class DebugCommand {
    /**
     * Write DebugCommand to output stream
     */
    abstract writeTo(stream: Stream): Promise<void>;

    /**
     * Read DebugCommand from input stream
     */
    static async readFrom(stream: Stream): Promise<DebugCommand> {
        const tag = await stream.readInt();
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

export namespace DebugCommand {
    /**
     * Add debug data to current tick
     */
    export class Add extends DebugCommand {
        /**
         * Data to add
         */
        debugData: DebugData
    
        constructor(debugData: DebugData) {
            super();
            this.debugData = debugData;
        }
    
        /**
         * Read Add from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugCommand.Add> {
            let debugData;
            debugData = await DebugData.readFrom(stream);
            return new Add(debugData)
        }
    
        /**
         * Write Add to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(Add.TAG);
            let debugData = this.debugData;
            await debugData.writeTo(stream);
        }
    }
    
    export namespace Add {
        export const TAG = 0;
    }
    /**
     * Clear current tick's debug data
     */
    export class Clear extends DebugCommand {
    
        constructor() {
            super();
        }
    
        /**
         * Read Clear from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugCommand.Clear> {
            return new Clear()
        }
    
        /**
         * Write Clear to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(Clear.TAG);
        }
    }
    
    export namespace Clear {
        export const TAG = 1;
    }
    /**
     * Enable/disable auto performing of commands
     */
    export class SetAutoFlush extends DebugCommand {
        /**
         * Enable/disable autoflush
         */
        enable: boolean
    
        constructor(enable: boolean) {
            super();
            this.enable = enable;
        }
    
        /**
         * Read SetAutoFlush from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugCommand.SetAutoFlush> {
            let enable;
            enable = await stream.readBool();
            return new SetAutoFlush(enable)
        }
    
        /**
         * Write SetAutoFlush to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(SetAutoFlush.TAG);
            let enable = this.enable;
            await stream.writeBool(enable);
        }
    }
    
    export namespace SetAutoFlush {
        export const TAG = 2;
    }
    /**
     * Perform all previously sent commands
     */
    export class Flush extends DebugCommand {
    
        constructor() {
            super();
        }
    
        /**
         * Read Flush from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugCommand.Flush> {
            return new Flush()
        }
    
        /**
         * Write Flush to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(Flush.TAG);
        }
    }
    
    export namespace Flush {
        export const TAG = 3;
    }
}