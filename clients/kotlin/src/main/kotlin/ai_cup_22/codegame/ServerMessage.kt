package ai_cup_22.codegame

import ai_cup_22.util.StreamUtil

/**
 * Message sent from server
 */
abstract class ServerMessage {
    /**
     * Write ServerMessage to output stream
     */
    @Throws(java.io.IOException::class)
    abstract fun writeTo(stream: java.io.OutputStream)

    companion object {
        /**
         * Read ServerMessage from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): ServerMessage {
            when (StreamUtil.readInt(stream)) {
                UpdateConstants.TAG -> return UpdateConstants.readFrom(stream)
                GetOrder.TAG -> return GetOrder.readFrom(stream)
                Finish.TAG -> return Finish.readFrom(stream)
                DebugUpdate.TAG -> return DebugUpdate.readFrom(stream)
                else -> throw java.io.IOException("Unexpected tag value")
            }
        }
    }

    /**
     * Update constants
     */
    class UpdateConstants : ServerMessage {
        /**
         * New constants
         */
        var constants: ai_cup_22.model.Constants
    
        constructor(constants: ai_cup_22.model.Constants) {
            this.constants = constants
        }
    
        /**
         * Write UpdateConstants to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            constants.writeTo(stream)
        }
    
        /**
         * Get string representation of UpdateConstants
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("UpdateConstants { ")
            stringBuilder.append("constants: ")
            stringBuilder.append(constants)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 0
    
            /**
             * Read UpdateConstants from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): UpdateConstants {
                var constants: ai_cup_22.model.Constants
                constants = ai_cup_22.model.Constants.readFrom(stream)
                return UpdateConstants(constants)
            }
        }
    }

    /**
     * Get order for next tick
     */
    class GetOrder : ServerMessage {
        /**
         * Player's view
         */
        var playerView: ai_cup_22.model.Game
        /**
         * Whether app is running with debug interface available
         */
        var debugAvailable: Boolean
    
        constructor(playerView: ai_cup_22.model.Game, debugAvailable: Boolean) {
            this.playerView = playerView
            this.debugAvailable = debugAvailable
        }
    
        /**
         * Write GetOrder to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            playerView.writeTo(stream)
            StreamUtil.writeBoolean(stream, debugAvailable)
        }
    
        /**
         * Get string representation of GetOrder
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("GetOrder { ")
            stringBuilder.append("playerView: ")
            stringBuilder.append(playerView)
            stringBuilder.append(", ")
            stringBuilder.append("debugAvailable: ")
            stringBuilder.append(debugAvailable)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 1
    
            /**
             * Read GetOrder from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): GetOrder {
                var playerView: ai_cup_22.model.Game
                playerView = ai_cup_22.model.Game.readFrom(stream)
                var debugAvailable: Boolean
                debugAvailable = StreamUtil.readBoolean(stream)
                return GetOrder(playerView, debugAvailable)
            }
        }
    }

    /**
     * Signifies end of the game
     */
    class Finish : ServerMessage {
    
        constructor() {
        }
    
        /**
         * Write Finish to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
        }
    
        /**
         * Get string representation of Finish
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Finish { ")
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 2
    
            /**
             * Read Finish from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Finish {
                return Finish()
            }
        }
    }

    /**
     * Debug update
     */
    class DebugUpdate : ServerMessage {
        /**
         * Displayed tick
         */
        var displayedTick: Int
    
        constructor(displayedTick: Int) {
            this.displayedTick = displayedTick
        }
    
        /**
         * Write DebugUpdate to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeInt(stream, displayedTick)
        }
    
        /**
         * Get string representation of DebugUpdate
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("DebugUpdate { ")
            stringBuilder.append("displayedTick: ")
            stringBuilder.append(displayedTick)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 3
    
            /**
             * Read DebugUpdate from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): DebugUpdate {
                var displayedTick: Int
                displayedTick = StreamUtil.readInt(stream)
                return DebugUpdate(displayedTick)
            }
        }
    }
}