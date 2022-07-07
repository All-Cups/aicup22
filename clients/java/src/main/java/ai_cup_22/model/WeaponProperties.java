package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Weapon properties
 */
public class WeaponProperties {
    /**
     * Name
     */
    private String name;

    /**
     * Name
     */
    public String getName() {
        return name;
    }

    /**
     * Name
     */
    public void setName(String value) {
        this.name = value;
    }
    /**
     * Shooting speed (number of shots per second)
     */
    private double roundsPerSecond;

    /**
     * Shooting speed (number of shots per second)
     */
    public double getRoundsPerSecond() {
        return roundsPerSecond;
    }

    /**
     * Shooting speed (number of shots per second)
     */
    public void setRoundsPerSecond(double value) {
        this.roundsPerSecond = value;
    }
    /**
     * Accuracy (spread angle) of a shot (in degrees)
     */
    private double spread;

    /**
     * Accuracy (spread angle) of a shot (in degrees)
     */
    public double getSpread() {
        return spread;
    }

    /**
     * Accuracy (spread angle) of a shot (in degrees)
     */
    public void setSpread(double value) {
        this.spread = value;
    }
    /**
     * Aiming time
     */
    private double aimTime;

    /**
     * Aiming time
     */
    public double getAimTime() {
        return aimTime;
    }

    /**
     * Aiming time
     */
    public void setAimTime(double value) {
        this.aimTime = value;
    }
    /**
     * Field of view in full aim (in degrees)
     */
    private double aimFieldOfView;

    /**
     * Field of view in full aim (in degrees)
     */
    public double getAimFieldOfView() {
        return aimFieldOfView;
    }

    /**
     * Field of view in full aim (in degrees)
     */
    public void setAimFieldOfView(double value) {
        this.aimFieldOfView = value;
    }
    /**
     * Rotation speed in full aim (degrees per second)
     */
    private double aimRotationSpeed;

    /**
     * Rotation speed in full aim (degrees per second)
     */
    public double getAimRotationSpeed() {
        return aimRotationSpeed;
    }

    /**
     * Rotation speed in full aim (degrees per second)
     */
    public void setAimRotationSpeed(double value) {
        this.aimRotationSpeed = value;
    }
    /**
     * Movement speed modifier in full aim
     */
    private double aimMovementSpeedModifier;

    /**
     * Movement speed modifier in full aim
     */
    public double getAimMovementSpeedModifier() {
        return aimMovementSpeedModifier;
    }

    /**
     * Movement speed modifier in full aim
     */
    public void setAimMovementSpeedModifier(double value) {
        this.aimMovementSpeedModifier = value;
    }
    /**
     * Speed of projectiles
     */
    private double projectileSpeed;

    /**
     * Speed of projectiles
     */
    public double getProjectileSpeed() {
        return projectileSpeed;
    }

    /**
     * Speed of projectiles
     */
    public void setProjectileSpeed(double value) {
        this.projectileSpeed = value;
    }
    /**
     * Damage of a projectile
     */
    private double projectileDamage;

    /**
     * Damage of a projectile
     */
    public double getProjectileDamage() {
        return projectileDamage;
    }

    /**
     * Damage of a projectile
     */
    public void setProjectileDamage(double value) {
        this.projectileDamage = value;
    }
    /**
     * Projectiles' life time
     */
    private double projectileLifeTime;

    /**
     * Projectiles' life time
     */
    public double getProjectileLifeTime() {
        return projectileLifeTime;
    }

    /**
     * Projectiles' life time
     */
    public void setProjectileLifeTime(double value) {
        this.projectileLifeTime = value;
    }
    /**
     * Index of the sound when shooting (starting with 0), or None
     */
    private Integer shotSoundTypeIndex;

    /**
     * Index of the sound when shooting (starting with 0), or None
     */
    public Integer getShotSoundTypeIndex() {
        return shotSoundTypeIndex;
    }

    /**
     * Index of the sound when shooting (starting with 0), or None
     */
    public void setShotSoundTypeIndex(Integer value) {
        this.shotSoundTypeIndex = value;
    }
    /**
     * Index of the sound when hitting something (starting with 0), or None
     */
    private Integer projectileHitSoundTypeIndex;

    /**
     * Index of the sound when hitting something (starting with 0), or None
     */
    public Integer getProjectileHitSoundTypeIndex() {
        return projectileHitSoundTypeIndex;
    }

    /**
     * Index of the sound when hitting something (starting with 0), or None
     */
    public void setProjectileHitSoundTypeIndex(Integer value) {
        this.projectileHitSoundTypeIndex = value;
    }
    /**
     * Max amount of ammo unit can hold in their inventory
     */
    private int maxInventoryAmmo;

    /**
     * Max amount of ammo unit can hold in their inventory
     */
    public int getMaxInventoryAmmo() {
        return maxInventoryAmmo;
    }

    /**
     * Max amount of ammo unit can hold in their inventory
     */
    public void setMaxInventoryAmmo(int value) {
        this.maxInventoryAmmo = value;
    }

