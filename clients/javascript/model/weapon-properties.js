/**
 * Weapon properties
 */
class WeaponProperties {
    /**
     * Name
     */
    name;
    /**
     * Shooting speed (number of shots per second)
     */
    roundsPerSecond;
    /**
     * Accuracy (spread angle) of a shot (in degrees)
     */
    spread;
    /**
     * Aiming time
     */
    aimTime;
    /**
     * Field of view in full aim (in degrees)
     */
    aimFieldOfView;
    /**
     * Rotation speed in full aim (degrees per second)
     */
    aimRotationSpeed;
    /**
     * Movement speed modifier in full aim
     */
    aimMovementSpeedModifier;
    /**
     * Speed of projectiles
     */
    projectileSpeed;
    /**
     * Damage of a projectile
     */
    projectileDamage;
    /**
     * Projectiles' life time
     */
    projectileLifeTime;
    /**
     * Index of the sound when shooting (starting with 0), or None
     */
    shotSoundTypeIndex;
    /**
     * Index of the sound when hitting something (starting with 0), or None
     */
    projectileHitSoundTypeIndex;
    /**
     * Max amount of ammo unit can hold in their inventory
     */
    maxInventoryAmmo;

    constructor(name, roundsPerSecond, spread, aimTime, aimFieldOfView, aimRotationSpeed, aimMovementSpeedModifier, projectileSpeed, projectileDamage, projectileLifeTime, shotSoundTypeIndex, projectileHitSoundTypeIndex, maxInventoryAmmo) {
        this.name = name;
        this.roundsPerSecond = roundsPerSecond;
        this.spread = spread;
        this.aimTime = aimTime;
        this.aimFieldOfView = aimFieldOfView;
        this.aimRotationSpeed = aimRotationSpeed;
        this.aimMovementSpeedModifier = aimMovementSpeedModifier;
        this.projectileSpeed = projectileSpeed;
        this.projectileDamage = projectileDamage;
        this.projectileLifeTime = projectileLifeTime;
        this.shotSoundTypeIndex = shotSoundTypeIndex;
        this.projectileHitSoundTypeIndex = projectileHitSoundTypeIndex;
        this.maxInventoryAmmo = maxInventoryAmmo;
    }

    /**
     * Read WeaponProperties from input stream
     */
    static async readFrom(stream) {
        let name;
        name = await stream.readString();
        let roundsPerSecond;
        roundsPerSecond = await stream.readDouble();
        let spread;
        spread = await stream.readDouble();
        let aimTime;
        aimTime = await stream.readDouble();
        let aimFieldOfView;
        aimFieldOfView = await stream.readDouble();
        let aimRotationSpeed;
        aimRotationSpeed = await stream.readDouble();
        let aimMovementSpeedModifier;
        aimMovementSpeedModifier = await stream.readDouble();
        let projectileSpeed;
        projectileSpeed = await stream.readDouble();
        let projectileDamage;
        projectileDamage = await stream.readDouble();
        let projectileLifeTime;
        projectileLifeTime = await stream.readDouble();
        let shotSoundTypeIndex;
        if (await stream.readBool()) {
            shotSoundTypeIndex = await stream.readInt();
        } else {
            shotSoundTypeIndex = null;
        }
        let projectileHitSoundTypeIndex;
        if (await stream.readBool()) {
            projectileHitSoundTypeIndex = await stream.readInt();
        } else {
            projectileHitSoundTypeIndex = null;
        }
        let maxInventoryAmmo;
        maxInventoryAmmo = await stream.readInt();
        return new WeaponProperties(name, roundsPerSecond, spread, aimTime, aimFieldOfView, aimRotationSpeed, aimMovementSpeedModifier, projectileSpeed, projectileDamage, projectileLifeTime, shotSoundTypeIndex, projectileHitSoundTypeIndex, maxInventoryAmmo);
    }

    /**
     * Write WeaponProperties to output stream
     */
    async writeTo(stream) {
        let name = this.name;
        await stream.writeString(name);
        let roundsPerSecond = this.roundsPerSecond;
        await stream.writeDouble(roundsPerSecond);
        let spread = this.spread;
        await stream.writeDouble(spread);
        let aimTime = this.aimTime;
        await stream.writeDouble(aimTime);
        let aimFieldOfView = this.aimFieldOfView;
        await stream.writeDouble(aimFieldOfView);
        let aimRotationSpeed = this.aimRotationSpeed;
        await stream.writeDouble(aimRotationSpeed);
        let aimMovementSpeedModifier = this.aimMovementSpeedModifier;
        await stream.writeDouble(aimMovementSpeedModifier);
        let projectileSpeed = this.projectileSpeed;
        await stream.writeDouble(projectileSpeed);
        let projectileDamage = this.projectileDamage;
        await stream.writeDouble(projectileDamage);
        let projectileLifeTime = this.projectileLifeTime;
        await stream.writeDouble(projectileLifeTime);
        let shotSoundTypeIndex = this.shotSoundTypeIndex;
        if (shotSoundTypeIndex === null) {
            await stream.writeBool(false);
        } else {
            await stream.writeBool(true);
            await stream.writeInt(shotSoundTypeIndex);
        }
        let projectileHitSoundTypeIndex = this.projectileHitSoundTypeIndex;
        if (projectileHitSoundTypeIndex === null) {
            await stream.writeBool(false);
        } else {
            await stream.writeBool(true);
            await stream.writeInt(projectileHitSoundTypeIndex);
        }
        let maxInventoryAmmo = this.maxInventoryAmmo;
        await stream.writeInt(maxInventoryAmmo);
    }
}
module.exports = WeaponProperties