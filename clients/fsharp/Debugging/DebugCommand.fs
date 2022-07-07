#nowarn "0058"

namespace AiCup22
namespace AiCup22.Debugging

open AiCup22

/// Add debug data to current tick
type DebugCommandAdd = {
    /// Data to add
    DebugData: Debugging.DebugData;
} with

    /// Write Add to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 0
        this.DebugData.writeTo writer
        ()

    /// Read Add from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        DebugData = Debugging.DebugData.readFrom reader;
    }

/// Clear current tick's debug data
type DebugCommandClear = struct end with

    /// Write Clear to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 1
        ()

    /// Read Clear from reader
    static member readFrom(reader: System.IO.BinaryReader) = new DebugCommandClear()

/// Enable/disable auto performing of commands
type DebugCommandSetAutoFlush = {
    /// Enable/disable autoflush
    Enable: bool;
} with

    /// Write SetAutoFlush to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 2
        writer.Write this.Enable
        ()

    /// Read SetAutoFlush from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Enable = reader.ReadBoolean()
    }

/// Perform all previously sent commands
type DebugCommandFlush = struct end with

    /// Write Flush to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 3
        ()

    /// Read Flush from reader
    static member readFrom(reader: System.IO.BinaryReader) = new DebugCommandFlush()

/// Debug commands that can be sent while debugging with the app
type DebugCommand =
    /// Add debug data to current tick
    | Add of DebugCommandAdd
    /// Clear current tick's debug data
    | Clear of DebugCommandClear
    /// Enable/disable auto performing of commands
    | SetAutoFlush of DebugCommandSetAutoFlush
    /// Perform all previously sent commands
    | Flush of DebugCommandFlush
    with

    /// Write DebugCommand to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        match this with
            | Add value -> value.writeTo writer
            | Clear value -> value.writeTo writer
            | SetAutoFlush value -> value.writeTo writer
            | Flush value -> value.writeTo writer

    /// Read DebugCommand from reader
    static member readFrom(reader: System.IO.BinaryReader) =
        match reader.ReadInt32() with
            | 0 -> Add (DebugCommandAdd.readFrom reader)
            | 1 -> Clear (DebugCommandClear.readFrom reader)
            | 2 -> SetAutoFlush (DebugCommandSetAutoFlush.readFrom reader)
            | 3 -> Flush (DebugCommandFlush.readFrom reader)
            | x -> failwith (sprintf "Unexpected tag %d" x)