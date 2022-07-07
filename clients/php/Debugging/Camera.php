<?php

namespace Debugging {
    require_once 'Model/Vec2.php';
    require_once 'Stream.php';

    /**
     * Camera state
     */
    class Camera
    {
        /**
         * Center
         */
        public \Model\Vec2 $center;
        /**
         * Rotation
         */
        public float $rotation;
        /**
         * Attack angle
         */
        public float $attack;
        /**
         * Vertical field of view
         */
        public float $fov;
    
        function __construct(\Model\Vec2 $center, float $rotation, float $attack, float $fov)
        {
            $this->center = $center;
            $this->rotation = $rotation;
            $this->attack = $attack;
            $this->fov = $fov;
        }
    
        /**
         * Read Camera from input stream
         */
        public static function readFrom(\InputStream $stream): Camera
        {
            $center = \Model\Vec2::readFrom($stream);
            $rotation = $stream->readDouble();
            $attack = $stream->readDouble();
            $fov = $stream->readDouble();
            return new Camera($center, $rotation, $attack, $fov);
        }
        
        /**
         * Write Camera to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $this->center->writeTo($stream);
            $stream->writeDouble($this->rotation);
            $stream->writeDouble($this->attack);
            $stream->writeDouble($this->fov);
        }
    }
}