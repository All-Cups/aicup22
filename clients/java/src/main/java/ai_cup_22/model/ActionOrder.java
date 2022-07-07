package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Order to perform an action for unit
 */
public abstract class ActionOrder {
    /**
     * Write ActionOrder to output stream
     */
    public abstract void writeTo(java.io.OutputStream stream) throws java.io.IOException;

    /**
     * Read ActionOrder from input stream
     */
    public static ActionOrder readFrom(java.io.InputStream stream) throws java.io.IOException {
        switch (StreamUtil.readInt(stream)) {
            case Pickup.TAG:
                return Pickup.readFrom(stream);
            case UseShieldPotion.TAG:
                return UseShieldPotion.readFrom(stream);
            case DropShieldPotions.TAG:
                return DropShieldPotions.readFrom(stream);
            case DropWeapon.TAG:
                return DropWeapon.readFrom(stream);
            case DropAmmo.TAG:
                return DropAmmo.readFrom(stream);
            case Aim.TAG:
                return Aim.readFrom(stream);
            default:
                throw new java.io.IOException("Unexpected tag value");
        }
    }

    /**
     * Pick up loot
     */
    public static class Pickup extends ActionOrder {
        public static final int TAG = 0;
    
        /**
         * Loot id
         */
        private int loot;
    
        /**
         * Loot id
         */
        public int getLoot() {
            return loot;
        }
    
        /**
         * Loot id
         */
        public void setLoot(int value) {
            this.loot = value;
        }
    
        public Pickup(int loot) {
            this.loot = loot;
        }
    
        /**
         * Read Pickup from input stream
         */
        public static Pickup readFrom(java.io.InputStream stream) throws java.io.IOException {
            int loot;
            loot = StreamUtil.readInt(stream);
            return new Pickup(loot);
        }
    
        /**
         * Write Pickup to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeInt(stream, loot);
        }
    
        /**
         * Get string representation of Pickup
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Pickup { ");
            stringBuilder.append("loot: ");
            stringBuilder.append(String.valueOf(loot));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Use shield potion
     */
    public static class UseShieldPotion extends ActionOrder {
        public static final int TAG = 1;
    
    
        public UseShieldPotion() {
        }
    
        /**
         * Read UseShieldPotion from input stream
         */
        public static UseShieldPotion readFrom(java.io.InputStream stream) throws java.io.IOException {
            return new UseShieldPotion();
        }
    
        /**
         * Write UseShieldPotion to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
        }
    
        /**
         * Get string representation of UseShieldPotion
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("UseShieldPotion { ");
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Drop shield potions on the ground
     */
    public static class DropShieldPotions extends ActionOrder {
        public static final int TAG = 2;
    
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
    
        public DropShieldPotions(int amount) {
            this.amount = amount;
        }
    
        /**
         * Read DropShieldPotions from input stream
         */
        public static DropShieldPotions readFrom(java.io.InputStream stream) throws java.io.IOException {
            int amount;
            amount = StreamUtil.readInt(stream);
            return new DropShieldPotions(amount);
        }
    
        /**
         * Write DropShieldPotions to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeInt(stream, amount);
        }
    
        /**
         * Get string representation of DropShieldPotions
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("DropShieldPotions { ");
            stringBuilder.append("amount: ");
            stringBuilder.append(String.valueOf(amount));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Drop current weapon
     */
    public static class DropWeapon extends ActionOrder {
        public static final int TAG = 3;
    
    
        public DropWeapon() {
        }
    
        /**
         * Read DropWeapon from input stream
         */
        public static DropWeapon readFrom(java.io.InputStream stream) throws java.io.IOException {
            return new DropWeapon();
        }
    
        /**
         * Write DropWeapon to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
        }
    
        /**
         * Get string representation of DropWeapon
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("DropWeapon { ");
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Drop ammo
     */
    public static class DropAmmo extends ActionOrder {
        public static final int TAG = 4;
    
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
    
        public DropAmmo(int weaponTypeIndex, int amount) {
            this.weaponTypeIndex = weaponTypeIndex;
            this.amount = amount;
        }
    
        /**
         * Read DropAmmo from input stream
         */
        public static DropAmmo readFrom(java.io.InputStream stream) throws java.io.IOException {
            int weaponTypeIndex;
            weaponTypeIndex = StreamUtil.readInt(stream);
            int amount;
            amount = StreamUtil.readInt(stream);
            return new DropAmmo(weaponTypeIndex, amount);
        }
    
        /**
         * Write DropAmmo to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeInt(stream, weaponTypeIndex);
            StreamUtil.writeInt(stream, amount);
        }
    
        /**
         * Get string representation of DropAmmo
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("DropAmmo { ");
            stringBuilder.append("weaponTypeIndex: ");
            stringBuilder.append(String.valueOf(weaponTypeIndex));
            stringBuilder.append(", ");
            stringBuilder.append("amount: ");
            stringBuilder.append(String.valueOf(amount));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Start/continue aiming
     */
    public static class Aim extends ActionOrder {
        public static final int TAG = 5;
    
        /**
         * Shoot (only possible in full aim)
         */
        private boolean shoot;
    
        /**
         * Shoot (only possible in full aim)
         */
        public boolean isShoot() {
            return shoot;
        }
    
        /**
         * Shoot (only possible in full aim)
         */
        public void setShoot(boolean value) {
            this.shoot = value;
        }
    
        public Aim(boolean shoot) {
            this.shoot = shoot;
        }
    
        /**
         * Read Aim from input stream
         */
        public static Aim readFrom(java.io.InputStream stream) throws java.io.IOException {
            boolean shoot;
            shoot = StreamUtil.readBoolean(stream);
            return new Aim(shoot);
        }
    
        /**
         * Write Aim to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeBoolean(stream, shoot);
        }
    
        /**
         * Get string representation of Aim
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Aim { ");
            stringBuilder.append("shoot: ");
            stringBuilder.append(String.valueOf(shoot));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }
}