import { Vec2 } from "./vec2";
import { Stream } from "../stream";

/**
 * Current state of the game zone
 */
export class Zone {
    /**
     * Current center
     */
    currentCenter: Vec2
    /**
     * Current radius
     */
    currentRadius: number
    /**
     * Next center
     */
    nextCenter: Vec2
    /**
     * Next radius
     */
    nextRadius: number

    constructor(currentCenter: Vec2, currentRadius: number, nextCenter: Vec2, nextRadius: number) {
        this.currentCenter = currentCenter;
        this.currentRadius = currentRadius;
        this.nextCenter = nextCenter;
        this.nextRadius = nextRadius;
    }

    /**
     * Read Zone from input stream
     */
    static async readFrom(stream: Stream): Promise<Zone> {
        let currentCenter;
        currentCenter = await Vec2.readFrom(stream);
        let currentRadius;
        currentRadius = await stream.readDouble();
        let nextCenter;
        nextCenter = await Vec2.readFrom(stream);
        let nextRadius;
        nextRadius = await stream.readDouble();
        return new Zone(currentCenter, currentRadius, nextCenter, nextRadius)
    }

    /**
     * Write Zone to output stream
     */
    async writeTo(stream: Stream) {
        let currentCenter = this.currentCenter;
        await currentCenter.writeTo(stream);
        let currentRadius = this.currentRadius;
        await stream.writeDouble(currentRadius);
        let nextCenter = this.nextCenter;
        await nextCenter.writeTo(stream);
        let nextRadius = this.nextRadius;
        await stream.writeDouble(nextRadius);
    }
}