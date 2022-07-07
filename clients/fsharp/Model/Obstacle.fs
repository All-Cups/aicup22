#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// An obstacle on the map
type Obstacle = {
    /// Unique id
    Id: int;
    /// Center position
    Position: Model.Vec2;
    /// Obstacle's radius
    Radius: double;
    /// Whether units can see through this obstacle, or it blocks the view
    CanSeeThrough: bool;
    /// Whether projectiles can go through this obstacle
    CanShootThrough: bool;
} with

    /// Write Obstacle to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.Id
        this.Position.writeTo writer
        writer.Write this.Radius
        writer.Write this.CanSeeThrough
        writer.Write this.CanShootThrough
        ()

    /// Read Obstacle from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Id = reader.ReadInt32()
        Position = Model.Vec2.readFrom reader;
        Radius = reader.ReadDouble()
        CanSeeThrough = reader.ReadBoolean()
        CanShootThrough = reader.ReadBoolean()
    }