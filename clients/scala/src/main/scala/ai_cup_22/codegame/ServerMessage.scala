package ai_cup_22.codegame

import ai_cup_22.util.StreamUtil

/**
 * Message sent from server
 */
sealed trait ServerMessage {
    /**
     * Write ServerMessage to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit
}

object ServerMessage {
    /**
     * Update constants
     *
     * @param constants New constants
     */
    case class UpdateConstants(constants: ai_cup_22.model.Constants) extends ServerMessage {
        /**
         * Write UpdateConstants to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, UpdateConstants.TAG)
            constants.writeTo(stream)
        }
    
        /**
         * Get string representation of UpdateConstants
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("UpdateConstants { ")
            stringBuilder.append("constants: ")
            stringBuilder.append(constants)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object UpdateConstants {
        val TAG: Int = 0
    
        /**
         * Read UpdateConstants from input stream
         */
        def readFrom(stream: java.io.InputStream): UpdateConstants = UpdateConstants(
            ai_cup_22.model.Constants.readFrom(stream)
        )
    }

    /**
     * Get order for next tick
     *
     * @param playerView Player's view
     * @param debugAvailable Whether app is running with debug interface available
     */
    case class GetOrder(playerView: ai_cup_22.model.Game, debugAvailable: Boolean) extends ServerMessage {
        /**
         * Write GetOrder to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, GetOrder.TAG)
            playerView.writeTo(stream)
            StreamUtil.writeBoolean(stream, debugAvailable)
        }
    
        /**
         * Get string representation of GetOrder
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("GetOrder { ")
            stringBuilder.append("playerView: ")
            stringBuilder.append(playerView)
            stringBuilder.append(", ")
            stringBuilder.append("debugAvailable: ")
            stringBuilder.append(debugAvailable)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object GetOrder {
        val TAG: Int = 1
    
        /**
         * Read GetOrder from input stream
         */
        def readFrom(stream: java.io.InputStream): GetOrder = GetOrder(
            ai_cup_22.model.Game.readFrom(stream),
            StreamUtil.readBoolean(stream)
        )
    }

    /**
     * Signifies end of the game
     */
    case class Finish() extends ServerMessage {
        /**
         * Write Finish to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Finish.TAG)
        }
    
        /**
         * Get string representation of Finish
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Finish { ")
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Finish {
        val TAG: Int = 2
    
        /**
         * Read Finish from input stream
         */
        def readFrom(stream: java.io.InputStream): Finish = Finish(
        )
    }

    /**
     * Debug update
     *
     * @param displayedTick Displayed tick
     */
    case class DebugUpdate(displayedTick: Int) extends ServerMessage {
        /**
         * Write DebugUpdate to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, DebugUpdate.TAG)
            StreamUtil.writeInt(stream, displayedTick)
        }
    
        /**
         * Get string representation of DebugUpdate
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("DebugUpdate { ")
            stringBuilder.append("displayedTick: ")
            stringBuilder.append(displayedTick)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object DebugUpdate {
        val TAG: Int = 3
    
        /**
         * Read DebugUpdate from input stream
         */
        def readFrom(stream: java.io.InputStream): DebugUpdate = DebugUpdate(
            StreamUtil.readInt(stream)
        )
    }

    /**
     * Read ServerMessage from input stream
     */
    def readFrom(stream: java.io.InputStream): ServerMessage = {
        StreamUtil.readInt(stream) match {
            case UpdateConstants.TAG => UpdateConstants.readFrom(stream)
            case GetOrder.TAG => GetOrder.readFrom(stream)
            case Finish.TAG => Finish.readFrom(stream)
            case DebugUpdate.TAG => DebugUpdate.readFrom(stream)
            case _ => throw new java.io.IOException("Unexpected tag value")
        }
    }
}