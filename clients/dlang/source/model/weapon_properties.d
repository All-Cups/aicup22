module model.weapon_properties;

import stream;
import std.conv;
import std.typecons : Nullable;


/// Weapon properties
struct WeaponProperties {
    /// Name
    string name;
    /// Shooting speed (number of shots per second)
    double roundsPerSecond;
    /// Accuracy (spread angle) of a shot (in degrees)
    double spread;
    /// Aiming time
    double aimTime;
    /// Field of view in full aim (in degrees)
    double aimFieldOfView;
    /// Rotation speed in full aim (degrees per second)
    double aimRotationSpeed;
    /// Movement speed modifier in full aim
    double aimMovementSpeedModifier;
    /// Speed of projectiles
    double projectileSpeed;
    /// Damage of a projectile
    double projectileDamage;
    /// Projectiles' life time
    double projectileLifeTime;
    /// Index of the sound when shooting (starting with 0), or None
    Nullable!(int) shotSoundTypeIndex;
    /// Index of the sound when hitting something (starting with 0), or None
    Nullable!(int) projectileHitSoundTypeIndex;
    /// Max amount of ammo unit can hold in their inventory
    int maxInventoryAmmo;

    this(string name, double roundsPerSecond, double spread, double aimTime, double aimFieldOfView, double aimRotationSpeed, double aimMovementSpeedModifier, double projectileSpeed, double projectileDamage, double projectileLifeTime, Nullable!(int) shotSoundTypeIndex, Nullable!(int) projectileHitSoundTypeIndex, int maxInventoryAmmo) {
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

    /// Read WeaponProperties from reader
    static WeaponProperties readFrom(Stream reader) {
        string name;
        name = reader.readString();
        double roundsPerSecond;
        roundsPerSecond = reader.readDouble();
        double spread;
        spread = reader.readDouble();
        double aimTime;
        aimTime = reader.readDouble();
        double aimFieldOfView;
        aimFieldOfView = reader.readDouble();
        double aimRotationSpeed;
        aimRotationSpeed = reader.readDouble();
        double aimMovementSpeedModifier;
        aimMovementSpeedModifier = reader.readDouble();
        double projectileSpeed;
        projectileSpeed = reader.readDouble();
        double projectileDamage;
        projectileDamage = reader.readDouble();
        double projectileLifeTime;
        projectileLifeTime = reader.readDouble();
        Nullable!(int) shotSoundTypeIndex;
        if (reader.readBool()) {
            shotSoundTypeIndex = reader.readInt();
        } else {
            shotSoundTypeIndex.nullify();
        }
        Nullable!(int) projectileHitSoundTypeIndex;
        if (reader.readBool()) {
            projectileHitSoundTypeIndex = reader.readInt();
        } else {
            projectileHitSoundTypeIndex.nullify();
        }
        int maxInventoryAmmo;
        maxInventoryAmmo = reader.readInt();
        return WeaponProperties(name, roundsPerSecond, spread, aimTime, aimFieldOfView, aimRotationSpeed, aimMovementSpeedModifier, projectileSpeed, projectileDamage, projectileLifeTime, shotSoundTypeIndex, projectileHitSoundTypeIndex, maxInventoryAmmo);
    }

    /// Write WeaponProperties to writer
    void writeTo(Stream writer) const {
        writer.write(name);
        writer.write(roundsPerSecond);
        writer.write(spread);
        writer.write(aimTime);
        writer.write(aimFieldOfView);
        writer.write(aimRotationSpeed);
        writer.write(aimMovementSpeedModifier);
        writer.write(projectileSpeed);
        writer.write(projectileDamage);
        writer.write(projectileLifeTime);
        if (shotSoundTypeIndex.isNull()) {
            writer.write(false);
        } else {
            writer.write(true);
            auto shotSoundTypeIndexValue = shotSoundTypeIndex.get;
            writer.write(shotSoundTypeIndexValue);
        }
        if (projectileHitSoundTypeIndex.isNull()) {
            writer.write(false);
        } else {
            writer.write(true);
            auto projectileHitSoundTypeIndexValue = projectileHitSoundTypeIndex.get;
            writer.write(projectileHitSoundTypeIndexValue);
        }
        writer.write(maxInventoryAmmo);
    }
}