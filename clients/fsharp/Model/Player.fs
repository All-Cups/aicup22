#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Game's participant (team of units)
type Player = {
    /// Unique id
    Id: int;
    /// Number of kills
    Kills: int;
    /// Total damage dealt to enemies
    Damage: double;
    /// Survival place (number of survivor teams currently/at the moment of death)
    Place: int;
    /// Team score
    Score: double;
} with

    /// Write Player to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.Id
        writer.Write this.Kills
        writer.Write this.Damage
        writer.Write this.Place
        writer.Write this.Score
        ()

    /// Read Player from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Id = reader.ReadInt32()
        Kills = reader.ReadInt32()
        Damage = reader.ReadDouble()
        Place = reader.ReadInt32()
        Score = reader.ReadDouble()
    }