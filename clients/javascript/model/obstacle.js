const Vec2 = require.main.require('./model/vec2');
/**
 * An obstacle on the map
 */
class Obstacle {
    /**
     * Unique id
     */
    id;
    /**
     * Center position
     */
    position;
    /**
     * Obstacle's radius
     */
    radius;
    /**
     * Whether units can see through this obstacle, or it blocks the view
     */
    canSeeThrough;
    /**
     * Whether projectiles can go through this obstacle
     */
    canShootThrough;

    constructor(id, position, radius, canSeeThrough, canShootThrough) {
        this.id = id;
        this.position = position;
        this.radius = radius;
        this.canSeeThrough = canSeeThrough;
        this.canShootThrough = canShootThrough;
    }

    /**
     * Read Obstacle from input stream
     */
    static async readFrom(stream) {
        let id;
        id = await stream.readInt();
        let position;
        position = await Vec2.readFrom(stream);
        let radius;
        radius = await stream.readDouble();
        let canSeeThrough;
        canSeeThrough = await stream.readBool();
        let canShootThrough;
        canShootThrough = await stream.readBool();
        return new Obstacle(id, position, radius, canSeeThrough, canShootThrough);
    }

    /**
     * Write Obstacle to output stream
     */
    async writeTo(stream) {
        let id = this.id;
        await stream.writeInt(id);
        let position = this.position;
        await position.writeTo(stream);
        let radius = this.radius;
        await stream.writeDouble(radius);
        let canSeeThrough = this.canSeeThrough;
        await stream.writeBool(canSeeThrough);
        let canShootThrough = this.canShootThrough;
        await stream.writeBool(canShootThrough);
    }
}
module.exports = Obstacle