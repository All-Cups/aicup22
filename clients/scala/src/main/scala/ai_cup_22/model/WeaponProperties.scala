package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Weapon properties
 *
 * @param name Name
 * @param roundsPerSecond Shooting speed (number of shots per second)
 * @param spread Accuracy (spread angle) of a shot (in degrees)
 * @param aimTime Aiming time
 * @param aimFieldOfView Field of view in full aim (in degrees)
 * @param aimRotationSpeed Rotation speed in full aim (degrees per second)
 * @param aimMovementSpeedModifier Movement speed modifier in full aim
 * @param projectileSpeed Speed of projectiles
 * @param projectileDamage Damage of a projectile
 * @param projectileLifeTime Projectiles' life time
 * @param shotSoundTypeIndex Index of the sound when shooting (starting with 0), or None
 * @param projectileHitSoundTypeIndex Index of the sound when hitting something (starting with 0), or None
 * @param maxInventoryAmmo Max amount of ammo unit can hold in their inventory
 */
case class WeaponProperties(name: String, roundsPerSecond: Double, spread: Double, aimTime: Double, aimFieldOfView: Double, aimRotationSpeed: Double, aimMovementSpeedModifier: Double, projectileSpeed: Double, projectileDamage: Double, projectileLifeTime: Double, shotSoundTypeIndex: Option[Int], projectileHitSoundTypeIndex: Option[Int], maxInventoryAmmo: Int) {
    /**
     * Write WeaponProperties to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
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
        shotSoundTypeIndex match {
            case None => StreamUtil.writeBoolean(stream, false)
            case Some(value) => {
                StreamUtil.writeBoolean(stream, true)
                StreamUtil.writeInt(stream, value)
            }
        }
        projectileHitSoundTypeIndex match {
            case None => StreamUtil.writeBoolean(stream, false)
            case Some(value) => {
                StreamUtil.writeBoolean(stream, true)
                StreamUtil.writeInt(stream, value)
            }
        }
        StreamUtil.writeInt(stream, maxInventoryAmmo)
    }

    /**
     * Get string representation of WeaponProperties
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("WeaponProperties { ")
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
        stringBuilder.toString()
    }
}

object WeaponProperties {
    /**
     * Read WeaponProperties from input stream
     */
    def readFrom(stream: java.io.InputStream): WeaponProperties = WeaponProperties(
        StreamUtil.readString(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        if (StreamUtil.readBoolean(stream)) Some(
            StreamUtil.readInt(stream)
        ) else None,
        if (StreamUtil.readBoolean(stream)) Some(
            StreamUtil.readInt(stream)
        ) else None,
        StreamUtil.readInt(stream)
    )
}