#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Current game's state
type Game = {
    /// Your player's id
    MyId: int;
    /// List of players (teams)
    Players: Model.Player[];
    /// Current tick
    CurrentTick: int;
    /// List of units visible by your team
    Units: Model.Unit[];
    /// List of loot visible by your team
    Loot: Model.Loot[];
    /// List of projectiles visible by your team
    Projectiles: Model.Projectile[];
    /// Current state of game zone
    Zone: Model.Zone;
    /// List of sounds heard by your team during last tick
    Sounds: Model.Sound[];
} with

    /// Write Game to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.MyId
        writer.Write this.Players.Length
        this.Players |> Array.iter (fun value ->
            value.writeTo writer )
        writer.Write this.CurrentTick
        writer.Write this.Units.Length
        this.Units |> Array.iter (fun value ->
            value.writeTo writer )
        writer.Write this.Loot.Length
        this.Loot |> Array.iter (fun value ->
            value.writeTo writer )
        writer.Write this.Projectiles.Length
        this.Projectiles |> Array.iter (fun value ->
            value.writeTo writer )
        this.Zone.writeTo writer
        writer.Write this.Sounds.Length
        this.Sounds |> Array.iter (fun value ->
            value.writeTo writer )
        ()

    /// Read Game from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        MyId = reader.ReadInt32()
        Players = [|for _ in 1 .. reader.ReadInt32() do
                      yield Model.Player.readFrom reader; |]
        CurrentTick = reader.ReadInt32()
        Units = [|for _ in 1 .. reader.ReadInt32() do
                    yield Model.Unit.readFrom reader; |]
        Loot = [|for _ in 1 .. reader.ReadInt32() do
                   yield Model.Loot.readFrom reader; |]
        Projectiles = [|for _ in 1 .. reader.ReadInt32() do
                          yield Model.Projectile.readFrom reader; |]
        Zone = Model.Zone.readFrom reader;
        Sounds = [|for _ in 1 .. reader.ReadInt32() do
                     yield Model.Sound.readFrom reader; |]
    }