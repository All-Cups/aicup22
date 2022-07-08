#nowarn "0058"

namespace AiCup22
namespace AiCup22.Codegame

open AiCup22

/// Update constants
type ServerMessageUpdateConstants = {
    /// New constants
    Constants: Model.Constants;
} with

    /// Write UpdateConstants to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 0
        this.Constants.writeTo writer
        ()

    /// Read UpdateConstants from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Constants = Model.Constants.readFrom reader;
    }

/// Get order for next tick
type ServerMessageGetOrder = {
    /// Player's view
    PlayerView: Model.Game;
    /// Whether app is running with debug interface available
    DebugAvailable: bool;
} with

    /// Write GetOrder to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 1
        this.PlayerView.writeTo writer
        writer.Write this.DebugAvailable
        ()

    /// Read GetOrder from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        PlayerView = Model.Game.readFrom reader;
        DebugAvailable = reader.ReadBoolean()
    }

/// Signifies end of the game
type ServerMessageFinish = struct end with

    /// Write Finish to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 2
        ()

    /// Read Finish from reader
    static member readFrom(reader: System.IO.BinaryReader) = new ServerMessageFinish()

/// Debug update
type ServerMessageDebugUpdate = {
    /// Displayed tick
    DisplayedTick: int;
} with

    /// Write DebugUpdate to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 3
        writer.Write this.DisplayedTick
        ()

    /// Read DebugUpdate from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        DisplayedTick = reader.ReadInt32()
    }

/// Message sent from server
type ServerMessage =
    /// Update constants
    | UpdateConstants of ServerMessageUpdateConstants
    /// Get order for next tick
    | GetOrder of ServerMessageGetOrder
    /// Signifies end of the game
    | Finish of ServerMessageFinish
    /// Debug update
    | DebugUpdate of ServerMessageDebugUpdate
    with

    /// Write ServerMessage to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        match this with
            | UpdateConstants value -> value.writeTo writer
            | GetOrder value -> value.writeTo writer
            | Finish value -> value.writeTo writer
            | DebugUpdate value -> value.writeTo writer

    /// Read ServerMessage from reader
    static member readFrom(reader: System.IO.BinaryReader) =
        match reader.ReadInt32() with
            | 0 -> UpdateConstants (ServerMessageUpdateConstants.readFrom reader)
            | 1 -> GetOrder (ServerMessageGetOrder.readFrom reader)
            | 2 -> Finish (ServerMessageFinish.readFrom reader)
            | 3 -> DebugUpdate (ServerMessageDebugUpdate.readFrom reader)
            | x -> failwith (sprintf "Unexpected tag %d" x)