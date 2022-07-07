<?php

namespace Model {
    require_once 'Stream.php';

    /**
     * 2 dimensional vector.
     */
    class Vec2
    {
        /**
         * `x` coordinate of the vector
         */
        public float $x;
        /**
         * `y` coordinate of the vector
         */
        public float $y;
    
        function __construct(float $x, float $y)
        {
            $this->x = $x;
            $this->y = $y;
        }
    
        /**
         * Read Vec2 from input stream
         */
        public static function readFrom(\InputStream $stream): Vec2
        {
            $x = $stream->readDouble();
            $y = $stream->readDouble();
            return new Vec2($x, $y);
        }
        
        /**
         * Write Vec2 to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeDouble($this->x);
            $stream->writeDouble($this->y);
        }
    }
}