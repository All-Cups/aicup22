#nowarn "0058"

namespace AiCup22
namespace AiCup22.Codegame

open AiCup22

/// Ask app to perform new debug command
type ClientMessageDebugMessage = {
    /// Command to perform
    Command: Debugging.DebugCommand;
} with

    /// Write DebugMessage to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 0
        this.Command.writeTo writer
        ()

    /// Read DebugMessage from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Command = Debugging.DebugCommand.readFrom reader;
    }

/// Reply for ServerMessage::GetOrder
type ClientMessageOrderMessage = {
    /// Player's order
    Order: Model.Order;
} with

    /// Write OrderMessage to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 1
        this.Order.writeTo writer
        ()

    /// Read OrderMessage from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Order = Model.Order.readFrom reader;
    }

/// Signifies finish of the debug update
type ClientMessageDebugUpdateDone = struct end with

    /// Write DebugUpdateDone to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 2
        ()

    /// Read DebugUpdateDone from reader
    static member readFrom(reader: System.IO.BinaryReader) = new ClientMessageDebugUpdateDone()

/// Request debug state from the app
type ClientMessageRequestDebugState = struct end with

    /// Write RequestDebugState to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 3
        ()

    /// Read RequestDebugState from reader
    static member readFrom(reader: System.IO.BinaryReader) = new ClientMessageRequestDebugState()

/// Message sent from client
type ClientMessage =
    /// Ask app to perform new debug command
    | DebugMessage of ClientMessageDebugMessage
    /// Reply for ServerMessage::GetOrder
    | OrderMessage of ClientMessageOrderMessage
    /// Signifies finish of the debug update
    | DebugUpdateDone of ClientMessageDebugUpdateDone
    /// Request debug state from the app
    | RequestDebugState of ClientMessageRequestDebugState
    with

    /// Write ClientMessage to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        match this with
            | DebugMessage value -> value.writeTo writer
            | OrderMessage value -> value.writeTo writer
            | DebugUpdateDone value -> value.writeTo writer
            | RequestDebugState value -> value.writeTo writer

    /// Read ClientMessage from reader
    static member readFrom(reader: System.IO.BinaryReader) =
        match reader.ReadInt32() with
            | 0 -> DebugMessage (ClientMessageDebugMessage.readFrom reader)
            | 1 -> OrderMessage (ClientMessageOrderMessage.readFrom reader)
            | 2 -> DebugUpdateDone (ClientMessageDebugUpdateDone.readFrom reader)
            | 3 -> RequestDebugState (ClientMessageRequestDebugState.readFrom reader)
            | x -> failwith (sprintf "Unexpected tag %d" x)