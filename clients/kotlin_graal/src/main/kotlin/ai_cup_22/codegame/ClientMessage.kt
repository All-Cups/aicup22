package ai_cup_22.codegame

import ai_cup_22.util.StreamUtil

/**
 * Message sent from client
 */
abstract class ClientMessage {
    /**
     * Write ClientMessage to output stream
     */
    @Throws(java.io.IOException::class)
    abstract fun writeTo(stream: java.io.OutputStream)

    companion object {
        /**
         * Read ClientMessage from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): ClientMessage {
            when (StreamUtil.readInt(stream)) {
                DebugMessage.TAG -> return DebugMessage.readFrom(stream)
                OrderMessage.TAG -> return OrderMessage.readFrom(stream)
                DebugUpdateDone.TAG -> return DebugUpdateDone.readFrom(stream)
                RequestDebugState.TAG -> return RequestDebugState.readFrom(stream)
                else -> throw java.io.IOException("Unexpected tag value")
            }
        }
    }

    /**
     * Ask app to perform new debug command
     */
    class DebugMessage : ClientMessage {
        /**
         * Command to perform
         */
        var command: ai_cup_22.debugging.DebugCommand
    
        constructor(command: ai_cup_22.debugging.DebugCommand) {
            this.command = command
        }
    
        /**
         * Write DebugMessage to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            command.writeTo(stream)
        }
    
        /**
         * Get string representation of DebugMessage
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("DebugMessage { ")
            stringBuilder.append("command: ")
            stringBuilder.append(command)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 0
    
            /**
             * Read DebugMessage from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): DebugMessage {
                var command: ai_cup_22.debugging.DebugCommand
                command = ai_cup_22.debugging.DebugCommand.readFrom(stream)
                return DebugMessage(command)
            }
        }
    }

    /**
     * Reply for ServerMessage::GetOrder
     */
    class OrderMessage : ClientMessage {
        /**
         * Player's order
         */
        var order: ai_cup_22.model.Order
    
        constructor(order: ai_cup_22.model.Order) {
            this.order = order
        }
    
        /**
         * Write OrderMessage to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            order.writeTo(stream)
        }
    
        /**
         * Get string representation of OrderMessage
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("OrderMessage { ")
            stringBuilder.append("order: ")
            stringBuilder.append(order)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 1
    
            /**
             * Read OrderMessage from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): OrderMessage {
                var order: ai_cup_22.model.Order
                order = ai_cup_22.model.Order.readFrom(stream)
                return OrderMessage(order)
            }
        }
    }

    /**
     * Signifies finish of the debug update
     */
    class DebugUpdateDone : ClientMessage {
    
        constructor() {
        }
    
        /**
         * Write DebugUpdateDone to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
        }
    
        /**
         * Get string representation of DebugUpdateDone
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("DebugUpdateDone { ")
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 2
    
            /**
             * Read DebugUpdateDone from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): DebugUpdateDone {
                return DebugUpdateDone()
            }
        }
    }

    /**
     * Request debug state from the app
     */
    class RequestDebugState : ClientMessage {
    
        constructor() {
        }
    
        /**
         * Write RequestDebugState to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
        }
    
        /**
         * Get string representation of RequestDebugState
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("RequestDebugState { ")
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 3
    
            /**
             * Read RequestDebugState from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): RequestDebugState {
                return RequestDebugState()
            }
        }
    }
}