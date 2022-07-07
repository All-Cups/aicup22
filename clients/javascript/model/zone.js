const Vec2 = require.main.require('./model/vec2');
/**
 * Current state of the game zone
 */
class Zone {
    /**
     * Current center
     */
    currentCenter;
    /**
     * Current radius
     */
    currentRadius;
    /**
     * Next center
     */
    nextCenter;
    /**
     * Next radius
     */
    nextRadius;

    constructor(currentCenter, currentRadius, nextCenter, nextRadius) {
        this.currentCenter = currentCenter;
        this.currentRadius = currentRadius;
        this.nextCenter = nextCenter;
        this.nextRadius = nextRadius;
    }

    /**
     * Read Zone from input stream
     */
    static async readFrom(stream) {
        let currentCenter;
        currentCenter = await Vec2.readFrom(stream);
        let currentRadius;
        currentRadius = await stream.readDouble();
        let nextCenter;
        nextCenter = await Vec2.readFrom(stream);
        let nextRadius;
        nextRadius = await stream.readDouble();
        return new Zone(currentCenter, currentRadius, nextCenter, nextRadius);
    }

    /**
     * Write Zone to output stream
     */
    async writeTo(stream) {
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
module.exports = Zone