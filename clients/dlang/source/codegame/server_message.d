module codegame.server_message;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.constants;
import model.game;

/// Message sent from server
abstract class ServerMessage {
    /// Write ServerMessage to writer
    abstract void writeTo(Stream writer) const;

    /// Read ServerMessage from reader
    static ServerMessage readFrom(Stream reader) {
        switch (reader.readInt()) {
            case UpdateConstants.TAG:
                return UpdateConstants.readFrom(reader);
            case GetOrder.TAG:
                return GetOrder.readFrom(reader);
            case Finish.TAG:
                return Finish.readFrom(reader);
            case DebugUpdate.TAG:
                return DebugUpdate.readFrom(reader);
            default:
                throw new Exception("Unexpected tag value");
        }
    }
    
    /// Update constants
    static class UpdateConstants : ServerMessage {
        static const int TAG = 0;
    
        /// New constants
        model.Constants constants;
    
        this() {}
    
        this(model.Constants constants) {
            this.constants = constants;
        }
    
        /// Read UpdateConstants from reader
        static UpdateConstants readFrom(Stream reader) {
            model.Constants constants;
            constants = model.Constants.readFrom(reader);
            return new UpdateConstants(constants);
        }
    
        /// Write UpdateConstants to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            constants.writeTo(writer);
        }
    }
    
    /// Get order for next tick
    static class GetOrder : ServerMessage {
        static const int TAG = 1;
    
        /// Player's view
        model.Game playerView;
        /// Whether app is running with debug interface available
        bool debugAvailable;
    
        this() {}
    
        this(model.Game playerView, bool debugAvailable) {
            this.playerView = playerView;
            this.debugAvailable = debugAvailable;
        }
    
        /// Read GetOrder from reader
        static GetOrder readFrom(Stream reader) {
            model.Game playerView;
            playerView = model.Game.readFrom(reader);
            bool debugAvailable;
            debugAvailable = reader.readBool();
            return new GetOrder(playerView, debugAvailable);
        }
    
        /// Write GetOrder to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            playerView.writeTo(writer);
            writer.write(debugAvailable);
        }
    }
    
    /// Signifies end of the game
    static class Finish : ServerMessage {
        static const int TAG = 2;
    
    
        this() {}
    
        /// Read Finish from reader
        static Finish readFrom(Stream reader) {
            return new Finish();
        }
    
        /// Write Finish to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
        }
    }
    
    /// Debug update
    static class DebugUpdate : ServerMessage {
        static const int TAG = 3;
    
    
        this() {}
    
        /// Read DebugUpdate from reader
        static DebugUpdate readFrom(Stream reader) {
            return new DebugUpdate();
        }
    
        /// Write DebugUpdate to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
        }
    }
}