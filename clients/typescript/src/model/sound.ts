import { Vec2 } from "./vec2";
import { Stream } from "../stream";

/**
 * Sound heard by one of your units
 */
export class Sound {
    /**
     * Sound type index (starting with 0)
     */
    typeIndex: number
    /**
     * Id of unit that heard this sound
     */
    unitId: number
    /**
     * Position where sound was heard (different from sound source position)
     */
    position: Vec2

    constructor(typeIndex: number, unitId: number, position: Vec2) {
        this.typeIndex = typeIndex;
        this.unitId = unitId;
        this.position = position;
    }

    /**
     * Read Sound from input stream
     */
    static async readFrom(stream: Stream): Promise<Sound> {
        let typeIndex;
        typeIndex = await stream.readInt();
        let unitId;
        unitId = await stream.readInt();
        let position;
        position = await Vec2.readFrom(stream);
        return new Sound(typeIndex, unitId, position)
    }

    /**
     * Write Sound to output stream
     */
    async writeTo(stream: Stream) {
        let typeIndex = this.typeIndex;
        await stream.writeInt(typeIndex);
        let unitId = this.unitId;
        await stream.writeInt(unitId);
        let position = this.position;
        await position.writeTo(stream);
    }
}