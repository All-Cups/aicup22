package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Order to perform an action for unit
 */
abstract class ActionOrder {
    /**
     * Write ActionOrder to output stream
     */
    @Throws(java.io.IOException::class)
    abstract fun writeTo(stream: java.io.OutputStream)

    companion object {
        /**
         * Read ActionOrder from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): ActionOrder {
            when (StreamUtil.readInt(stream)) {
                Pickup.TAG -> return Pickup.readFrom(stream)
                UseShieldPotion.TAG -> return UseShieldPotion.readFrom(stream)
                DropShieldPotions.TAG -> return DropShieldPotions.readFrom(stream)
                DropWeapon.TAG -> return DropWeapon.readFrom(stream)
                DropAmmo.TAG -> return DropAmmo.readFrom(stream)
                Aim.TAG -> return Aim.readFrom(stream)
                else -> throw java.io.IOException("Unexpected tag value")
            }
        }
    }

    /**
     * Pick up loot
     */
    class Pickup : ActionOrder {
        /**
         * Loot id
         */
        var loot: Int
    
        constructor(loot: Int) {
            this.loot = loot
        }
    
        /**
         * Write Pickup to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeInt(stream, loot)
        }
    
        /**
         * Get string representation of Pickup
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Pickup { ")
            stringBuilder.append("loot: ")
            stringBuilder.append(loot)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 0
    
            /**
             * Read Pickup from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Pickup {
                var loot: Int
                loot = StreamUtil.readInt(stream)
                return Pickup(loot)
            }
        }
    }

    /**
     * Use shield potion
     */
    class UseShieldPotion : ActionOrder {
    
        constructor() {
        }
    
        /**
         * Write UseShieldPotion to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
        }
    
        /**
         * Get string representation of UseShieldPotion
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("UseShieldPotion { ")
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 1
    
            /**
             * Read UseShieldPotion from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): UseShieldPotion {
                return UseShieldPotion()
            }
        }
    }

    /**
     * Drop shield potions on the ground
     */
    class DropShieldPotions : ActionOrder {
        /**
         * Amount of potions
         */
        var amount: Int
    
        constructor(amount: Int) {
            this.amount = amount
        }
    
        /**
         * Write DropShieldPotions to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeInt(stream, amount)
        }
    
        /**
         * Get string representation of DropShieldPotions
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("DropShieldPotions { ")
            stringBuilder.append("amount: ")
            stringBuilder.append(amount)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 2
    
            /**
             * Read DropShieldPotions from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): DropShieldPotions {
                var amount: Int
                amount = StreamUtil.readInt(stream)
                return DropShieldPotions(amount)
            }
        }
    }

    /**
     * Drop current weapon
     */
    class DropWeapon : ActionOrder {
    
        constructor() {
        }
    
        /**
         * Write DropWeapon to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
        }
    
        /**
         * Get string representation of DropWeapon
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("DropWeapon { ")
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 3
    
            /**
             * Read DropWeapon from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): DropWeapon {
                return DropWeapon()
            }
        }
    }

    /**
     * Drop ammo
     */
    class DropAmmo : ActionOrder {
        /**
         * Weapon type index (starting with 0)
         */
        var weaponTypeIndex: Int
        /**
         * Amount of ammo
         */
        var amount: Int
    
        constructor(weaponTypeIndex: Int, amount: Int) {
            this.weaponTypeIndex = weaponTypeIndex
            this.amount = amount
        }
    
        /**
         * Write DropAmmo to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeInt(stream, weaponTypeIndex)
            StreamUtil.writeInt(stream, amount)
        }
    
        /**
         * Get string representation of DropAmmo
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("DropAmmo { ")
            stringBuilder.append("weaponTypeIndex: ")
            stringBuilder.append(weaponTypeIndex)
            stringBuilder.append(", ")
            stringBuilder.append("amount: ")
            stringBuilder.append(amount)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 4
    
            /**
             * Read DropAmmo from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): DropAmmo {
                var weaponTypeIndex: Int
                weaponTypeIndex = StreamUtil.readInt(stream)
                var amount: Int
                amount = StreamUtil.readInt(stream)
                return DropAmmo(weaponTypeIndex, amount)
            }
        }
    }

    /**
     * Start/continue aiming
     */
    class Aim : ActionOrder {
        /**
         * Shoot (only possible in full aim)
         */
        var shoot: Boolean
    
        constructor(shoot: Boolean) {
            this.shoot = shoot
        }
    
        /**
         * Write Aim to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeBoolean(stream, shoot)
        }
    
        /**
         * Get string representation of Aim
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Aim { ")
            stringBuilder.append("shoot: ")
            stringBuilder.append(shoot)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 5
    
            /**
             * Read Aim from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Aim {
                var shoot: Boolean
                shoot = StreamUtil.readBoolean(stream)
                return Aim(shoot)
            }
        }
    }
}