#nowarn "0058"

namespace AiCup22
namespace AiCup22.Debugging

open AiCup22

/// Point + color
type ColoredVertex = {
    /// Position
    Position: Model.Vec2;
    /// Color
    Color: Debugging.Color;
} with

    /// Write ColoredVertex to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        this.Position.writeTo writer
        this.Color.writeTo writer
        ()

    /// Read ColoredVertex from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Position = Model.Vec2.readFrom reader;
        Color = Debugging.Color.readFrom reader;
    }