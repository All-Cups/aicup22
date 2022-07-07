import { Vec2 } from "./vec2";
import { Stream } from "../stream";

/**
 * An obstacle on the map
 */
export class Obstacle {
    /**
     * Unique id
     */
    id: number
    /**
     * Center position
     */
    position: Vec2
    /**
     * Obstacle's radius
     */
    radius: number
    /**
     * Whether units can see through this obstacle, or it blocks the view
     */
    canSeeThrough: boolean
    /**
     * Whether projectiles can go through this obstacle
     */
    canShootThrough: boolean

    constructor(id: number, position: Vec2, radius: number, canSeeThrough: boolean, canShootThrough: boolean) {
        this.id = id;
        this.position = position;
        this.radius = radius;
        this.canSeeThrough = canSeeThrough;
        this.canShootThrough = canShootThrough;
    }

    /**
     * Read Obstacle from input stream
     */
    static async readFrom(stream: Stream): Promise<Obstacle> {
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
        return new Obstacle(id, position, radius, canSeeThrough, canShootThrough)
    }

    /**
     * Write Obstacle to output stream
     */
    async writeTo(stream: Stream) {
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