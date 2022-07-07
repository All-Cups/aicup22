package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Weapon properties
 */
class WeaponProperties {
    /**
     * Name
     */
    var name: String
    /**
     * Shooting speed (number of shots per second)
     */
    var roundsPerSecond: Double
    /**
     * Accuracy (spread angle) of a shot (in degrees)
     */
    var spread: Double
    /**
     * Aiming time
     */
    var aimTime: Double
    /**
     * Field of view in full aim (in degrees)
     */
    var aimFieldOfView: Double
    /**
     * Rotation speed in full aim (degrees per second)
     */
    var aimRotationSpeed: Double
    /**
     * Movement speed modifier in full aim
     */
    var aimMovementSpeedModifier: Double
    /**
     * Speed of projectiles
     */
    var projectileSpeed: Double
    /**
     * Damage of a projectile
     */
    var projectileDamage: Double
    /**
     * Projectiles' life time
     */
    var projectileLifeTime: Double
    /**
     * Index of the sound when shooting (starting with 0), or None
     */
    var shotSoundTypeIndex: Int?
    /**
     * Index of the sound when hitting something (starting with 0), or None
     */
    var projectileHitSoundTypeIndex: Int?
    /**
     * Max amount of ammo unit can hold in their inventory
     */
    var maxInventoryAmmo: Int

    constructor(name: String, roundsPerSecond: Double, spread: Double, aimTime: Double, aimFieldOfView: Double, aimRotationSpeed: Double, aimMovementSpeedModifier: Double, projectileSpeed: Double, projectileDamage: Double, projectileLifeTime: Double, shotSoundTypeIndex: Int?, projectileHitSoundTypeIndex: Int?, maxInventoryAmmo: Int) {
        this.name = name
        this.roundsPerSecond = roundsPerSecond
        this.spread = spread
        this.aimTime = aimTime
        this.aimFieldOfView = aimFieldOfView
        this.aimRotationSpeed = aimRotationSpeed
        this.aimMovementSpeedModifier = aimMovementSpeedModifier
        this.projectileSpeed = projectileSpeed
        this.projectileDamage = projectileDamage
        this.projectileLifeTime = projectileLifeTime
        this.shotSoundTypeIndex = shotSoundTypeIndex
        this.projectileHitSoundTypeIndex = projectileHitSoundTypeIndex
        this.maxInventoryAmmo = maxInventoryAmmo
    }

    /**
     * Write WeaponProperties to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeString(stream, name)
        StreamUtil.writeDouble(stream, roundsPerSecond)
        StreamUtil.writeDouble(stream, spread)
        StreamUtil.writeDouble(stream, aimTime)
        StreamUtil.writeDouble(stream, aimFieldOfView)
        StreamUtil.writeDouble(stream, aimRotationSpeed)
        StreamUtil.writeDouble(stream, aimMovementSpeedModifier)
        StreamUtil.writeDouble(stream, projectileSpeed)
        StreamUtil.writeDouble(stream, projectileDamage)
        StreamUtil.writeDouble(stream, projectileLifeTime)
        val shotSoundTypeIndexValue = shotSoundTypeIndex
        if (shotSoundTypeIndexValue == null) {
            StreamUtil.writeBoolean(stream, false)
        } else {
            StreamUtil.writeBoolean(stream, true)
            StreamUtil.writeInt(stream, shotSoundTypeIndexValue)
        }
        val projectileHitSoundTypeIndexValue = projectileHitSoundTypeIndex
        if (projectileHitSoundTypeIndexValue == null) {
            StreamUtil.writeBoolean(stream, false)
        } else {
            StreamUtil.writeBoolean(stream, true)
            StreamUtil.writeInt(stream, projectileHitSoundTypeIndexValue)
        }
        StreamUtil.writeInt(stream, maxInventoryAmmo)
    }

    /**
     * Get string representation of WeaponProperties
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("WeaponProperties { ")
        stringBuilder.append("name: ")
        stringBuilder.append('"' + name + '"')
        stringBuilder.append(", ")
        stringBuilder.append("roundsPerSecond: ")
        stringBuilder.append(roundsPerSecond)
        stringBuilder.append(", ")
        stringBuilder.append("spread: ")
        stringBuilder.append(spread)
        stringBuilder.append(", ")
        stringBuilder.append("aimTime: ")
        stringBuilder.append(aimTime)
        stringBuilder.append(", ")
        stringBuilder.append("aimFieldOfView: ")
        stringBuilder.append(aimFieldOfView)
        stringBuilder.append(", ")
        stringBuilder.append("aimRotationSpeed: ")
        stringBuilder.append(aimRotationSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("aimMovementSpeedModifier: ")
        stringBuilder.append(aimMovementSpeedModifier)
        stringBuilder.append(", ")
        stringBuilder.append("projectileSpeed: ")
        stringBuilder.append(projectileSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("projectileDamage: ")
        stringBuilder.append(projectileDamage)
        stringBuilder.append(", ")
        stringBuilder.append("projectileLifeTime: ")
        stringBuilder.append(projectileLifeTime)
        stringBuilder.append(", ")
        stringBuilder.append("shotSoundTypeIndex: ")
        stringBuilder.append(shotSoundTypeIndex)
        stringBuilder.append(", ")
        stringBuilder.append("projectileHitSoundTypeIndex: ")
        stringBuilder.append(projectileHitSoundTypeIndex)
        stringBuilder.append(", ")
        stringBuilder.append("maxInventoryAmmo: ")
        stringBuilder.append(maxInventoryAmmo)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read WeaponProperties from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): WeaponProperties {
            var name: String
            name = StreamUtil.readString(stream)
            var roundsPerSecond: Double
            roundsPerSecond = StreamUtil.readDouble(stream)
            var spread: Double
            spread = StreamUtil.readDouble(stream)
            var aimTime: Double
            aimTime = StreamUtil.readDouble(stream)
            var aimFieldOfView: Double
            aimFieldOfView = StreamUtil.readDouble(stream)
            var aimRotationSpeed: Double
            aimRotationSpeed = StreamUtil.readDouble(stream)
            var aimMovementSpeedModifier: Double
            aimMovementSpeedModifier = StreamUtil.readDouble(stream)
            var projectileSpeed: Double
            projectileSpeed = StreamUtil.readDouble(stream)
            var projectileDamage: Double
            projectileDamage = StreamUtil.readDouble(stream)
            var projectileLifeTime: Double
            projectileLifeTime = StreamUtil.readDouble(stream)
            var shotSoundTypeIndex: Int?
            if (StreamUtil.readBoolean(stream)) {
                shotSoundTypeIndex = StreamUtil.readInt(stream)
            } else {
                shotSoundTypeIndex = null
            }
            var projectileHitSoundTypeIndex: Int?
            if (StreamUtil.readBoolean(stream)) {
                projectileHitSoundTypeIndex = StreamUtil.readInt(stream)
            } else {
                projectileHitSoundTypeIndex = null
            }
            var maxInventoryAmmo: Int
            maxInventoryAmmo = StreamUtil.readInt(stream)
            return WeaponProperties(name, roundsPerSecond, spread, aimTime, aimFieldOfView, aimRotationSpeed, aimMovementSpeedModifier, projectileSpeed, projectileDamage, projectileLifeTime, shotSoundTypeIndex, projectileHitSoundTypeIndex, maxInventoryAmmo)
        }
    }
}