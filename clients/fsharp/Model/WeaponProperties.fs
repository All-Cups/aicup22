#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Weapon properties
type WeaponProperties = {
    /// Name
    Name: string;
    /// Shooting speed (number of shots per second)
    RoundsPerSecond: double;
    /// Accuracy (spread angle) of a shot (in degrees)
    Spread: double;
    /// Aiming time
    AimTime: double;
    /// Field of view in full aim (in degrees)
    AimFieldOfView: double;
    /// Rotation speed in full aim (degrees per second)
    AimRotationSpeed: double;
    /// Movement speed modifier in full aim
    AimMovementSpeedModifier: double;
    /// Speed of projectiles
    ProjectileSpeed: double;
    /// Damage of a projectile
    ProjectileDamage: double;
    /// Projectiles' life time
    ProjectileLifeTime: double;
    /// Index of the sound when shooting (starting with 0), or None
    ShotSoundTypeIndex: option<int>;
    /// Index of the sound when hitting something (starting with 0), or None
    ProjectileHitSoundTypeIndex: option<int>;
    /// Max amount of ammo unit can hold in their inventory
    MaxInventoryAmmo: int;
} with

    /// Write WeaponProperties to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        let nameData : byte[] = System.Text.Encoding.UTF8.GetBytes this.Name
        writer.Write nameData.Length
        writer.Write nameData
        writer.Write this.RoundsPerSecond
        writer.Write this.Spread
        writer.Write this.AimTime
        writer.Write this.AimFieldOfView
        writer.Write this.AimRotationSpeed
        writer.Write this.AimMovementSpeedModifier
        writer.Write this.ProjectileSpeed
        writer.Write this.ProjectileDamage
        writer.Write this.ProjectileLifeTime
        match this.ShotSoundTypeIndex with
            | Some value ->
                writer.Write true
                writer.Write value
            | None -> writer.Write false
        match this.ProjectileHitSoundTypeIndex with
            | Some value ->
                writer.Write true
                writer.Write value
            | None -> writer.Write false
        writer.Write this.MaxInventoryAmmo
        ()

    /// Read WeaponProperties from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Name = reader.ReadInt32() |> reader.ReadBytes |> System.Text.Encoding.UTF8.GetString
        RoundsPerSecond = reader.ReadDouble()
        Spread = reader.ReadDouble()
        AimTime = reader.ReadDouble()
        AimFieldOfView = reader.ReadDouble()
        AimRotationSpeed = reader.ReadDouble()
        AimMovementSpeedModifier = reader.ReadDouble()
        ProjectileSpeed = reader.ReadDouble()
        ProjectileDamage = reader.ReadDouble()
        ProjectileLifeTime = reader.ReadDouble()
        ShotSoundTypeIndex = match reader.ReadBoolean() with
                                 | true -> Some(reader.ReadInt32())
                                 | false -> None
        ProjectileHitSoundTypeIndex = match reader.ReadBoolean() with
                                          | true -> Some(reader.ReadInt32())
                                          | false -> None
        MaxInventoryAmmo = reader.ReadInt32()
    }