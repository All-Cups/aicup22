#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Current state of the game zone
type Zone = {
    /// Current center
    CurrentCenter: Model.Vec2;
    /// Current radius
    CurrentRadius: double;
    /// Next center
    NextCenter: Model.Vec2;
    /// Next radius
    NextRadius: double;
} with

    /// Write Zone to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        this.CurrentCenter.writeTo writer
        writer.Write this.CurrentRadius
        this.NextCenter.writeTo writer
        writer.Write this.NextRadius
        ()

    /// Read Zone from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        CurrentCenter = Model.Vec2.readFrom reader;
        CurrentRadius = reader.ReadDouble()
        NextCenter = Model.Vec2.readFrom reader;
        NextRadius = reader.ReadDouble()
    }