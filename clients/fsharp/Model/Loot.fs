#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Loot lying on the ground
type Loot = {
    /// Unique id
    Id: int;
    /// Position
    Position: Model.Vec2;
    /// Item
    Item: Model.Item;
} with

    /// Write Loot to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.Id
        this.Position.writeTo writer
        this.Item.writeTo writer
        ()

    /// Read Loot from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Id = reader.ReadInt32()
        Position = Model.Vec2.readFrom reader;
        Item = Model.Item.readFrom reader;
    }