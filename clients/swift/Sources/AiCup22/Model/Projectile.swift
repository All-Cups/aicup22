/// Weapon projectile
public struct Projectile {
    /// Unique id
    let id: Int32

    /// Index of the weapon this projectile was shot from (starts with 0)
    let weaponTypeIndex: Int32

    /// Id of unit who made the shot
    let shooterId: Int32

    /// Id of player (team), whose unit made the shot
    let shooterPlayerId: Int32

    /// Current position
    let position: Vec2

    /// Projectile's velocity
    let velocity: Vec2

    /// Left time of projectile's life
    let lifeTime: Double

    /// Read Projectile from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Projectile {
        var id: Int32
        id = stream.readInt32()
        var weaponTypeIndex: Int32
        weaponTypeIndex = stream.readInt32()
        var shooterId: Int32
        shooterId = stream.readInt32()
        var shooterPlayerId: Int32
        shooterPlayerId = stream.readInt32()
        var position: Vec2
        position = Vec2.readFrom(stream)
        var velocity: Vec2
        velocity = Vec2.readFrom(stream)
        var lifeTime: Double
        lifeTime = stream.readDouble()
        return Projectile(id: id, weaponTypeIndex: weaponTypeIndex, shooterId: shooterId, shooterPlayerId: shooterPlayerId, position: position, velocity: velocity, lifeTime: lifeTime)
    }

    /// Write Projectile to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeInt32(id)
        stream.writeInt32(weaponTypeIndex)
        stream.writeInt32(shooterId)
        stream.writeInt32(shooterPlayerId)
        position.writeTo(stream)
        velocity.writeTo(stream)
        stream.writeDouble(lifeTime)
    }
}
