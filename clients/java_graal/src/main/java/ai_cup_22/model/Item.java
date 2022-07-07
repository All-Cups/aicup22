package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Lootable item
 */
public abstract class Item {
    /**
     * Write Item to output stream
     */
    public abstract void writeTo(java.io.OutputStream stream) throws java.io.IOException;

    /**
     * Read Item from input stream
     */
    public static Item readFrom(java.io.InputStream stream) throws java.io.IOException {
        switch (StreamUtil.readInt(stream)) {
            case Weapon.TAG:
                return Weapon.readFrom(stream);
            case ShieldPotions.TAG:
                return ShieldPotions.readFrom(stream);
            case Ammo.TAG:
                return Ammo.readFrom(stream);
            default:
                throw new java.io.IOException("Unexpected tag value");
        }
    }

    /**
     * Weapon
     */
    public static class Weapon extends Item {
        public static final int TAG = 0;
    
        /**
         * Weapon type index (starting with 0)
         */
        private int typeIndex;
    
        /**
         * Weapon type index (starting with 0)
         */
        public int getTypeIndex() {
            return typeIndex;
        }
    
        /**
         * Weapon type index (starting with 0)
         */
        public void setTypeIndex(int value) {
            this.typeIndex = value;
        }
    
        public Weapon(int typeIndex) {
            this.typeIndex = typeIndex;
        }
    
        /**
         * Read Weapon from input stream
         */
        public static Weapon readFrom(java.io.InputStream stream) throws java.io.IOException {
            int typeIndex;
            typeIndex = StreamUtil.readInt(stream);
            return new Weapon(typeIndex);
        }
    
        /**
         * Write Weapon to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeInt(stream, typeIndex);
        }
    
        /**
         * Get string representation of Weapon
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Weapon { ");
            stringBuilder.append("typeIndex: ");
            stringBuilder.append(String.valueOf(typeIndex));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Shield potions
     */
    public static class ShieldPotions extends Item {
        public static final int TAG = 1;
    
        /**
         * Amount of potions
         */
        private int amount;
    
        /**
         * Amount of potions
         */
        public int getAmount() {
            return amount;
        }
    
        /**
         * Amount of potions
         */
        public void setAmount(int value) {
            this.amount = value;
        }
    
        public ShieldPotions(int amount) {
            this.amount = amount;
        }
    
        /**
         * Read ShieldPotions from input stream
         */
        public static ShieldPotions readFrom(java.io.InputStream stream) throws java.io.IOException {
            int amount;
            amount = StreamUtil.readInt(stream);
            return new ShieldPotions(amount);
        }
    
        /**
         * Write ShieldPotions to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeInt(stream, amount);
        }
    
        /**
         * Get string representation of ShieldPotions
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("ShieldPotions { ");
            stringBuilder.append("amount: ");
            stringBuilder.append(String.valueOf(amount));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Ammo
     */
    public static class Ammo extends Item {
        public static final int TAG = 2;
    
        /**
         * Weapon type index (starting with 0)
         */
        private int weaponTypeIndex;
    
        /**
         * Weapon type index (starting with 0)
         */
        public int getWeaponTypeIndex() {
            return weaponTypeIndex;
        }
    
        /**
         * Weapon type index (starting with 0)
         */
        public void setWeaponTypeIndex(int value) {
            this.weaponTypeIndex = value;
        }
        /**
         * Amount of ammo
         */
        private int amount;
    
        /**
         * Amount of ammo
         */
        public int getAmount() {
            return amount;
        }
    
        /**
         * Amount of ammo
         */
        public void setAmount(int value) {
            this.amount = value;
        }
    
        public Ammo(int weaponTypeIndex, int amount) {
            this.weaponTypeIndex = weaponTypeIndex;
            this.amount = amount;
        }
    
        /**
         * Read Ammo from input stream
         */
        public static Ammo readFrom(java.io.InputStream stream) throws java.io.IOException {
            int weaponTypeIndex;
            weaponTypeIndex = StreamUtil.readInt(stream);
            int amount;
            amount = StreamUtil.readInt(stream);
            return new Ammo(weaponTypeIndex, amount);
        }
    
        /**
         * Write Ammo to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeInt(stream, weaponTypeIndex);
            StreamUtil.writeInt(stream, amount);
        }
    
        /**
         * Get string representation of Ammo
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Ammo { ");
            stringBuilder.append("weaponTypeIndex: ");
            stringBuilder.append(String.valueOf(weaponTypeIndex));
            stringBuilder.append(", ");
            stringBuilder.append("amount: ");
            stringBuilder.append(String.valueOf(amount));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }
}