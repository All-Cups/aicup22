#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Action unit is currently performing
type Action = {
    /// Tick when the action will be finished
    FinishTick: int;
    /// Type of the action
    ActionType: Model.ActionType;
} with

    /// Write Action to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.FinishTick
        writer.Write (int this.ActionType)
        ()

    /// Read Action from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        FinishTick = reader.ReadInt32()
        ActionType = reader.ReadInt32() |> enum
    }