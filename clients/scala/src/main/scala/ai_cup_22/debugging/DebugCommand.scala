package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * Debug commands that can be sent while debugging with the app
 */
sealed trait DebugCommand {
    /**
     * Write DebugCommand to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit
}

object DebugCommand {
    /**
     * Add debug data to current tick
     *
     * @param debugData Data to add
     */
    case class Add(debugData: ai_cup_22.debugging.DebugData) extends DebugCommand {
        /**
         * Write Add to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Add.TAG)
            debugData.writeTo(stream)
        }
    
        /**
         * Get string representation of Add
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Add { ")
            stringBuilder.append("debugData: ")
            stringBuilder.append(debugData)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Add {
        val TAG: Int = 0
    
        /**
         * Read Add from input stream
         */
        def readFrom(stream: java.io.InputStream): Add = Add(
            ai_cup_22.debugging.DebugData.readFrom(stream)
        )
    }

    /**
     * Clear current tick's debug data
     */
    case class Clear() extends DebugCommand {
        /**
         * Write Clear to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Clear.TAG)
        }
    
        /**
         * Get string representation of Clear
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Clear { ")
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Clear {
        val TAG: Int = 1
    
        /**
         * Read Clear from input stream
         */
        def readFrom(stream: java.io.InputStream): Clear = Clear(
        )
    }

    /**
     * Enable/disable auto performing of commands
     *
     * @param enable Enable/disable autoflush
     */
    case class SetAutoFlush(enable: Boolean) extends DebugCommand {
        /**
         * Write SetAutoFlush to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, SetAutoFlush.TAG)
            StreamUtil.writeBoolean(stream, enable)
        }
    
        /**
         * Get string representation of SetAutoFlush
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("SetAutoFlush { ")
            stringBuilder.append("enable: ")
            stringBuilder.append(enable)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object SetAutoFlush {
        val TAG: Int = 2
    
        /**
         * Read SetAutoFlush from input stream
         */
        def readFrom(stream: java.io.InputStream): SetAutoFlush = SetAutoFlush(
            StreamUtil.readBoolean(stream)
        )
    }

    /**
     * Perform all previously sent commands
     */
    case class Flush() extends DebugCommand {
        /**
         * Write Flush to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Flush.TAG)
        }
    
        /**
         * Get string representation of Flush
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Flush { ")
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Flush {
        val TAG: Int = 3
    
        /**
         * Read Flush from input stream
         */
        def readFrom(stream: java.io.InputStream): Flush = Flush(
        )
    }

    /**
     * Read DebugCommand from input stream
     */
    def readFrom(stream: java.io.InputStream): DebugCommand = {
        StreamUtil.readInt(stream) match {
            case Add.TAG => Add.readFrom(stream)
            case Clear.TAG => Clear.readFrom(stream)
            case SetAutoFlush.TAG => SetAutoFlush.readFrom(stream)
            case Flush.TAG => Flush.readFrom(stream)
            case _ => throw new java.io.IOException("Unexpected tag value")
        }
    }
}