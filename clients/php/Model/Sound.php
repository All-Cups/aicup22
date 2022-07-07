<?php

namespace Model {
    require_once 'Model/Vec2.php';
    require_once 'Stream.php';

    /**
     * Sound heard by one of your units
     */
    class Sound
    {
        /**
         * Sound type index (starting with 0)
         */
        public int $typeIndex;
        /**
         * Id of unit that heard this sound
         */
        public int $unitId;
        /**
         * Position where sound was heard (different from sound source position)
         */
        public \Model\Vec2 $position;
    
        function __construct(int $typeIndex, int $unitId, \Model\Vec2 $position)
        {
            $this->typeIndex = $typeIndex;
            $this->unitId = $unitId;
            $this->position = $position;
        }
    
        /**
         * Read Sound from input stream
         */
        public static function readFrom(\InputStream $stream): Sound
        {
            $typeIndex = $stream->readInt32();
            $unitId = $stream->readInt32();
            $position = \Model\Vec2::readFrom($stream);
            return new Sound($typeIndex, $unitId, $position);
        }
        
        /**
         * Write Sound to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32($this->typeIndex);
            $stream->writeInt32($this->unitId);
            $this->position->writeTo($stream);
        }
    }
}