<?php

namespace Model {
    require_once 'Stream.php';

    /**
     * Order to perform an action for unit
     */
    abstract class ActionOrder
    {
        /**
         * Write ActionOrder to output stream
         */
        abstract function writeTo(\OutputStream $stream): void;

        /**
         * Read ActionOrder from input stream
         */
        static function readFrom(\InputStream $stream): ActionOrder
        {
            $tag = $stream->readInt32();
            if ($tag == \Model\ActionOrder\Pickup::TAG) {
                return \Model\ActionOrder\Pickup::readFrom($stream);
            }
            if ($tag == \Model\ActionOrder\UseShieldPotion::TAG) {
                return \Model\ActionOrder\UseShieldPotion::readFrom($stream);
            }
            if ($tag == \Model\ActionOrder\DropShieldPotions::TAG) {
                return \Model\ActionOrder\DropShieldPotions::readFrom($stream);
            }
            if ($tag == \Model\ActionOrder\DropWeapon::TAG) {
                return \Model\ActionOrder\DropWeapon::readFrom($stream);
            }
            if ($tag == \Model\ActionOrder\DropAmmo::TAG) {
                return \Model\ActionOrder\DropAmmo::readFrom($stream);
            }
            if ($tag == \Model\ActionOrder\Aim::TAG) {
                return \Model\ActionOrder\Aim::readFrom($stream);
            }
            throw new Exception('Unexpected tag value');
        }
    }
}

namespace Model\ActionOrder {
    /**
     * Pick up loot
     */
    class Pickup extends \Model\ActionOrder
    {
        const TAG = 0;
    
        /**
         * Loot id
         */
        public int $loot;
    
        function __construct(int $loot)
        {
            $this->loot = $loot;
        }
    
        /**
         * Read Pickup from input stream
         */
        public static function readFrom(\InputStream $stream): Pickup
        {
            $loot = $stream->readInt32();
            return new Pickup($loot);
        }
        
        /**
         * Write Pickup to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Pickup::TAG);
            $stream->writeInt32($this->loot);
        }
    }

    /**
     * Use shield potion
     */
    class UseShieldPotion extends \Model\ActionOrder
    {
        const TAG = 1;
    
    
        function __construct()
        {
        }
    
        /**
         * Read UseShieldPotion from input stream
         */
        public static function readFrom(\InputStream $stream): UseShieldPotion
        {
            return new UseShieldPotion();
        }
        
        /**
         * Write UseShieldPotion to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(UseShieldPotion::TAG);
        }
    }

    /**
     * Drop shield potions on the ground
     */
    class DropShieldPotions extends \Model\ActionOrder
    {
        const TAG = 2;
    
        /**
         * Amount of potions
         */
        public int $amount;
    
        function __construct(int $amount)
        {
            $this->amount = $amount;
        }
    
        /**
         * Read DropShieldPotions from input stream
         */
        public static function readFrom(\InputStream $stream): DropShieldPotions
        {
            $amount = $stream->readInt32();
            return new DropShieldPotions($amount);
        }
        
        /**
         * Write DropShieldPotions to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(DropShieldPotions::TAG);
            $stream->writeInt32($this->amount);
        }
    }

    /**
     * Drop current weapon
     */
    class DropWeapon extends \Model\ActionOrder
    {
        const TAG = 3;
    
    
        function __construct()
        {
        }
    
        /**
         * Read DropWeapon from input stream
         */
        public static function readFrom(\InputStream $stream): DropWeapon
        {
            return new DropWeapon();
        }
        
        /**
         * Write DropWeapon to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(DropWeapon::TAG);
        }
    }

    /**
     * Drop ammo
     */
    class DropAmmo extends \Model\ActionOrder
    {
        const TAG = 4;
    
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
         * Read DropAmmo from input stream
         */
        public static function readFrom(\InputStream $stream): DropAmmo
        {
            $weaponTypeIndex = $stream->readInt32();
            $amount = $stream->readInt32();
            return new DropAmmo($weaponTypeIndex, $amount);
        }
        
        /**
         * Write DropAmmo to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(DropAmmo::TAG);
            $stream->writeInt32($this->weaponTypeIndex);
            $stream->writeInt32($this->amount);
        }
    }

    /**
     * Start/continue aiming
     */
    class Aim extends \Model\ActionOrder
    {
        const TAG = 5;
    
        /**
         * Shoot (only possible in full aim)
         */
        public bool $shoot;
    
        function __construct(bool $shoot)
        {
            $this->shoot = $shoot;
        }
    
        /**
         * Read Aim from input stream
         */
        public static function readFrom(\InputStream $stream): Aim
        {
            $shoot = $stream->readBool();
            return new Aim($shoot);
        }
        
        /**
         * Write Aim to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Aim::TAG);
            $stream->writeBool($this->shoot);
        }
    }
}