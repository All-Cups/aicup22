#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Non changing game state
type Constants = {
    /// Number of ticks per game second
    TicksPerSecond: double;
    /// Starting number of units in each team
    TeamSize: int;
    /// Initial zone radius
    InitialZoneRadius: double;
    /// Speed of zone radius
    ZoneSpeed: double;
    /// Damage dealt to units outside of the zone per second
    ZoneDamagePerSecond: double;
    /// Unit spawning time
    SpawnTime: double;
    /// Damage dealt to units trying to spawn in incorrect position per second
    SpawnCollisionDamagePerSecond: double;
    /// Time required to perform looting actions (in seconds)
    LootingTime: double;
    /// Number of bot players (teams)
    BotPlayers: int;
    /// Units' radius
    UnitRadius: double;
    /// Max units' health
    UnitHealth: double;
    /// Health automatically restored per second
    HealthRegenerationPerSecond: double;
    /// Time until automatic health regeneration since last health damage (in seconds)
    HealthRegenerationDelay: double;
    /// Max value of unit's shield
    MaxShield: double;
    /// Initial value of unit's shield
    SpawnShield: double;
    /// Initial number of extra lives for units
    ExtraLives: int;
    /// Zone radius after which respawning is disabled
    LastRespawnZoneRadius: double;
    /// Units' field of view without aiming (in degrees)
    FieldOfView: double;
    /// Units' view distance
    ViewDistance: double;
    /// Whether units' view is blocked by obstacles
    ViewBlocking: bool;
    /// Unit rotation speed without aiming (degrees per second)
    RotationSpeed: double;
    /// Units' movement speed while spawning
    SpawnMovementSpeed: double;
    /// Max unit speed when walking forward
    MaxUnitForwardSpeed: double;
    /// Max unit speed when walking backward
    MaxUnitBackwardSpeed: double;
    /// Max unit acceleration
    UnitAcceleration: double;
    /// Whether a unit can damage units of the same team
    FriendlyFire: bool;
    /// Score given for killing enemy unit
    KillScore: double;
    /// Score multiplier for damaging enemy units
    DamageScoreMultiplier: double;
    /// Score given for every team killed before you
    ScorePerPlace: double;
    /// List of properties of every weapon type
    Weapons: Model.WeaponProperties[];
    /// Starting weapon with which units spawn, or None
    StartingWeapon: option<int>;
    /// Ammo for starting weapon given when unit spawns
    StartingWeaponAmmo: int;
    /// Max number of shield potions in unit's inventory
    MaxShieldPotionsInInventory: int;
    /// Amount of shield restored using one potion
    ShieldPerPotion: double;
    /// Time required to perform action of using shield potion
    ShieldPotionUseTime: double;
    /// List of properties of every sound type
    Sounds: Model.SoundProperties[];
    /// Sound type index when moving (starting with 0), or None
    StepsSoundTypeIndex: option<int>;
    /// Distance when steps sound will be 100% probability
    StepsSoundTravelDistance: double;
    /// List of obstacles on the map
    Obstacles: Model.Obstacle[];
} with

    /// Write Constants to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.TicksPerSecond
        writer.Write this.TeamSize
        writer.Write this.InitialZoneRadius
        writer.Write this.ZoneSpeed
        writer.Write this.ZoneDamagePerSecond
        writer.Write this.SpawnTime
        writer.Write this.SpawnCollisionDamagePerSecond
        writer.Write this.LootingTime
        writer.Write this.BotPlayers
        writer.Write this.UnitRadius
        writer.Write this.UnitHealth
        writer.Write this.HealthRegenerationPerSecond
        writer.Write this.HealthRegenerationDelay
        writer.Write this.MaxShield
        writer.Write this.SpawnShield
        writer.Write this.ExtraLives
        writer.Write this.LastRespawnZoneRadius
        writer.Write this.FieldOfView
        writer.Write this.ViewDistance
        writer.Write this.ViewBlocking
        writer.Write this.RotationSpeed
        writer.Write this.SpawnMovementSpeed
        writer.Write this.MaxUnitForwardSpeed
        writer.Write this.MaxUnitBackwardSpeed
        writer.Write this.UnitAcceleration
        writer.Write this.FriendlyFire
        writer.Write this.KillScore
        writer.Write this.DamageScoreMultiplier
        writer.Write this.ScorePerPlace
        writer.Write this.Weapons.Length
        this.Weapons |> Array.iter (fun value ->
            value.writeTo writer )
        match this.StartingWeapon with
            | Some value ->
                writer.Write true
                writer.Write value
            | None -> writer.Write false
        writer.Write this.StartingWeaponAmmo
        writer.Write this.MaxShieldPotionsInInventory
        writer.Write this.ShieldPerPotion
        writer.Write this.ShieldPotionUseTime
        writer.Write this.Sounds.Length
        this.Sounds |> Array.iter (fun value ->
            value.writeTo writer )
        match this.StepsSoundTypeIndex with
            | Some value ->
                writer.Write true
                writer.Write value
            | None -> writer.Write false
        writer.Write this.StepsSoundTravelDistance
        writer.Write this.Obstacles.Length
        this.Obstacles |> Array.iter (fun value ->
            value.writeTo writer )
        ()

    /// Read Constants from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        TicksPerSecond = reader.ReadDouble()
        TeamSize = reader.ReadInt32()
        InitialZoneRadius = reader.ReadDouble()
        ZoneSpeed = reader.ReadDouble()
        ZoneDamagePerSecond = reader.ReadDouble()
        SpawnTime = reader.ReadDouble()
        SpawnCollisionDamagePerSecond = reader.ReadDouble()
        LootingTime = reader.ReadDouble()
        BotPlayers = reader.ReadInt32()
        UnitRadius = reader.ReadDouble()
        UnitHealth = reader.ReadDouble()
        HealthRegenerationPerSecond = reader.ReadDouble()
        HealthRegenerationDelay = reader.ReadDouble()
        MaxShield = reader.ReadDouble()
        SpawnShield = reader.ReadDouble()
        ExtraLives = reader.ReadInt32()
        LastRespawnZoneRadius = reader.ReadDouble()
        FieldOfView = reader.ReadDouble()
        ViewDistance = reader.ReadDouble()
        ViewBlocking = reader.ReadBoolean()
        RotationSpeed = reader.ReadDouble()
        SpawnMovementSpeed = reader.ReadDouble()
        MaxUnitForwardSpeed = reader.ReadDouble()
        MaxUnitBackwardSpeed = reader.ReadDouble()
        UnitAcceleration = reader.ReadDouble()
        FriendlyFire = reader.ReadBoolean()
        KillScore = reader.ReadDouble()
        DamageScoreMultiplier = reader.ReadDouble()
        ScorePerPlace = reader.ReadDouble()
        Weapons = [|for _ in 1 .. reader.ReadInt32() do
                      yield Model.WeaponProperties.readFrom reader; |]
        StartingWeapon = match reader.ReadBoolean() with
                             | true -> Some(reader.ReadInt32())
                             | false -> None
        StartingWeaponAmmo = reader.ReadInt32()
        MaxShieldPotionsInInventory = reader.ReadInt32()
        ShieldPerPotion = reader.ReadDouble()
        ShieldPotionUseTime = reader.ReadDouble()
        Sounds = [|for _ in 1 .. reader.ReadInt32() do
                     yield Model.SoundProperties.readFrom reader; |]
        StepsSoundTypeIndex = match reader.ReadBoolean() with
                                  | true -> Some(reader.ReadInt32())
                                  | false -> None
        StepsSoundTravelDistance = reader.ReadDouble()
        Obstacles = [|for _ in 1 .. reader.ReadInt32() do
                        yield Model.Obstacle.readFrom reader; |]
    }