#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Player's (team's) orders
type Order = {
    /// Orders for each of your units
    UnitOrders: Map<int, Model.UnitOrder>;
} with

    /// Write Order to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.UnitOrders.Count
        this.UnitOrders |> Map.iter (fun key value ->
            writer.Write key
            value.writeTo writer )
        ()

    /// Read Order from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        UnitOrders = [for _ in 1 .. reader.ReadInt32() do
                         let key = reader.ReadInt32()
                         let value = Model.UnitOrder.readFrom reader;
                         yield (key, value) ] |> Map.ofList
    }