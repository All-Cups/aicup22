module codegame.client_message;

import stream;
import std.conv;
import std.typecons : Nullable;
import debugging.debug_command;
import model.order;

/// Message sent from client
abstract class ClientMessage {
    /// Write ClientMessage to writer
    abstract void writeTo(Stream writer) const;

    /// Read ClientMessage from reader
    static ClientMessage readFrom(Stream reader) {
        switch (reader.readInt()) {
            case DebugMessage.TAG:
                return DebugMessage.readFrom(reader);
            case OrderMessage.TAG:
                return OrderMessage.readFrom(reader);
            case DebugUpdateDone.TAG:
                return DebugUpdateDone.readFrom(reader);
            case RequestDebugState.TAG:
                return RequestDebugState.readFrom(reader);
            default:
                throw new Exception("Unexpected tag value");
        }
    }
    
    /// Ask app to perform new debug command
    static class DebugMessage : ClientMessage {
        static const int TAG = 0;
    
        /// Command to perform
        debugging.DebugCommand command;
    
        this() {}
    
        this(debugging.DebugCommand command) {
            this.command = command;
        }
    
        /// Read DebugMessage from reader
        static DebugMessage readFrom(Stream reader) {
            debugging.DebugCommand command;
            command = debugging.DebugCommand.readFrom(reader);
            return new DebugMessage(command);
        }
    
        /// Write DebugMessage to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            command.writeTo(writer);
        }
    }
    
    /// Reply for ServerMessage::GetOrder
    static class OrderMessage : ClientMessage {
        static const int TAG = 1;
    
        /// Player's order
        model.Order order;
    
        this() {}
    
        this(model.Order order) {
            this.order = order;
        }
    
        /// Read OrderMessage from reader
        static OrderMessage readFrom(Stream reader) {
            model.Order order;
            order = model.Order.readFrom(reader);
            return new OrderMessage(order);
        }
    
        /// Write OrderMessage to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            order.writeTo(writer);
        }
    }
    
    /// Signifies finish of the debug update
    static class DebugUpdateDone : ClientMessage {
        static const int TAG = 2;
    
    
        this() {}
    
        /// Read DebugUpdateDone from reader
        static DebugUpdateDone readFrom(Stream reader) {
            return new DebugUpdateDone();
        }
    
        /// Write DebugUpdateDone to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
        }
    }
    
    /// Request debug state from the app
    static class RequestDebugState : ClientMessage {
        static const int TAG = 3;
    
    
        this() {}
    
        /// Read RequestDebugState from reader
        static RequestDebugState readFrom(Stream reader) {
            return new RequestDebugState();
        }
    
        /// Write RequestDebugState to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
        }
    }
}