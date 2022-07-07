#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Weapon projectile
type Projectile = {
    /// Unique id
    Id: int;
    /// Index of the weapon this projectile was shot from (starts with 0)
    WeaponTypeIndex: int;
    /// Id of unit who made the shot
    ShooterId: int;
    /// Id of player (team), whose unit made the shot
    ShooterPlayerId: int;
    /// Current position
    Position: Model.Vec2;
    /// Projectile's velocity
    Velocity: Model.Vec2;
    /// Left time of projectile's life
    LifeTime: double;
} with

    /// Write Projectile to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.Id
        writer.Write this.WeaponTypeIndex
        writer.Write this.ShooterId
        writer.Write this.ShooterPlayerId
        this.Position.writeTo writer
        this.Velocity.writeTo writer
        writer.Write this.LifeTime
        ()

    /// Read Projectile from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Id = reader.ReadInt32()
        WeaponTypeIndex = reader.ReadInt32()
        ShooterId = reader.ReadInt32()
        ShooterPlayerId = reader.ReadInt32()
        Position = Model.Vec2.readFrom reader;
        Velocity = Model.Vec2.readFrom reader;
        LifeTime = reader.ReadDouble()
    }