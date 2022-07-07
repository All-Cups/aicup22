#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// A unit
type Unit = {
    /// Unique id
    Id: int;
    /// Id of the player (team) controlling the unit
    PlayerId: int;
    /// Current health
    Health: double;
    /// Current shield value
    Shield: double;
    /// Left extra lives of this unit
    ExtraLives: int;
    /// Current position of unit's center
    Position: Model.Vec2;
    /// Remaining time until unit will be spawned, or None
    RemainingSpawnTime: option<double>;
    /// Current velocity
    Velocity: Model.Vec2;
    /// Current view direction (vector of length 1)
    Direction: Model.Vec2;
    /// Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
    Aim: double;
    /// Current action unit is performing, or None
    Action: option<Model.Action>;
    /// Tick when health regeneration will start (can be less than current game tick)
    HealthRegenerationStartTick: int;
    /// Index of the weapon this unit is holding (starting with 0), or None
    Weapon: option<int>;
    /// Next tick when unit can shoot again (can be less than current game tick)
    NextShotTick: int;
    /// List of ammo in unit's inventory for every weapon type
    Ammo: int[];
    /// Number of shield potions in inventory
    ShieldPotions: int;
} with

    /// Write Unit to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.Id
        writer.Write this.PlayerId
        writer.Write this.Health
        writer.Write this.Shield
        writer.Write this.ExtraLives
        this.Position.writeTo writer
        match this.RemainingSpawnTime with
            | Some value ->
                writer.Write true
                writer.Write value
            | None -> writer.Write false
        this.Velocity.writeTo writer
        this.Direction.writeTo writer
        writer.Write this.Aim
        match this.Action with
            | Some value ->
                writer.Write true
                value.writeTo writer
            | None -> writer.Write false
        writer.Write this.HealthRegenerationStartTick
        match this.Weapon with
            | Some value ->
                writer.Write true
                writer.Write value
            | None -> writer.Write false
        writer.Write this.NextShotTick
        writer.Write this.Ammo.Length
        this.Ammo |> Array.iter (fun value ->
            writer.Write value )
        writer.Write this.ShieldPotions
        ()

    /// Read Unit from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Id = reader.ReadInt32()
        PlayerId = reader.ReadInt32()
        Health = reader.ReadDouble()
        Shield = reader.ReadDouble()
        ExtraLives = reader.ReadInt32()
        Position = Model.Vec2.readFrom reader;
        RemainingSpawnTime = match reader.ReadBoolean() with
                                 | true -> Some(reader.ReadDouble())
                                 | false -> None
        Velocity = Model.Vec2.readFrom reader;
        Direction = Model.Vec2.readFrom reader;
        Aim = reader.ReadDouble()
        Action = match reader.ReadBoolean() with
                     | true -> Some(Model.Action.readFrom reader;)
                     | false -> None
        HealthRegenerationStartTick = reader.ReadInt32()
        Weapon = match reader.ReadBoolean() with
                     | true -> Some(reader.ReadInt32())
                     | false -> None
        NextShotTick = reader.ReadInt32()
        Ammo = [|for _ in 1 .. reader.ReadInt32() do
                   yield reader.ReadInt32() |]
        ShieldPotions = reader.ReadInt32()
    }