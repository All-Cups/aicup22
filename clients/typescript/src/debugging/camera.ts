import { Vec2 } from "../model/vec2";
import { Stream } from "../stream";

/**
 * Camera state
 */
export class Camera {
    /**
     * Center
     */
    center: Vec2
    /**
     * Rotation
     */
    rotation: number
    /**
     * Attack angle
     */
    attack: number
    /**
     * Vertical field of view
     */
    fov: number

    constructor(center: Vec2, rotation: number, attack: number, fov: number) {
        this.center = center;
        this.rotation = rotation;
        this.attack = attack;
        this.fov = fov;
    }

    /**
     * Read Camera from input stream
     */
    static async readFrom(stream: Stream): Promise<Camera> {
        let center;
        center = await Vec2.readFrom(stream);
        let rotation;
        rotation = await stream.readDouble();
        let attack;
        attack = await stream.readDouble();
        let fov;
        fov = await stream.readDouble();
        return new Camera(center, rotation, attack, fov)
    }

    /**
     * Write Camera to output stream
     */
    async writeTo(stream: Stream) {
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