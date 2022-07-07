<?php

namespace Model {
    require_once 'Model/ActionOrder.php';
    require_once 'Model/Vec2.php';
    require_once 'Stream.php';

    /**
     * Order for specific unit
     */
    class UnitOrder
    {
        /**
         * Target moving velocity
         */
        public \Model\Vec2 $targetVelocity;
        /**
         * Target view direction (vector length doesn't matter)
         */
        public \Model\Vec2 $targetDirection;
        /**
         * Order to perform an action, or None
         */
        public ?\Model\ActionOrder $action;
    
        function __construct(\Model\Vec2 $targetVelocity, \Model\Vec2 $targetDirection, ?\Model\ActionOrder $action)
        {
            $this->targetVelocity = $targetVelocity;
            $this->targetDirection = $targetDirection;
            $this->action = $action;
        }
    
        /**
         * Read UnitOrder from input stream
         */
        public static function readFrom(\InputStream $stream): UnitOrder
        {
            $targetVelocity = \Model\Vec2::readFrom($stream);
            $targetDirection = \Model\Vec2::readFrom($stream);
            if ($stream->readBool()) {
                $action = \Model\ActionOrder::readFrom($stream);
            } else {
                $action = NULL;
            }
            return new UnitOrder($targetVelocity, $targetDirection, $action);
        }
        
        /**
         * Write UnitOrder to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $this->targetVelocity->writeTo($stream);
            $this->targetDirection->writeTo($stream);
            if (is_null($this->action)) {
                $stream->writeBool(false);
            } else {
                $stream->writeBool(true);
                $this->action->writeTo($stream);
            }
        }
    }
}