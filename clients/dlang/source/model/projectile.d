module model.projectile;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.vec2;

/// Weapon projectile
struct Projectile {
    /// Unique id
    int id;
    /// Index of the weapon this projectile was shot from (starts with 0)
    int weaponTypeIndex;
    /// Id of unit who made the shot
    int shooterId;
    /// Id of player (team), whose unit made the shot
    int shooterPlayerId;
    /// Current position
    model.Vec2 position;
    /// Projectile's velocity
    model.Vec2 velocity;
    /// Left time of projectile's life
    double lifeTime;

    this(int id, int weaponTypeIndex, int shooterId, int shooterPlayerId, model.Vec2 position, model.Vec2 velocity, double lifeTime) {
        this.id = id;
        this.weaponTypeIndex = weaponTypeIndex;
        this.shooterId = shooterId;
        this.shooterPlayerId = shooterPlayerId;
        this.position = position;
        this.velocity = velocity;
        this.lifeTime = lifeTime;
    }

    /// Read Projectile from reader
    static Projectile readFrom(Stream reader) {
        int id;
        id = reader.readInt();
        int weaponTypeIndex;
        weaponTypeIndex = reader.readInt();
        int shooterId;
        shooterId = reader.readInt();
        int shooterPlayerId;
        shooterPlayerId = reader.readInt();
        model.Vec2 position;
        position = model.Vec2.readFrom(reader);
        model.Vec2 velocity;
        velocity = model.Vec2.readFrom(reader);
        double lifeTime;
        lifeTime = reader.readDouble();
        return Projectile(id, weaponTypeIndex, shooterId, shooterPlayerId, position, velocity, lifeTime);
    }

    /// Write Projectile to writer
    void writeTo(Stream writer) const {
        writer.write(id);
        writer.write(weaponTypeIndex);
        writer.write(shooterId);
        writer.write(shooterPlayerId);
        position.writeTo(writer);
        velocity.writeTo(writer);
        writer.write(lifeTime);
    }
}