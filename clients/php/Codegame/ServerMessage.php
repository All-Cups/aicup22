<?php

namespace Codegame {
    require_once 'Model/Constants.php';
    require_once 'Model/Game.php';
    require_once 'Stream.php';

    /**
     * Message sent from server
     */
    abstract class ServerMessage
    {
        /**
         * Write ServerMessage to output stream
         */
        abstract function writeTo(\OutputStream $stream): void;

        /**
         * Read ServerMessage from input stream
         */
        static function readFrom(\InputStream $stream): ServerMessage
        {
            $tag = $stream->readInt32();
            if ($tag == \Codegame\ServerMessage\UpdateConstants::TAG) {
                return \Codegame\ServerMessage\UpdateConstants::readFrom($stream);
            }
            if ($tag == \Codegame\ServerMessage\GetOrder::TAG) {
                return \Codegame\ServerMessage\GetOrder::readFrom($stream);
            }
            if ($tag == \Codegame\ServerMessage\Finish::TAG) {
                return \Codegame\ServerMessage\Finish::readFrom($stream);
            }
            if ($tag == \Codegame\ServerMessage\DebugUpdate::TAG) {
                return \Codegame\ServerMessage\DebugUpdate::readFrom($stream);
            }
            throw new Exception('Unexpected tag value');
        }
    }
}

namespace Codegame\ServerMessage {
    /**
     * Update constants
     */
    class UpdateConstants extends \Codegame\ServerMessage
    {
        const TAG = 0;
    
        /**
         * New constants
         */
        public \Model\Constants $constants;
    
        function __construct(\Model\Constants $constants)
        {
            $this->constants = $constants;
        }
    
        /**
         * Read UpdateConstants from input stream
         */
        public static function readFrom(\InputStream $stream): UpdateConstants
        {
            $constants = \Model\Constants::readFrom($stream);
            return new UpdateConstants($constants);
        }
        
        /**
         * Write UpdateConstants to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(UpdateConstants::TAG);
            $this->constants->writeTo($stream);
        }
    }

    /**
     * Get order for next tick
     */
    class GetOrder extends \Codegame\ServerMessage
    {
        const TAG = 1;
    
        /**
         * Player's view
         */
        public \Model\Game $playerView;
        /**
         * Whether app is running with debug interface available
         */
        public bool $debugAvailable;
    
        function __construct(\Model\Game $playerView, bool $debugAvailable)
        {
            $this->playerView = $playerView;
            $this->debugAvailable = $debugAvailable;
        }
    
        /**
         * Read GetOrder from input stream
         */
        public static function readFrom(\InputStream $stream): GetOrder
        {
            $playerView = \Model\Game::readFrom($stream);
            $debugAvailable = $stream->readBool();
            return new GetOrder($playerView, $debugAvailable);
        }
        
        /**
         * Write GetOrder to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(GetOrder::TAG);
            $this->playerView->writeTo($stream);
            $stream->writeBool($this->debugAvailable);
        }
    }

    /**
     * Signifies end of the game
     */
    class Finish extends \Codegame\ServerMessage
    {
        const TAG = 2;
    
    
        function __construct()
        {
        }
    
        /**
         * Read Finish from input stream
         */
        public static function readFrom(\InputStream $stream): Finish
        {
            return new Finish();
        }
        
        /**
         * Write Finish to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Finish::TAG);
        }
    }

    /**
     * Debug update
     */
    class DebugUpdate extends \Codegame\ServerMessage
    {
        const TAG = 3;
    
    
        function __construct()
        {
        }
    
        /**
         * Read DebugUpdate from input stream
         */
        public static function readFrom(\InputStream $stream): DebugUpdate
        {
            return new DebugUpdate();
        }
        
        /**
         * Write DebugUpdate to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(DebugUpdate::TAG);
        }
    }
}