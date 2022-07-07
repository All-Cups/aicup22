import { Stream } from "../stream";

/**
 * 2 dimensional vector.
 */
export class Vec2 {
    /**
     * `x` coordinate of the vector
     */
    x: number
    /**
     * `y` coordinate of the vector
     */
    y: number

    constructor(x: number, y: number) {
        this.x = x;
        this.y = y;
    }

    /**
     * Read Vec2 from input stream
     */
    static async readFrom(stream: Stream): Promise<Vec2> {
        let x;
        x = await stream.readDouble();
        let y;
        y = await stream.readDouble();
        return new Vec2(x, y)
    }

    /**
     * Write Vec2 to output stream
     */
    async writeTo(stream: Stream) {
        let x = this.x;
        await stream.writeDouble(x);
        let y = this.y;
        await stream.writeDouble(y);
    }
}