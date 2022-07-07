const Vec2 = require.main.require('./model/vec2');
/**
 * Camera state
 */
class Camera {
    /**
     * Center
     */
    center;
    /**
     * Rotation
     */
    rotation;
    /**
     * Attack angle
     */
    attack;
    /**
     * Vertical field of view
     */
    fov;

    constructor(center, rotation, attack, fov) {
        this.center = center;
        this.rotation = rotation;
        this.attack = attack;
        this.fov = fov;
    }

    /**
     * Read Camera from input stream
     */
    static async readFrom(stream) {
        let center;
        center = await Vec2.readFrom(stream);
        let rotation;
        rotation = await stream.readDouble();
        let attack;
        attack = await stream.readDouble();
        let fov;
        fov = await stream.readDouble();
        return new Camera(center, rotation, attack, fov);
    }

    /**
     * Write Camera to output stream
     */
    async writeTo(stream) {
        let center = this.center;
        await center.writeTo(stream);
        let rotation = this.rotation;
        await stream.writeDouble(rotation);
        let attack = this.attack;
        await stream.writeDouble(attack);
        let fov = this.fov;
        await stream.writeDouble(fov);
    }
}
module.exports = Camera