    public WeaponProperties(String name, double roundsPerSecond, double spread, double aimTime, double aimFieldOfView, double aimRotationSpeed, double aimMovementSpeedModifier, double projectileSpeed, double projectileDamage, double projectileLifeTime, Integer shotSoundTypeIndex, Integer projectileHitSoundTypeIndex, int maxInventoryAmmo) {
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
    public static WeaponProperties readFrom(java.io.InputStream stream) throws java.io.IOException {
        String name;
        name = StreamUtil.readString(stream);
        double roundsPerSecond;
        roundsPerSecond = StreamUtil.readDouble(stream);
        double spread;
        spread = StreamUtil.readDouble(stream);
        double aimTime;
        aimTime = StreamUtil.readDouble(stream);
        double aimFieldOfView;
        aimFieldOfView = StreamUtil.readDouble(stream);
        double aimRotationSpeed;
        aimRotationSpeed = StreamUtil.readDouble(stream);
        double aimMovementSpeedModifier;
        aimMovementSpeedModifier = StreamUtil.readDouble(stream);
        double projectileSpeed;
        projectileSpeed = StreamUtil.readDouble(stream);
        double projectileDamage;
        projectileDamage = StreamUtil.readDouble(stream);
        double projectileLifeTime;
        projectileLifeTime = StreamUtil.readDouble(stream);
        Integer shotSoundTypeIndex;
        if (StreamUtil.readBoolean(stream)) {
            shotSoundTypeIndex = StreamUtil.readInt(stream);
        } else {
            shotSoundTypeIndex = null;
        }
        Integer projectileHitSoundTypeIndex;
        if (StreamUtil.readBoolean(stream)) {
            projectileHitSoundTypeIndex = StreamUtil.readInt(stream);
        } else {
            projectileHitSoundTypeIndex = null;
        }
        int maxInventoryAmmo;
        maxInventoryAmmo = StreamUtil.readInt(stream);
        return new WeaponProperties(name, roundsPerSecond, spread, aimTime, aimFieldOfView, aimRotationSpeed, aimMovementSpeedModifier, projectileSpeed, projectileDamage, projectileLifeTime, shotSoundTypeIndex, projectileHitSoundTypeIndex, maxInventoryAmmo);
    }

    /**
     * Write WeaponProperties to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeString(stream, name);
        StreamUtil.writeDouble(stream, roundsPerSecond);
        StreamUtil.writeDouble(stream, spread);
        StreamUtil.writeDouble(stream, aimTime);
        StreamUtil.writeDouble(stream, aimFieldOfView);
        StreamUtil.writeDouble(stream, aimRotationSpeed);
        StreamUtil.writeDouble(stream, aimMovementSpeedModifier);
        StreamUtil.writeDouble(stream, projectileSpeed);
        StreamUtil.writeDouble(stream, projectileDamage);
        StreamUtil.writeDouble(stream, projectileLifeTime);
        if (shotSoundTypeIndex == null) {
            StreamUtil.writeBoolean(stream, false);
        } else {
            StreamUtil.writeBoolean(stream, true);
            StreamUtil.writeInt(stream, shotSoundTypeIndex);
        }
        if (projectileHitSoundTypeIndex == null) {
            StreamUtil.writeBoolean(stream, false);
        } else {
            StreamUtil.writeBoolean(stream, true);
            StreamUtil.writeInt(stream, projectileHitSoundTypeIndex);
        }
        StreamUtil.writeInt(stream, maxInventoryAmmo);
    }

    /**
     * Get string representation of WeaponProperties
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("WeaponProperties { ");
        stringBuilder.append("name: ");
        stringBuilder.append('"' + name + '"');
        stringBuilder.append(", ");
        stringBuilder.append("roundsPerSecond: ");
        stringBuilder.append(String.valueOf(roundsPerSecond));
        stringBuilder.append(", ");
        stringBuilder.append("spread: ");
        stringBuilder.append(String.valueOf(spread));
        stringBuilder.append(", ");
        stringBuilder.append("aimTime: ");
        stringBuilder.append(String.valueOf(aimTime));
        stringBuilder.append(", ");
        stringBuilder.append("aimFieldOfView: ");
        stringBuilder.append(String.valueOf(aimFieldOfView));
        stringBuilder.append(", ");
        stringBuilder.append("aimRotationSpeed: ");
        stringBuilder.append(String.valueOf(aimRotationSpeed));
        stringBuilder.append(", ");
        stringBuilder.append("aimMovementSpeedModifier: ");
        stringBuilder.append(String.valueOf(aimMovementSpeedModifier));
        stringBuilder.append(", ");
        stringBuilder.append("projectileSpeed: ");
        stringBuilder.append(String.valueOf(projectileSpeed));
        stringBuilder.append(", ");
        stringBuilder.append("projectileDamage: ");
        stringBuilder.append(String.valueOf(projectileDamage));
        stringBuilder.append(", ");
        stringBuilder.append("projectileLifeTime: ");
        stringBuilder.append(String.valueOf(projectileLifeTime));
        stringBuilder.append(", ");
        stringBuilder.append("shotSoundTypeIndex: ");
        stringBuilder.append(String.valueOf(shotSoundTypeIndex));
        stringBuilder.append(", ");
        stringBuilder.append("projectileHitSoundTypeIndex: ");
        stringBuilder.append(String.valueOf(projectileHitSoundTypeIndex));
        stringBuilder.append(", ");
        stringBuilder.append("maxInventoryAmmo: ");
        stringBuilder.append(String.valueOf(maxInventoryAmmo));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}