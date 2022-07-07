#nowarn "0058"

namespace AiCup22
namespace AiCup22.Debugging

open AiCup22

/// Camera state
type Camera = {
    /// Center
    Center: Model.Vec2;
    /// Rotation
    Rotation: double;
    /// Attack angle
    Attack: double;
    /// Vertical field of view
    Fov: double;
} with

    /// Write Camera to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        this.Center.writeTo writer
        writer.Write this.Rotation
        writer.Write this.Attack
        writer.Write this.Fov
        ()

    /// Read Camera from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Center = Model.Vec2.readFrom reader;
        Rotation = reader.ReadDouble()
        Attack = reader.ReadDouble()
        Fov = reader.ReadDouble()
    }