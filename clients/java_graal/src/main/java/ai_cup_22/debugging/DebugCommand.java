package ai_cup_22.debugging;

import ai_cup_22.util.StreamUtil;

/**
 * Debug commands that can be sent while debugging with the app
 */
public abstract class DebugCommand {
    /**
     * Write DebugCommand to output stream
     */
    public abstract void writeTo(java.io.OutputStream stream) throws java.io.IOException;

    /**
     * Read DebugCommand from input stream
     */
    public static DebugCommand readFrom(java.io.InputStream stream) throws java.io.IOException {
        switch (StreamUtil.readInt(stream)) {
            case Add.TAG:
                return Add.readFrom(stream);
            case Clear.TAG:
                return Clear.readFrom(stream);
            case SetAutoFlush.TAG:
                return SetAutoFlush.readFrom(stream);
            case Flush.TAG:
                return Flush.readFrom(stream);
            default:
                throw new java.io.IOException("Unexpected tag value");
        }
    }

    /**
     * Add debug data to current tick
     */
    public static class Add extends DebugCommand {
        public static final int TAG = 0;
    
        /**
         * Data to add
         */
        private ai_cup_22.debugging.DebugData debugData;
    
        /**
         * Data to add
         */
        public ai_cup_22.debugging.DebugData getDebugData() {
            return debugData;
        }
    
        /**
         * Data to add
         */
        public void setDebugData(ai_cup_22.debugging.DebugData value) {
            this.debugData = value;
        }
    
        public Add(ai_cup_22.debugging.DebugData debugData) {
            this.debugData = debugData;
        }
    
        /**
         * Read Add from input stream
         */
        public static Add readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.debugging.DebugData debugData;
            debugData = ai_cup_22.debugging.DebugData.readFrom(stream);
            return new Add(debugData);
        }
    
        /**
         * Write Add to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            debugData.writeTo(stream);
        }
    
        /**
         * Get string representation of Add
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Add { ");
            stringBuilder.append("debugData: ");
            stringBuilder.append(String.valueOf(debugData));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Clear current tick's debug data
     */
    public static class Clear extends DebugCommand {
        public static final int TAG = 1;
    
    
        public Clear() {
        }
    
        /**
         * Read Clear from input stream
         */
        public static Clear readFrom(java.io.InputStream stream) throws java.io.IOException {
            return new Clear();
        }
    
        /**
         * Write Clear to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
        }
    
        /**
         * Get string representation of Clear
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Clear { ");
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Enable/disable auto performing of commands
     */
    public static class SetAutoFlush extends DebugCommand {
        public static final int TAG = 2;
    
        /**
         * Enable/disable autoflush
         */
        private boolean enable;
    
        /**
         * Enable/disable autoflush
         */
        public boolean isEnable() {
            return enable;
        }
    
        /**
         * Enable/disable autoflush
         */
        public void setEnable(boolean value) {
            this.enable = value;
        }
    
        public SetAutoFlush(boolean enable) {
            this.enable = enable;
        }
    
        /**
         * Read SetAutoFlush from input stream
         */
        public static SetAutoFlush readFrom(java.io.InputStream stream) throws java.io.IOException {
            boolean enable;
            enable = StreamUtil.readBoolean(stream);
            return new SetAutoFlush(enable);
        }
    
        /**
         * Write SetAutoFlush to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeBoolean(stream, enable);
        }
    
        /**
         * Get string representation of SetAutoFlush
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("SetAutoFlush { ");
            stringBuilder.append("enable: ");
            stringBuilder.append(String.valueOf(enable));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Perform all previously sent commands
     */
    public static class Flush extends DebugCommand {
        public static final int TAG = 3;
    
    
        public Flush() {
        }
    
        /**
         * Read Flush from input stream
         */
        public static Flush readFrom(java.io.InputStream stream) throws java.io.IOException {
            return new Flush();
        }
    
        /**
         * Write Flush to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
        }
    
        /**
         * Get string representation of Flush
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Flush { ");
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }
}