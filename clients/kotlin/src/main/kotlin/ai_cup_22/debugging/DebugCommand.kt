package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * Debug commands that can be sent while debugging with the app
 */
abstract class DebugCommand {
    /**
     * Write DebugCommand to output stream
     */
    @Throws(java.io.IOException::class)
    abstract fun writeTo(stream: java.io.OutputStream)

    companion object {
        /**
         * Read DebugCommand from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): DebugCommand {
            when (StreamUtil.readInt(stream)) {
                Add.TAG -> return Add.readFrom(stream)
                Clear.TAG -> return Clear.readFrom(stream)
                SetAutoFlush.TAG -> return SetAutoFlush.readFrom(stream)
                Flush.TAG -> return Flush.readFrom(stream)
                else -> throw java.io.IOException("Unexpected tag value")
            }
        }
    }

    /**
     * Add debug data to current tick
     */
    class Add : DebugCommand {
        /**
         * Data to add
         */
        var debugData: ai_cup_22.debugging.DebugData
    
        constructor(debugData: ai_cup_22.debugging.DebugData) {
            this.debugData = debugData
        }
    
        /**
         * Write Add to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            debugData.writeTo(stream)
        }
    
        /**
         * Get string representation of Add
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Add { ")
            stringBuilder.append("debugData: ")
            stringBuilder.append(debugData)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 0
    
            /**
             * Read Add from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Add {
                var debugData: ai_cup_22.debugging.DebugData
                debugData = ai_cup_22.debugging.DebugData.readFrom(stream)
                return Add(debugData)
            }
        }
    }

    /**
     * Clear current tick's debug data
     */
    class Clear : DebugCommand {
    
        constructor() {
        }
    
        /**
         * Write Clear to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
        }
    
        /**
         * Get string representation of Clear
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Clear { ")
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 1
    
            /**
             * Read Clear from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Clear {
                return Clear()
            }
        }
    }

    /**
     * Enable/disable auto performing of commands
     */
    class SetAutoFlush : DebugCommand {
        /**
         * Enable/disable autoflush
         */
        var enable: Boolean
    
        constructor(enable: Boolean) {
            this.enable = enable
        }
    
        /**
         * Write SetAutoFlush to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeBoolean(stream, enable)
        }
    
        /**
         * Get string representation of SetAutoFlush
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("SetAutoFlush { ")
            stringBuilder.append("enable: ")
            stringBuilder.append(enable)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 2
    
            /**
             * Read SetAutoFlush from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): SetAutoFlush {
                var enable: Boolean
                enable = StreamUtil.readBoolean(stream)
                return SetAutoFlush(enable)
            }
        }
    }

    /**
     * Perform all previously sent commands
     */
    class Flush : DebugCommand {
    
        constructor() {
        }
    
        /**
         * Write Flush to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
        }
    
        /**
         * Get string representation of Flush
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Flush { ")
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 3
    
            /**
             * Read Flush from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Flush {
                return Flush()
            }
        }
    }
}