/// Weapon properties
public struct WeaponProperties {
    /// Name
    let name: String

    /// Shooting speed (number of shots per second)
    let roundsPerSecond: Double

    /// Accuracy (spread angle) of a shot (in degrees)
    let spread: Double

    /// Aiming time
    let aimTime: Double

    /// Field of view in full aim (in degrees)
    let aimFieldOfView: Double

    /// Rotation speed in full aim (degrees per second)
    let aimRotationSpeed: Double

    /// Movement speed modifier in full aim
    let aimMovementSpeedModifier: Double

    /// Speed of projectiles
    let projectileSpeed: Double

    /// Damage of a projectile
    let projectileDamage: Double

    /// Projectiles' life time
    let projectileLifeTime: Double

    /// Index of the sound when shooting (starting with 0), or None
    let shotSoundTypeIndex: Int32?

    /// Index of the sound when hitting something (starting with 0), or None
    let projectileHitSoundTypeIndex: Int32?

    /// Max amount of ammo unit can hold in their inventory
    let maxInventoryAmmo: Int32

    /// Read WeaponProperties from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> WeaponProperties {
        var name: String
        name = stream.readString()
        var roundsPerSecond: Double
        roundsPerSecond = stream.readDouble()
        var spread: Double
        spread = stream.readDouble()
        var aimTime: Double
        aimTime = stream.readDouble()
        var aimFieldOfView: Double
        aimFieldOfView = stream.readDouble()
        var aimRotationSpeed: Double
        aimRotationSpeed = stream.readDouble()
        var aimMovementSpeedModifier: Double
        aimMovementSpeedModifier = stream.readDouble()
        var projectileSpeed: Double
        projectileSpeed = stream.readDouble()
        var projectileDamage: Double
        projectileDamage = stream.readDouble()
        var projectileLifeTime: Double
        projectileLifeTime = stream.readDouble()
        var shotSoundTypeIndex: Int32?
        if stream.readBool() {
            shotSoundTypeIndex = stream.readInt32()
        } else {
            shotSoundTypeIndex = nil
        }
        var projectileHitSoundTypeIndex: Int32?
        if stream.readBool() {
            projectileHitSoundTypeIndex = stream.readInt32()
        } else {
            projectileHitSoundTypeIndex = nil
        }
        var maxInventoryAmmo: Int32
        maxInventoryAmmo = stream.readInt32()
        return WeaponProperties(name: name, roundsPerSecond: roundsPerSecond, spread: spread, aimTime: aimTime, aimFieldOfView: aimFieldOfView, aimRotationSpeed: aimRotationSpeed, aimMovementSpeedModifier: aimMovementSpeedModifier, projectileSpeed: projectileSpeed, projectileDamage: projectileDamage, projectileLifeTime: projectileLifeTime, shotSoundTypeIndex: shotSoundTypeIndex, projectileHitSoundTypeIndex: projectileHitSoundTypeIndex, maxInventoryAmmo: maxInventoryAmmo)
    }

    /// Write WeaponProperties to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeString(name)
        stream.writeDouble(roundsPerSecond)
        stream.writeDouble(spread)
        stream.writeDouble(aimTime)
        stream.writeDouble(aimFieldOfView)
        stream.writeDouble(aimRotationSpeed)
        stream.writeDouble(aimMovementSpeedModifier)
        stream.writeDouble(projectileSpeed)
        stream.writeDouble(projectileDamage)
        stream.writeDouble(projectileLifeTime)
        if shotSoundTypeIndex == nil {
            stream.writeBool(false)
        } else {
            stream.writeBool(true)
            let shotSoundTypeIndexValue = shotSoundTypeIndex!
            stream.writeInt32(shotSoundTypeIndexValue)
        }
        if projectileHitSoundTypeIndex == nil {
            stream.writeBool(false)
        } else {
            stream.writeBool(true)
            let projectileHitSoundTypeIndexValue = projectileHitSoundTypeIndex!
            stream.writeInt32(projectileHitSoundTypeIndexValue)
        }
        stream.writeInt32(maxInventoryAmmo)
    }
}