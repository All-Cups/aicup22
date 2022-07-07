module model.action_order;

import stream;
import std.conv;
import std.typecons : Nullable;


/// Order to perform an action for unit
abstract class ActionOrder {
    /// Write ActionOrder to writer
    abstract void writeTo(Stream writer) const;

    /// Read ActionOrder from reader
    static ActionOrder readFrom(Stream reader) {
        switch (reader.readInt()) {
            case Pickup.TAG:
                return Pickup.readFrom(reader);
            case UseShieldPotion.TAG:
                return UseShieldPotion.readFrom(reader);
            case DropShieldPotions.TAG:
                return DropShieldPotions.readFrom(reader);
            case DropWeapon.TAG:
                return DropWeapon.readFrom(reader);
            case DropAmmo.TAG:
                return DropAmmo.readFrom(reader);
            case Aim.TAG:
                return Aim.readFrom(reader);
            default:
                throw new Exception("Unexpected tag value");
        }
    }
    
    /// Pick up loot
    static class Pickup : ActionOrder {
        static const int TAG = 0;
    
        /// Loot id
        int loot;
    
        this() {}
    
        this(int loot) {
            this.loot = loot;
        }
    
        /// Read Pickup from reader
        static Pickup readFrom(Stream reader) {
            int loot;
            loot = reader.readInt();
            return new Pickup(loot);
        }
    
        /// Write Pickup to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(loot);
        }
    }
    
    /// Use shield potion
    static class UseShieldPotion : ActionOrder {
        static const int TAG = 1;
    
    
        this() {}
    
        /// Read UseShieldPotion from reader
        static UseShieldPotion readFrom(Stream reader) {
            return new UseShieldPotion();
        }
    
        /// Write UseShieldPotion to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
        }
    }
    
    /// Drop shield potions on the ground
    static class DropShieldPotions : ActionOrder {
        static const int TAG = 2;
    
        /// Amount of potions
        int amount;
    
        this() {}
    
        this(int amount) {
            this.amount = amount;
        }
    
        /// Read DropShieldPotions from reader
        static DropShieldPotions readFrom(Stream reader) {
            int amount;
            amount = reader.readInt();
            return new DropShieldPotions(amount);
        }
    
        /// Write DropShieldPotions to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(amount);
        }
    }
    
    /// Drop current weapon
    static class DropWeapon : ActionOrder {
        static const int TAG = 3;
    
    
        this() {}
    
        /// Read DropWeapon from reader
        static DropWeapon readFrom(Stream reader) {
            return new DropWeapon();
        }
    
        /// Write DropWeapon to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
        }
    }
    
    /// Drop ammo
    static class DropAmmo : ActionOrder {
        static const int TAG = 4;
    
        /// Weapon type index (starting with 0)
        int weaponTypeIndex;
        /// Amount of ammo
        int amount;
    
        this() {}
    
        this(int weaponTypeIndex, int amount) {
            this.weaponTypeIndex = weaponTypeIndex;
            this.amount = amount;
        }
    
        /// Read DropAmmo from reader
        static DropAmmo readFrom(Stream reader) {
            int weaponTypeIndex;
            weaponTypeIndex = reader.readInt();
            int amount;
            amount = reader.readInt();
            return new DropAmmo(weaponTypeIndex, amount);
        }
    
        /// Write DropAmmo to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(weaponTypeIndex);
            writer.write(amount);
        }
    }
    
    /// Start/continue aiming
    static class Aim : ActionOrder {
        static const int TAG = 5;
    
        /// Shoot (only possible in full aim)
        bool shoot;
    
        this() {}
    
        this(bool shoot) {
            this.shoot = shoot;
        }
    
        /// Read Aim from reader
        static Aim readFrom(Stream reader) {
            bool shoot;
            shoot = reader.readBool();
            return new Aim(shoot);
        }
    
        /// Write Aim to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(shoot);
        }
    }
}