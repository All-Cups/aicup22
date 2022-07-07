/**
 * RGBA Color
 */
class Color {
    /**
     * Red component
     */
    r;
    /**
     * Green component
     */
    g;
    /**
     * Blue component
     */
    b;
    /**
     * Alpha (opacity) component
     */
    a;

    constructor(r, g, b, a) {
        this.r = r;
        this.g = g;
        this.b = b;
        this.a = a;
    }

    /**
     * Read Color from input stream
     */
    static async readFrom(stream) {
        let r;
        r = await stream.readDouble();
        let g;
        g = await stream.readDouble();
        let b;
        b = await stream.readDouble();
        let a;
        a = await stream.readDouble();
        return new Color(r, g, b, a);
    }

    /**
     * Write Color to output stream
     */
    async writeTo(stream) {
        let r = this.r;
        await stream.writeDouble(r);
        let g = this.g;
        await stream.writeDouble(g);
        let b = this.b;
        await stream.writeDouble(b);
        let a = this.a;
        await stream.writeDouble(a);
    }
}
module.exports = Color