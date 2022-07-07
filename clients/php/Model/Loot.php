<?php

namespace Model {
    require_once 'Model/Item.php';
    require_once 'Model/Vec2.php';
    require_once 'Stream.php';

    /**
     * Loot lying on the ground
     */
    class Loot
    {
        /**
         * Unique id
         */
        public int $id;
        /**
         * Position
         */
        public \Model\Vec2 $position;
        /**
         * Item
         */
        public \Model\Item $item;
    
        function __construct(int $id, \Model\Vec2 $position, \Model\Item $item)
        {
            $this->id = $id;
            $this->position = $position;
            $this->item = $item;
        }
    
        /**
         * Read Loot from input stream
         */
        public static function readFrom(\InputStream $stream): Loot
        {
            $id = $stream->readInt32();
            $position = \Model\Vec2::readFrom($stream);
            $item = \Model\Item::readFrom($stream);
            return new Loot($id, $position, $item);
        }
        
        /**
         * Write Loot to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32($this->id);
            $this->position->writeTo($stream);
            $this->item->writeTo($stream);
        }
    }
}