#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Order for specific unit
type UnitOrder = {
    /// Target moving velocity
    TargetVelocity: Model.Vec2;
    /// Target view direction (vector length doesn't matter)
    TargetDirection: Model.Vec2;
    /// Order to perform an action, or None
    Action: option<Model.ActionOrder>;
} with

    /// Write UnitOrder to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        this.TargetVelocity.writeTo writer
        this.TargetDirection.writeTo writer
        match this.Action with
            | Some value ->
                writer.Write true
                value.writeTo writer
            | None -> writer.Write false
        ()

    /// Read UnitOrder from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        TargetVelocity = Model.Vec2.readFrom reader;
        TargetDirection = Model.Vec2.readFrom reader;
        Action = match reader.ReadBoolean() with
                     | true -> Some(Model.ActionOrder.readFrom reader;)
                     | false -> None
    }