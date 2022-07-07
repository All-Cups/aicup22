module debugging.debug_command;

import stream;
import std.conv;
import std.typecons : Nullable;
import debugging.debug_data;

/// Debug commands that can be sent while debugging with the app
abstract class DebugCommand {
    /// Write DebugCommand to writer
    abstract void writeTo(Stream writer) const;

    /// Read DebugCommand from reader
    static DebugCommand readFrom(Stream reader) {
        switch (reader.readInt()) {
            case Add.TAG:
                return Add.readFrom(reader);
            case Clear.TAG:
                return Clear.readFrom(reader);
            case SetAutoFlush.TAG:
                return SetAutoFlush.readFrom(reader);
            case Flush.TAG:
                return Flush.readFrom(reader);
            default:
                throw new Exception("Unexpected tag value");
        }
    }
    
    /// Add debug data to current tick
    static class Add : DebugCommand {
        static const int TAG = 0;
    
        /// Data to add
        debugging.DebugData debugData;
    
        this() {}
    
        this(debugging.DebugData debugData) {
            this.debugData = debugData;
        }
    
        /// Read Add from reader
        static Add readFrom(Stream reader) {
            debugging.DebugData debugData;
            debugData = debugging.DebugData.readFrom(reader);
            return new Add(debugData);
        }
    
        /// Write Add to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            debugData.writeTo(writer);
        }
    }
    
    /// Clear current tick's debug data
    static class Clear : DebugCommand {
        static const int TAG = 1;
    
    
        this() {}
    
        /// Read Clear from reader
        static Clear readFrom(Stream reader) {
            return new Clear();
        }
    
        /// Write Clear to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
        }
    }
    
    /// Enable/disable auto performing of commands
    static class SetAutoFlush : DebugCommand {
        static const int TAG = 2;
    
        /// Enable/disable autoflush
        bool enable;
    
        this() {}
    
        this(bool enable) {
            this.enable = enable;
        }
    
        /// Read SetAutoFlush from reader
        static SetAutoFlush readFrom(Stream reader) {
            bool enable;
            enable = reader.readBool();
            return new SetAutoFlush(enable);
        }
    
        /// Write SetAutoFlush to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(enable);
        }
    }
    
    /// Perform all previously sent commands
    static class Flush : DebugCommand {
        static const int TAG = 3;
    
    
        this() {}
    
        /// Read Flush from reader
        static Flush readFrom(Stream reader) {
            return new Flush();
        }
    
        /// Write Flush to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
        }
    }
}