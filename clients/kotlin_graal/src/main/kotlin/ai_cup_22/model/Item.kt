package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Lootable item
 */
abstract class Item {
    /**
     * Write Item to output stream
     */
    @Throws(java.io.IOException::class)
    abstract fun writeTo(stream: java.io.OutputStream)

    companion object {
        /**
         * Read Item from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Item {
            when (StreamUtil.readInt(stream)) {
                Weapon.TAG -> return Weapon.readFrom(stream)
                ShieldPotions.TAG -> return ShieldPotions.readFrom(stream)
                Ammo.TAG -> return Ammo.readFrom(stream)
                else -> throw java.io.IOException("Unexpected tag value")
            }
        }
    }

    /**
     * Weapon
     */
    class Weapon : Item {
        /**
         * Weapon type index (starting with 0)
         */
        var typeIndex: Int
    
        constructor(typeIndex: Int) {
            this.typeIndex = typeIndex
        }
    
        /**
         * Write Weapon to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeInt(stream, typeIndex)
        }
    
        /**
         * Get string representation of Weapon
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Weapon { ")
            stringBuilder.append("typeIndex: ")
            stringBuilder.append(typeIndex)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 0
    
            /**
             * Read Weapon from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Weapon {
                var typeIndex: Int
                typeIndex = StreamUtil.readInt(stream)
                return Weapon(typeIndex)
            }
        }
    }

    /**
     * Shield potions
     */
    class ShieldPotions : Item {
        /**
         * Amount of potions
         */
        var amount: Int
    
        constructor(amount: Int) {
            this.amount = amount
        }
    
        /**
         * Write ShieldPotions to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeInt(stream, amount)
        }
    
        /**
         * Get string representation of ShieldPotions
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("ShieldPotions { ")
            stringBuilder.append("amount: ")
            stringBuilder.append(amount)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 1
    
            /**
             * Read ShieldPotions from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): ShieldPotions {
                var amount: Int
                amount = StreamUtil.readInt(stream)
                return ShieldPotions(amount)
            }
        }
    }

    /**
     * Ammo
     */
    class Ammo : Item {
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
         * Write Ammo to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeInt(stream, weaponTypeIndex)
            StreamUtil.writeInt(stream, amount)
        }
    
        /**
         * Get string representation of Ammo
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Ammo { ")
            stringBuilder.append("weaponTypeIndex: ")
            stringBuilder.append(weaponTypeIndex)
            stringBuilder.append(", ")
            stringBuilder.append("amount: ")
            stringBuilder.append(amount)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 2
    
            /**
             * Read Ammo from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Ammo {
                var weaponTypeIndex: Int
                weaponTypeIndex = StreamUtil.readInt(stream)
                var amount: Int
                amount = StreamUtil.readInt(stream)
                return Ammo(weaponTypeIndex, amount)
            }
        }
    }
}