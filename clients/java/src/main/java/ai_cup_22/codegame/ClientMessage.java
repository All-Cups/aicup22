package ai_cup_22.codegame;

import ai_cup_22.util.StreamUtil;

/**
 * Message sent from client
 */
public abstract class ClientMessage {
    /**
     * Write ClientMessage to output stream
     */
    public abstract void writeTo(java.io.OutputStream stream) throws java.io.IOException;

    /**
     * Read ClientMessage from input stream
     */
    public static ClientMessage readFrom(java.io.InputStream stream) throws java.io.IOException {
        switch (StreamUtil.readInt(stream)) {
            case DebugMessage.TAG:
                return DebugMessage.readFrom(stream);
            case OrderMessage.TAG:
                return OrderMessage.readFrom(stream);
            case DebugUpdateDone.TAG:
                return DebugUpdateDone.readFrom(stream);
            case RequestDebugState.TAG:
                return RequestDebugState.readFrom(stream);
            default:
                throw new java.io.IOException("Unexpected tag value");
        }
    }

    /**
     * Ask app to perform new debug command
     */
    public static class DebugMessage extends ClientMessage {
        public static final int TAG = 0;
    
        /**
         * Command to perform
         */
        private ai_cup_22.debugging.DebugCommand command;
    
        /**
         * Command to perform
         */
        public ai_cup_22.debugging.DebugCommand getCommand() {
            return command;
        }
    
        /**
         * Command to perform
         */
        public void setCommand(ai_cup_22.debugging.DebugCommand value) {
            this.command = value;
        }
    
        public DebugMessage(ai_cup_22.debugging.DebugCommand command) {
            this.command = command;
        }
    
        /**
         * Read DebugMessage from input stream
         */
        public static DebugMessage readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.debugging.DebugCommand command;
            command = ai_cup_22.debugging.DebugCommand.readFrom(stream);
            return new DebugMessage(command);
        }
    
        /**
         * Write DebugMessage to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            command.writeTo(stream);
        }
    
        /**
         * Get string representation of DebugMessage
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("DebugMessage { ");
            stringBuilder.append("command: ");
            stringBuilder.append(String.valueOf(command));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Reply for ServerMessage::GetOrder
     */
    public static class OrderMessage extends ClientMessage {
        public static final int TAG = 1;
    
        /**
         * Player's order
         */
        private ai_cup_22.model.Order order;
    
        /**
         * Player's order
         */
        public ai_cup_22.model.Order getOrder() {
            return order;
        }
    
        /**
         * Player's order
         */
        public void setOrder(ai_cup_22.model.Order value) {
            this.order = value;
        }
    
        public OrderMessage(ai_cup_22.model.Order order) {
            this.order = order;
        }
    
        /**
         * Read OrderMessage from input stream
         */
        public static OrderMessage readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Order order;
            order = ai_cup_22.model.Order.readFrom(stream);
            return new OrderMessage(order);
        }
    
        /**
         * Write OrderMessage to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            order.writeTo(stream);
        }
    
        /**
         * Get string representation of OrderMessage
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("OrderMessage { ");
            stringBuilder.append("order: ");
            stringBuilder.append(String.valueOf(order));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Signifies finish of the debug update
     */
    public static class DebugUpdateDone extends ClientMessage {
        public static final int TAG = 2;
    
    
        public DebugUpdateDone() {
        }
    
        /**
         * Read DebugUpdateDone from input stream
         */
        public static DebugUpdateDone readFrom(java.io.InputStream stream) throws java.io.IOException {
            return new DebugUpdateDone();
        }
    
        /**
         * Write DebugUpdateDone to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
        }
    
        /**
         * Get string representation of DebugUpdateDone
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("DebugUpdateDone { ");
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Request debug state from the app
     */
    public static class RequestDebugState extends ClientMessage {
        public static final int TAG = 3;
    
    
        public RequestDebugState() {
        }
    
        /**
         * Read RequestDebugState from input stream
         */
        public static RequestDebugState readFrom(java.io.InputStream stream) throws java.io.IOException {
            return new RequestDebugState();
        }
    
        /**
         * Write RequestDebugState to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
        }
    
        /**
         * Get string representation of RequestDebugState
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("RequestDebugState { ");
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }
}