<?php

namespace Model {
    require_once 'Model/ActionType.php';
    require_once 'Stream.php';

    /**
     * Action unit is currently performing
     */
    class Action
    {
        /**
         * Tick when the action will be finished
         */
        public int $finishTick;
        /**
         * Type of the action
         */
        public int $actionType;
    
        function __construct(int $finishTick, int $actionType)
        {
            $this->finishTick = $finishTick;
            $this->actionType = $actionType;
        }
    
        /**
         * Read Action from input stream
         */
        public static function readFrom(\InputStream $stream): Action
        {
            $finishTick = $stream->readInt32();
            $actionType = \Model\ActionType::readFrom($stream);
            return new Action($finishTick, $actionType);
        }
        
        /**
         * Write Action to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32($this->finishTick);
            $stream->writeInt32($this->actionType);
        }
    }
}