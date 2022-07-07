<?php

namespace Model {
    require_once 'Stream.php';

    /**
     * Game's participant (team of units)
     */
    class Player
    {
        /**
         * Unique id
         */
        public int $id;
        /**
         * Number of kills
         */
        public int $kills;
        /**
         * Total damage dealt to enemies
         */
        public float $damage;
        /**
         * Survival place (number of survivor teams currently/at the moment of death)
         */
        public int $place;
        /**
         * Team score
         */
        public float $score;
    
        function __construct(int $id, int $kills, float $damage, int $place, float $score)
        {
            $this->id = $id;
            $this->kills = $kills;
            $this->damage = $damage;
            $this->place = $place;
            $this->score = $score;
        }
    
        /**
         * Read Player from input stream
         */
        public static function readFrom(\InputStream $stream): Player
        {
            $id = $stream->readInt32();
            $kills = $stream->readInt32();
            $damage = $stream->readDouble();
            $place = $stream->readInt32();
            $score = $stream->readDouble();
            return new Player($id, $kills, $damage, $place, $score);
        }
        
        /**
         * Write Player to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32($this->id);
            $stream->writeInt32($this->kills);
            $stream->writeDouble($this->damage);
            $stream->writeInt32($this->place);
            $stream->writeDouble($this->score);
        }
    }
}