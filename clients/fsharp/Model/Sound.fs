#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Sound heard by one of your units
type Sound = {
    /// Sound type index (starting with 0)
    TypeIndex: int;
    /// Id of unit that heard this sound
    UnitId: int;
    /// Position where sound was heard (different from sound source position)
    Position: Model.Vec2;
} with

    /// Write Sound to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.TypeIndex
        writer.Write this.UnitId
        this.Position.writeTo writer
        ()

    /// Read Sound from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        TypeIndex = reader.ReadInt32()
        UnitId = reader.ReadInt32()
        Position = Model.Vec2.readFrom reader;
    }