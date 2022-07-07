<?php

namespace Model {
    require_once 'Stream.php';

    /**
     * Sound properties
     */
    class SoundProperties
    {
        /**
         * Name
         */
        public string $name;
        /**
         * Distance from which the sound can be heard
         */
        public float $distance;
        /**
         * Offset modifier
         */
        public float $offset;
    
        function __construct(string $name, float $distance, float $offset)
        {
            $this->name = $name;
            $this->distance = $distance;
            $this->offset = $offset;
        }
    
        /**
         * Read SoundProperties from input stream
         */
        public static function readFrom(\InputStream $stream): SoundProperties
        {
            $name = $stream->readString();
            $distance = $stream->readDouble();
            $offset = $stream->readDouble();
            return new SoundProperties($name, $distance, $offset);
        }
        
        /**
         * Write SoundProperties to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeString($this->name);
            $stream->writeDouble($this->distance);
            $stream->writeDouble($this->offset);
        }
    }
}