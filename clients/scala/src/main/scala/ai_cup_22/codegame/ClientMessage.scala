package ai_cup_22.codegame

import ai_cup_22.util.StreamUtil

/**
 * Message sent from client
 */
sealed trait ClientMessage {
    /**
     * Write ClientMessage to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit
}

object ClientMessage {
    /**
     * Ask app to perform new debug command
     *
     * @param command Command to perform
     */
    case class DebugMessage(command: ai_cup_22.debugging.DebugCommand) extends ClientMessage {
        /**
         * Write DebugMessage to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, DebugMessage.TAG)
            command.writeTo(stream)
        }
    
        /**
         * Get string representation of DebugMessage
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("DebugMessage { ")
            stringBuilder.append("command: ")
            stringBuilder.append(command)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object DebugMessage {
        val TAG: Int = 0
    
        /**
         * Read DebugMessage from input stream
         */
        def readFrom(stream: java.io.InputStream): DebugMessage = DebugMessage(
            ai_cup_22.debugging.DebugCommand.readFrom(stream)
        )
    }

    /**
     * Reply for ServerMessage::GetOrder
     *
     * @param order Player's order
     */
    case class OrderMessage(order: ai_cup_22.model.Order) extends ClientMessage {
        /**
         * Write OrderMessage to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, OrderMessage.TAG)
            order.writeTo(stream)
        }
    
        /**
         * Get string representation of OrderMessage
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("OrderMessage { ")
            stringBuilder.append("order: ")
            stringBuilder.append(order)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object OrderMessage {
        val TAG: Int = 1
    
        /**
         * Read OrderMessage from input stream
         */
        def readFrom(stream: java.io.InputStream): OrderMessage = OrderMessage(
            ai_cup_22.model.Order.readFrom(stream)
        )
    }

    /**
     * Signifies finish of the debug update
     */
    case class DebugUpdateDone() extends ClientMessage {
        /**
         * Write DebugUpdateDone to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, DebugUpdateDone.TAG)
        }
    
        /**
         * Get string representation of DebugUpdateDone
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("DebugUpdateDone { ")
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object DebugUpdateDone {
        val TAG: Int = 2
    
        /**
         * Read DebugUpdateDone from input stream
         */
        def readFrom(stream: java.io.InputStream): DebugUpdateDone = DebugUpdateDone(
        )
    }

    /**
     * Request debug state from the app
     */
    case class RequestDebugState() extends ClientMessage {
        /**
         * Write RequestDebugState to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, RequestDebugState.TAG)
        }
    
        /**
         * Get string representation of RequestDebugState
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("RequestDebugState { ")
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object RequestDebugState {
        val TAG: Int = 3
    
        /**
         * Read RequestDebugState from input stream
         */
        def readFrom(stream: java.io.InputStream): RequestDebugState = RequestDebugState(
        )
    }

    /**
     * Read ClientMessage from input stream
     */
    def readFrom(stream: java.io.InputStream): ClientMessage = {
        StreamUtil.readInt(stream) match {
            case DebugMessage.TAG => DebugMessage.readFrom(stream)
            case OrderMessage.TAG => OrderMessage.readFrom(stream)
            case DebugUpdateDone.TAG => DebugUpdateDone.readFrom(stream)
            case RequestDebugState.TAG => RequestDebugState.readFrom(stream)
            case _ => throw new java.io.IOException("Unexpected tag value")
        }
    }
}