#nowarn "0058"

namespace AiCup22
namespace AiCup22.Debugging

open AiCup22

/// Renderer's state
type DebugState = {
    /// Pressed keys
    PressedKeys: string[];
    /// Cursor's position in game coordinates
    CursorWorldPosition: Model.Vec2;
    /// Id of unit which is followed by the camera, or None
    LockedUnit: option<int>;
    /// Current camera state
    Camera: Debugging.Camera;
} with

    /// Write DebugState to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.PressedKeys.Length
        this.PressedKeys |> Array.iter (fun value ->
            let valueData : byte[] = System.Text.Encoding.UTF8.GetBytes value
            writer.Write valueData.Length
            writer.Write valueData )
        this.CursorWorldPosition.writeTo writer
        match this.LockedUnit with
            | Some value ->
                writer.Write true
                writer.Write value
            | None -> writer.Write false
        this.Camera.writeTo writer
        ()

    /// Read DebugState from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        PressedKeys = [|for _ in 1 .. reader.ReadInt32() do
                          yield reader.ReadInt32() |> reader.ReadBytes |> System.Text.Encoding.UTF8.GetString |]
        CursorWorldPosition = Model.Vec2.readFrom reader;
        LockedUnit = match reader.ReadBoolean() with
                         | true -> Some(reader.ReadInt32())
                         | false -> None
        Camera = Debugging.Camera.readFrom reader;
    }