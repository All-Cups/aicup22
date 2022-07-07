package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Order to perform an action for unit
 */
sealed trait ActionOrder {
    /**
     * Write ActionOrder to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit
}

object ActionOrder {
    /**
     * Pick up loot
     *
     * @param loot Loot id
     */
    case class Pickup(loot: Int) extends ActionOrder {
        /**
         * Write Pickup to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Pickup.TAG)
            StreamUtil.writeInt(stream, loot)
        }
    
        /**
         * Get string representation of Pickup
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Pickup { ")
            stringBuilder.append("loot: ")
            stringBuilder.append(loot)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Pickup {
        val TAG: Int = 0
    
        /**
         * Read Pickup from input stream
         */
        def readFrom(stream: java.io.InputStream): Pickup = Pickup(
            StreamUtil.readInt(stream)
        )
    }

    /**
     * Use shield potion
     */
    case class UseShieldPotion() extends ActionOrder {
        /**
         * Write UseShieldPotion to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, UseShieldPotion.TAG)
        }
    
        /**
         * Get string representation of UseShieldPotion
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("UseShieldPotion { ")
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object UseShieldPotion {
        val TAG: Int = 1
    
        /**
         * Read UseShieldPotion from input stream
         */
        def readFrom(stream: java.io.InputStream): UseShieldPotion = UseShieldPotion(
        )
    }

    /**
     * Drop shield potions on the ground
     *
     * @param amount Amount of potions
     */
    case class DropShieldPotions(amount: Int) extends ActionOrder {
        /**
         * Write DropShieldPotions to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, DropShieldPotions.TAG)
            StreamUtil.writeInt(stream, amount)
        }
    
        /**
         * Get string representation of DropShieldPotions
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("DropShieldPotions { ")
            stringBuilder.append("amount: ")
            stringBuilder.append(amount)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object DropShieldPotions {
        val TAG: Int = 2
    
        /**
         * Read DropShieldPotions from input stream
         */
        def readFrom(stream: java.io.InputStream): DropShieldPotions = DropShieldPotions(
            StreamUtil.readInt(stream)
        )
    }

    /**
     * Drop current weapon
     */
    case class DropWeapon() extends ActionOrder {
        /**
         * Write DropWeapon to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, DropWeapon.TAG)
        }
    
        /**
         * Get string representation of DropWeapon
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("DropWeapon { ")
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object DropWeapon {
        val TAG: Int = 3
    
        /**
         * Read DropWeapon from input stream
         */
        def readFrom(stream: java.io.InputStream): DropWeapon = DropWeapon(
        )
    }

    /**
     * Drop ammo
     *
     * @param weaponTypeIndex Weapon type index (starting with 0)
     * @param amount Amount of ammo
     */
    case class DropAmmo(weaponTypeIndex: Int, amount: Int) extends ActionOrder {
        /**
         * Write DropAmmo to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, DropAmmo.TAG)
            StreamUtil.writeInt(stream, weaponTypeIndex)
            StreamUtil.writeInt(stream, amount)
        }
    
        /**
         * Get string representation of DropAmmo
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("DropAmmo { ")
            stringBuilder.append("weaponTypeIndex: ")
            stringBuilder.append(weaponTypeIndex)
            stringBuilder.append(", ")
            stringBuilder.append("amount: ")
            stringBuilder.append(amount)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object DropAmmo {
        val TAG: Int = 4
    
        /**
         * Read DropAmmo from input stream
         */
        def readFrom(stream: java.io.InputStream): DropAmmo = DropAmmo(
            StreamUtil.readInt(stream),
            StreamUtil.readInt(stream)
        )
    }

    /**
     * Start/continue aiming
     *
     * @param shoot Shoot (only possible in full aim)
     */
    case class Aim(shoot: Boolean) extends ActionOrder {
        /**
         * Write Aim to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Aim.TAG)
            StreamUtil.writeBoolean(stream, shoot)
        }
    
        /**
         * Get string representation of Aim
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Aim { ")
            stringBuilder.append("shoot: ")
            stringBuilder.append(shoot)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Aim {
        val TAG: Int = 5
    
        /**
         * Read Aim from input stream
         */
        def readFrom(stream: java.io.InputStream): Aim = Aim(
            StreamUtil.readBoolean(stream)
        )
    }

    /**
     * Read ActionOrder from input stream
     */
    def readFrom(stream: java.io.InputStream): ActionOrder = {
        StreamUtil.readInt(stream) match {
            case Pickup.TAG => Pickup.readFrom(stream)
            case UseShieldPotion.TAG => UseShieldPotion.readFrom(stream)
            case DropShieldPotions.TAG => DropShieldPotions.readFrom(stream)
            case DropWeapon.TAG => DropWeapon.readFrom(stream)
            case DropAmmo.TAG => DropAmmo.readFrom(stream)
            case Aim.TAG => Aim.readFrom(stream)
            case _ => throw new java.io.IOException("Unexpected tag value")
        }
    }
}