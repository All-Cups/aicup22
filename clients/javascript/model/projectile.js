const Vec2 = require.main.require('./model/vec2');
/**
 * Weapon projectile
 */
class Projectile {
    /**
     * Unique id
     */
    id;
    /**
     * Index of the weapon this projectile was shot from (starts with 0)
     */
    weaponTypeIndex;
    /**
     * Id of unit who made the shot
     */
    shooterId;
    /**
     * Id of player (team), whose unit made the shot
     */
    shooterPlayerId;
    /**
     * Current position
     */
    position;
    /**
     * Projectile's velocity
     */
    velocity;
    /**
     * Left time of projectile's life
     */
    lifeTime;

    constructor(id, weaponTypeIndex, shooterId, shooterPlayerId, position, velocity, lifeTime) {
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
    static async readFrom(stream) {
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
        return new Projectile(id, weaponTypeIndex, shooterId, shooterPlayerId, position, velocity, lifeTime);
    }

    /**
     * Write Projectile to output stream
     */
    async writeTo(stream) {
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
module.exports = Projectile