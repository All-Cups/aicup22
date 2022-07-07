import { Stream } from "../stream";

/**
 * Sound properties
 */
export class SoundProperties {
    /**
     * Name
     */
    name: string
    /**
     * Distance from which the sound can be heard
     */
    distance: number
    /**
     * Offset modifier
     */
    offset: number

    constructor(name: string, distance: number, offset: number) {
        this.name = name;
        this.distance = distance;
        this.offset = offset;
    }

    /**
     * Read SoundProperties from input stream
     */
    static async readFrom(stream: Stream): Promise<SoundProperties> {
        let name;
        name = await stream.readString();
        let distance;
        distance = await stream.readDouble();
        let offset;
        offset = await stream.readDouble();
        return new SoundProperties(name, distance, offset)
    }

    /**
     * Write SoundProperties to output stream
     */
    async writeTo(stream: Stream) {
        let name = this.name;
        await stream.writeString(name);
        let distance = this.distance;
        await stream.writeDouble(distance);
        let offset = this.offset;
        await stream.writeDouble(offset);
    }
}