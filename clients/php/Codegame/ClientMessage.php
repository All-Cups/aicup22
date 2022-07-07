<?php

namespace Codegame {
    require_once 'Debugging/DebugCommand.php';
    require_once 'Model/Order.php';
    require_once 'Stream.php';

    /**
     * Message sent from client
     */
    abstract class ClientMessage
    {
        /**
         * Write ClientMessage to output stream
         */
        abstract function writeTo(\OutputStream $stream): void;

        /**
         * Read ClientMessage from input stream
         */
        static function readFrom(\InputStream $stream): ClientMessage
        {
            $tag = $stream->readInt32();
            if ($tag == \Codegame\ClientMessage\DebugMessage::TAG) {
                return \Codegame\ClientMessage\DebugMessage::readFrom($stream);
            }
            if ($tag == \Codegame\ClientMessage\OrderMessage::TAG) {
                return \Codegame\ClientMessage\OrderMessage::readFrom($stream);
            }
            if ($tag == \Codegame\ClientMessage\DebugUpdateDone::TAG) {
                return \Codegame\ClientMessage\DebugUpdateDone::readFrom($stream);
            }
            if ($tag == \Codegame\ClientMessage\RequestDebugState::TAG) {
                return \Codegame\ClientMessage\RequestDebugState::readFrom($stream);
            }
            throw new Exception('Unexpected tag value');
        }
    }
}

namespace Codegame\ClientMessage {
    /**
     * Ask app to perform new debug command
     */
    class DebugMessage extends \Codegame\ClientMessage
    {
        const TAG = 0;
    
        /**
         * Command to perform
         */
        public \Debugging\DebugCommand $command;
    
        function __construct(\Debugging\DebugCommand $command)
        {
            $this->command = $command;
        }
    
        /**
         * Read DebugMessage from input stream
         */
        public static function readFrom(\InputStream $stream): DebugMessage
        {
            $command = \Debugging\DebugCommand::readFrom($stream);
            return new DebugMessage($command);
        }
        
        /**
         * Write DebugMessage to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(DebugMessage::TAG);
            $this->command->writeTo($stream);
        }
    }

    /**
     * Reply for ServerMessage::GetOrder
     */
    class OrderMessage extends \Codegame\ClientMessage
    {
        const TAG = 1;
    
        /**
         * Player's order
         */
        public \Model\Order $order;
    
        function __construct(\Model\Order $order)
        {
            $this->order = $order;
        }
    
        /**
         * Read OrderMessage from input stream
         */
        public static function readFrom(\InputStream $stream): OrderMessage
        {
            $order = \Model\Order::readFrom($stream);
            return new OrderMessage($order);
        }
        
        /**
         * Write OrderMessage to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(OrderMessage::TAG);
            $this->order->writeTo($stream);
        }
    }

    /**
     * Signifies finish of the debug update
     */
    class DebugUpdateDone extends \Codegame\ClientMessage
    {
        const TAG = 2;
    
    
        function __construct()
        {
        }
    
        /**
         * Read DebugUpdateDone from input stream
         */
        public static function readFrom(\InputStream $stream): DebugUpdateDone
        {
            return new DebugUpdateDone();
        }
        
        /**
         * Write DebugUpdateDone to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(DebugUpdateDone::TAG);
        }
    }

    /**
     * Request debug state from the app
     */
    class RequestDebugState extends \Codegame\ClientMessage
    {
        const TAG = 3;
    
    
        function __construct()
        {
        }
    
        /**
         * Read RequestDebugState from input stream
         */
        public static function readFrom(\InputStream $stream): RequestDebugState
        {
            return new RequestDebugState();
        }
        
        /**
         * Write RequestDebugState to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(RequestDebugState::TAG);
        }
    }
}