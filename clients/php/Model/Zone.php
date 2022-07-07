<?php

namespace Model {
    require_once 'Model/Vec2.php';
    require_once 'Stream.php';

    /**
     * Current state of the game zone
     */
    class Zone
    {
        /**
         * Current center
         */
        public \Model\Vec2 $currentCenter;
        /**
         * Current radius
         */
        public float $currentRadius;
        /**
         * Next center
         */
        public \Model\Vec2 $nextCenter;
        /**
         * Next radius
         */
        public float $nextRadius;
    
        function __construct(\Model\Vec2 $currentCenter, float $currentRadius, \Model\Vec2 $nextCenter, float $nextRadius)
        {
            $this->currentCenter = $currentCenter;
            $this->currentRadius = $currentRadius;
            $this->nextCenter = $nextCenter;
            $this->nextRadius = $nextRadius;
        }
    
        /**
         * Read Zone from input stream
         */
        public static function readFrom(\InputStream $stream): Zone
        {
            $currentCenter = \Model\Vec2::readFrom($stream);
            $currentRadius = $stream->readDouble();
            $nextCenter = \Model\Vec2::readFrom($stream);
            $nextRadius = $stream->readDouble();
            return new Zone($currentCenter, $currentRadius, $nextCenter, $nextRadius);
        }
        
        /**
         * Write Zone to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $this->currentCenter->writeTo($stream);
            $stream->writeDouble($this->currentRadius);
            $this->nextCenter->writeTo($stream);
            $stream->writeDouble($this->nextRadius);
        }
    }
}