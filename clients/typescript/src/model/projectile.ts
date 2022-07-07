import { Vec2 } from "./vec2";
import { Stream } from "../stream";

/**
 * Weapon projectile
 */
export class Projectile {
    /**
     * Unique id
     */
    id: number
    /**
     * Index of the weapon this projectile was shot from (starts with 0)
     */
    weaponTypeIndex: number
    /**
     * Id of unit who made the shot
     */
    shooterId: number
    /**
     * Id of player (team), whose unit made the shot
     */
    shooterPlayerId: number
    /**
     * Current position
     */
    position: Vec2
    /**
     * Projectile's velocity
     */
    velocity: Vec2
    /**
     * Left time of projectile's life
     */
    lifeTime: number

    constructor(id: number, weaponTypeIndex: number, shooterId: number, shooterPlayerId: number, position: Vec2, velocity: Vec2, lifeTime: number) {
        this.id = id;
        this.weaponTypeIndex = weaponTypeIndex;
        this.shooterId = shooterId;
        this.shooterPlayerId = shooterPlayerId;
        this.position = position;
        this.velocity = velocity;
        this.lifeTime = lifeTime;
    }

    /**
     * Read Projectile from input stream
     */
    static async readFrom(stream: Stream): Promise<Projectile> {
        let id;
        id = await stream.readInt();
        let weaponTypeIndex;
        weaponTypeIndex = await stream.readInt();
        let shooterId;
        shooterId = await stream.readInt();
        let shooterPlayerId;
        shooterPlayerId = await stream.readInt();
        let position;
        position = await Vec2.readFrom(stream);
        let velocity;
        velocity = await Vec2.readFrom(stream);
        let lifeTime;
        lifeTime = await stream.readDouble();
        return new Projectile(id, weaponTypeIndex, shooterId, shooterPlayerId, position, velocity, lifeTime)
    }

    /**
     * Write Projectile to output stream
     */
    async writeTo(stream: Stream) {
        let id = this.id;
        await stream.writeInt(id);
        let weaponTypeIndex = this.weaponTypeIndex;
        await stream.writeInt(weaponTypeIndex);
        let shooterId = this.shooterId;
        await stream.writeInt(shooterId);
        let shooterPlayerId = this.shooterPlayerId;
        await stream.writeInt(shooterPlayerId);
        let position = this.position;
        await position.writeTo(stream);
        let velocity = this.velocity;
        await velocity.writeTo(stream);
        let lifeTime = this.lifeTime;
        await stream.writeDouble(lifeTime);
    }
}