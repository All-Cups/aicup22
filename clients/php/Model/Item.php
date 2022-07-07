<?php

namespace Model {
    require_once 'Stream.php';

    /**
     * Lootable item
     */
    abstract class Item
    {
        /**
         * Write Item to output stream
         */
        abstract function writeTo(\OutputStream $stream): void;

        /**
         * Read Item from input stream
         */
        static function readFrom(\InputStream $stream): Item
        {
            $tag = $stream->readInt32();
            if ($tag == \Model\Item\Weapon::TAG) {
                return \Model\Item\Weapon::readFrom($stream);
            }
            if ($tag == \Model\Item\ShieldPotions::TAG) {
                return \Model\Item\ShieldPotions::readFrom($stream);
            }
            if ($tag == \Model\Item\Ammo::TAG) {
                return \Model\Item\Ammo::readFrom($stream);
            }
            throw new Exception('Unexpected tag value');
        }
    }
}

namespace Model\Item {
    /**
     * Weapon
     */
    class Weapon extends \Model\Item
    {
        const TAG = 0;
    
        /**
         * Weapon type index (starting with 0)
         */
        public int $typeIndex;
    
        function __construct(int $typeIndex)
        {
            $this->typeIndex = $typeIndex;
        }
    
        /**
         * Read Weapon from input stream
         */
        public static function readFrom(\InputStream $stream): Weapon
        {
            $typeIndex = $stream->readInt32();
            return new Weapon($typeIndex);
        }
        
        /**
         * Write Weapon to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Weapon::TAG);
            $stream->writeInt32($this->typeIndex);
        }
    }

    /**
     * Shield potions
     */
    class ShieldPotions extends \Model\Item
    {
        const TAG = 1;
    
        /**
         * Amount of potions
         */
        public int $amount;
    
        function __construct(int $amount)
        {
            $this->amount = $amount;
        }
    
        /**
         * Read ShieldPotions from input stream
         */
        public static function readFrom(\InputStream $stream): ShieldPotions
        {
            $amount = $stream->readInt32();
            return new ShieldPotions($amount);
        }
        
        /**
         * Write ShieldPotions to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(ShieldPotions::TAG);
            $stream->writeInt32($this->amount);
        }
    }

    /**
     * Ammo
     */
    class Ammo extends \Model\Item
    {
        const TAG = 2;
    
        /**
         * Weapon type index (starting with 0)
         */
        public int $weaponTypeIndex;
        /**
         * Amount of ammo
         */
        public int $amount;
    
        function __construct(int $weaponTypeIndex, int $amount)
        {
            $this->weaponTypeIndex = $weaponTypeIndex;
            $this->amount = $amount;
        }
    
        /**
         * Read Ammo from input stream
         */
        public static function readFrom(\InputStream $stream): Ammo
        {
            $weaponTypeIndex = $stream->readInt32();
            $amount = $stream->readInt32();
            return new Ammo($weaponTypeIndex, $amount);
        }
        
        /**
         * Write Ammo to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Ammo::TAG);
            $stream->writeInt32($this->weaponTypeIndex);
            $stream->writeInt32($this->amount);
        }
    }
}