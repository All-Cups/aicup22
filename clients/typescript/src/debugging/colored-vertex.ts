import { Color } from "./color";
import { Vec2 } from "../model/vec2";
import { Stream } from "../stream";

/**
 * Point + color
 */
export class ColoredVertex {
    /**
     * Position
     */
    position: Vec2
    /**
     * Color
     */
    color: Color

    constructor(position: Vec2, color: Color) {
        this.position = position;
        this.color = color;
    }

    /**
     * Read ColoredVertex from input stream
     */
    static async readFrom(stream: Stream): Promise<ColoredVertex> {
        let position;
        position = await Vec2.readFrom(stream);
        let color;
        color = await Color.readFrom(stream);
        return new ColoredVertex(position, color)
    }

    /**
     * Write ColoredVertex to output stream
     */
    async writeTo(stream: Stream) {
        let position = this.position;
        await position.writeTo(stream);
        let color = this.color;
        await color.writeTo(stream);
    }
}