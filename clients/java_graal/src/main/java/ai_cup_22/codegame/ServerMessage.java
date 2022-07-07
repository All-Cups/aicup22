package ai_cup_22.codegame;

import ai_cup_22.util.StreamUtil;

/**
 * Message sent from server
 */
public abstract class ServerMessage {
    /**
     * Write ServerMessage to output stream
     */
    public abstract void writeTo(java.io.OutputStream stream) throws java.io.IOException;

    /**
     * Read ServerMessage from input stream
     */
    public static ServerMessage readFrom(java.io.InputStream stream) throws java.io.IOException {
        switch (StreamUtil.readInt(stream)) {
            case UpdateConstants.TAG:
                return UpdateConstants.readFrom(stream);
            case GetOrder.TAG:
                return GetOrder.readFrom(stream);
            case Finish.TAG:
                return Finish.readFrom(stream);
            case DebugUpdate.TAG:
                return DebugUpdate.readFrom(stream);
            default:
                throw new java.io.IOException("Unexpected tag value");
        }
    }

    /**
     * Update constants
     */
    public static class UpdateConstants extends ServerMessage {
        public static final int TAG = 0;
    
        /**
         * New constants
         */
        private ai_cup_22.model.Constants constants;
    
        /**
         * New constants
         */
        public ai_cup_22.model.Constants getConstants() {
            return constants;
        }
    
        /**
         * New constants
         */
        public void setConstants(ai_cup_22.model.Constants value) {
            this.constants = value;
        }
    
        public UpdateConstants(ai_cup_22.model.Constants constants) {
            this.constants = constants;
        }
    
        /**
         * Read UpdateConstants from input stream
         */
        public static UpdateConstants readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Constants constants;
            constants = ai_cup_22.model.Constants.readFrom(stream);
            return new UpdateConstants(constants);
        }
    
        /**
         * Write UpdateConstants to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            constants.writeTo(stream);
        }
    
        /**
         * Get string representation of UpdateConstants
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("UpdateConstants { ");
            stringBuilder.append("constants: ");
            stringBuilder.append(String.valueOf(constants));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Get order for next tick
     */
    public static class GetOrder extends ServerMessage {
        public static final int TAG = 1;
    
        /**
         * Player's view
         */
        private ai_cup_22.model.Game playerView;
    
        /**
         * Player's view
         */
        public ai_cup_22.model.Game getPlayerView() {
            return playerView;
        }
    
        /**
         * Player's view
         */
        public void setPlayerView(ai_cup_22.model.Game value) {
            this.playerView = value;
        }
        /**
         * Whether app is running with debug interface available
         */
        private boolean debugAvailable;
    
        /**
         * Whether app is running with debug interface available
         */
        public boolean isDebugAvailable() {
            return debugAvailable;
        }
    
        /**
         * Whether app is running with debug interface available
         */
        public void setDebugAvailable(boolean value) {
            this.debugAvailable = value;
        }
    
        public GetOrder(ai_cup_22.model.Game playerView, boolean debugAvailable) {
            this.playerView = playerView;
            this.debugAvailable = debugAvailable;
        }
    
        /**
         * Read GetOrder from input stream
         */
        public static GetOrder readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Game playerView;
            playerView = ai_cup_22.model.Game.readFrom(stream);
            boolean debugAvailable;
            debugAvailable = StreamUtil.readBoolean(stream);
            return new GetOrder(playerView, debugAvailable);
        }
    
        /**
         * Write GetOrder to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            playerView.writeTo(stream);
            StreamUtil.writeBoolean(stream, debugAvailable);
        }
    
        /**
         * Get string representation of GetOrder
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("GetOrder { ");
            stringBuilder.append("playerView: ");
            stringBuilder.append(String.valueOf(playerView));
            stringBuilder.append(", ");
            stringBuilder.append("debugAvailable: ");
            stringBuilder.append(String.valueOf(debugAvailable));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Signifies end of the game
     */
    public static class Finish extends ServerMessage {
        public static final int TAG = 2;
    
    
        public Finish() {
        }
    
        /**
         * Read Finish from input stream
         */
        public static Finish readFrom(java.io.InputStream stream) throws java.io.IOException {
            return new Finish();
        }
    
        /**
         * Write Finish to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
        }
    
        /**
         * Get string representation of Finish
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Finish { ");
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Debug update
     */
    public static class DebugUpdate extends ServerMessage {
        public static final int TAG = 3;
    
    
        public DebugUpdate() {
        }
    
        /**
         * Read DebugUpdate from input stream
         */
        public static DebugUpdate readFrom(java.io.InputStream stream) throws java.io.IOException {
            return new DebugUpdate();
        }
    
        /**
         * Write DebugUpdate to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
        }
    
        /**
         * Get string representation of DebugUpdate
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("DebugUpdate { ");
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }
}