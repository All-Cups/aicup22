<?php

namespace Debugging {
    require_once 'Debugging/Color.php';
    require_once 'Model/Vec2.php';
    require_once 'Stream.php';

    /**
     * Point + color
     */
    class ColoredVertex
    {
        /**
         * Position
         */
        public \Model\Vec2 $position;
        /**
         * Color
         */
        public \Debugging\Color $color;
    
        function __construct(\Model\Vec2 $position, \Debugging\Color $color)
        {
            $this->position = $position;
            $this->color = $color;
        }
    
        /**
         * Read ColoredVertex from input stream
         */
        public static function readFrom(\InputStream $stream): ColoredVertex
        {
            $position = \Model\Vec2::readFrom($stream);
            $color = \Debugging\Color::readFrom($stream);
            return new ColoredVertex($position, $color);
        }
        
        /**
         * Write ColoredVertex to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $this->position->writeTo($stream);
            $this->color->writeTo($stream);
        }
    }
}