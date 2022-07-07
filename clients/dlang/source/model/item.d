module model.item;

import stream;
import std.conv;
import std.typecons : Nullable;


/// Lootable item
abstract class Item {
    /// Write Item to writer
    abstract void writeTo(Stream writer) const;

    /// Read Item from reader
    static Item readFrom(Stream reader) {
        switch (reader.readInt()) {
            case Weapon.TAG:
                return Weapon.readFrom(reader);
            case ShieldPotions.TAG:
                return ShieldPotions.readFrom(reader);
            case Ammo.TAG:
                return Ammo.readFrom(reader);
            default:
                throw new Exception("Unexpected tag value");
        }
    }
    
    /// Weapon
    static class Weapon : Item {
        static const int TAG = 0;
    
        /// Weapon type index (starting with 0)
        int typeIndex;
    
        this() {}
    
        this(int typeIndex) {
            this.typeIndex = typeIndex;
        }
    
        /// Read Weapon from reader
        static Weapon readFrom(Stream reader) {
            int typeIndex;
            typeIndex = reader.readInt();
            return new Weapon(typeIndex);
        }
    
        /// Write Weapon to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(typeIndex);
        }
    }
    
    /// Shield potions
    static class ShieldPotions : Item {
        static const int TAG = 1;
    
        /// Amount of potions
        int amount;
    
        this() {}
    
        this(int amount) {
            this.amount = amount;
        }
    
        /// Read ShieldPotions from reader
        static ShieldPotions readFrom(Stream reader) {
            int amount;
            amount = reader.readInt();
            return new ShieldPotions(amount);
        }
    
        /// Write ShieldPotions to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(amount);
        }
    }
    
    /// Ammo
    static class Ammo : Item {
        static const int TAG = 2;
    
        /// Weapon type index (starting with 0)
        int weaponTypeIndex;
        /// Amount of ammo
        int amount;
    
        this() {}
    
        this(int weaponTypeIndex, int amount) {
            this.weaponTypeIndex = weaponTypeIndex;
            this.amount = amount;
        }
    
        /// Read Ammo from reader
        static Ammo readFrom(Stream reader) {
            int weaponTypeIndex;
            weaponTypeIndex = reader.readInt();
            int amount;
            amount = reader.readInt();
            return new Ammo(weaponTypeIndex, amount);
        }
    
        /// Write Ammo to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(weaponTypeIndex);
            writer.write(amount);
        }
    }
}