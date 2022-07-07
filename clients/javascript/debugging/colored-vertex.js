const Color = require.main.require('./debugging/color');
const Vec2 = require.main.require('./model/vec2');
/**
 * Point + color
 */
class ColoredVertex {
    /**
     * Position
     */
    position;
    /**
     * Color
     */
    color;

    constructor(position, color) {
        this.position = position;
        this.color = color;
    }

    /**
     * Read ColoredVertex from input stream
     */
    static async readFrom(stream) {
        let position;
        position = await Vec2.readFrom(stream);
        let color;
        color = await Color.readFrom(stream);
        return new ColoredVertex(position, color);
    }

    /**
     * Write ColoredVertex to output stream
     */
    async writeTo(stream) {
        let position = this.position;
        await position.writeTo(stream);
        let color = this.color;
        await color.writeTo(stream);
    }
}
module.exports = ColoredVertex