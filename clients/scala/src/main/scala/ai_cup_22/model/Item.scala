package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Lootable item
 */
sealed trait Item {
    /**
     * Write Item to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit
}

object Item {
    /**
     * Weapon
     *
     * @param typeIndex Weapon type index (starting with 0)
     */
    case class Weapon(typeIndex: Int) extends Item {
        /**
         * Write Weapon to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Weapon.TAG)
            StreamUtil.writeInt(stream, typeIndex)
        }
    
        /**
         * Get string representation of Weapon
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Weapon { ")
            stringBuilder.append("typeIndex: ")
            stringBuilder.append(typeIndex)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Weapon {
        val TAG: Int = 0
    
        /**
         * Read Weapon from input stream
         */
        def readFrom(stream: java.io.InputStream): Weapon = Weapon(
            StreamUtil.readInt(stream)
        )
    }

    /**
     * Shield potions
     *
     * @param amount Amount of potions
     */
    case class ShieldPotions(amount: Int) extends Item {
        /**
         * Write ShieldPotions to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, ShieldPotions.TAG)
            StreamUtil.writeInt(stream, amount)
        }
    
        /**
         * Get string representation of ShieldPotions
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("ShieldPotions { ")
            stringBuilder.append("amount: ")
            stringBuilder.append(amount)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object ShieldPotions {
        val TAG: Int = 1
    
        /**
         * Read ShieldPotions from input stream
         */
        def readFrom(stream: java.io.InputStream): ShieldPotions = ShieldPotions(
            StreamUtil.readInt(stream)
        )
    }

    /**
     * Ammo
     *
     * @param weaponTypeIndex Weapon type index (starting with 0)
     * @param amount Amount of ammo
     */
    case class Ammo(weaponTypeIndex: Int, amount: Int) extends Item {
        /**
         * Write Ammo to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Ammo.TAG)
            StreamUtil.writeInt(stream, weaponTypeIndex)
            StreamUtil.writeInt(stream, amount)
        }
    
        /**
         * Get string representation of Ammo
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Ammo { ")
            stringBuilder.append("weaponTypeIndex: ")
            stringBuilder.append(weaponTypeIndex)
            stringBuilder.append(", ")
            stringBuilder.append("amount: ")
            stringBuilder.append(amount)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Ammo {
        val TAG: Int = 2
    
        /**
         * Read Ammo from input stream
         */
        def readFrom(stream: java.io.InputStream): Ammo = Ammo(
            StreamUtil.readInt(stream),
            StreamUtil.readInt(stream)
        )
    }

    /**
     * Read Item from input stream
     */
    def readFrom(stream: java.io.InputStream): Item = {
        StreamUtil.readInt(stream) match {
            case Weapon.TAG => Weapon.readFrom(stream)
            case ShieldPotions.TAG => ShieldPotions.readFrom(stream)
            case Ammo.TAG => Ammo.readFrom(stream)
            case _ => throw new java.io.IOException("Unexpected tag value")
        }
    }
}