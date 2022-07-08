/// Order to perform an action for unit
enum ActionOrder {
    /// Pick up loot
    ///
    /// - loot: Loot id
    case pickup(loot: Int32)

    /// Use shield potion
    ///
    case useShieldPotion

    /// Drop shield potions on the ground
    ///
    /// - amount: Amount of potions
    case dropShieldPotions(amount: Int32)

    /// Drop current weapon
    ///
    case dropWeapon

    /// Drop ammo
    ///
    /// - weaponTypeIndex: Weapon type index (starting with 0)
    /// - amount: Amount of ammo
    case dropAmmo(weaponTypeIndex: Int32, amount: Int32)

    /// Start/continue aiming
    ///
    /// - shoot: Shoot (only possible in full aim)
    case aim(shoot: Bool)

    /// Read ActionOrder from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> ActionOrder {
        switch stream.readInt32() {
            case 0:
                var loot: Int32
                loot = stream.readInt32()
                return ActionOrder.pickup(loot: loot)
            case 1:
                return ActionOrder.useShieldPotion
            case 2:
                var amount: Int32
                amount = stream.readInt32()
                return ActionOrder.dropShieldPotions(amount: amount)
            case 3:
                return ActionOrder.dropWeapon
            case 4:
                var weaponTypeIndex: Int32
                weaponTypeIndex = stream.readInt32()
                var amount: Int32
                amount = stream.readInt32()
                return ActionOrder.dropAmmo(weaponTypeIndex: weaponTypeIndex, amount: amount)
            case 5:
                var shoot: Bool
                shoot = stream.readBool()
                return ActionOrder.aim(shoot: shoot)
            default:
                fatalError("Unexpected tag value")
        }
    }

    /// Write ActionOrder to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        switch self {
            case let .pickup(loot):
                stream.writeInt32(0)
                stream.writeInt32(loot)
            case .useShieldPotion:
                stream.writeInt32(1)
            case let .dropShieldPotions(amount):
                stream.writeInt32(2)
                stream.writeInt32(amount)
            case .dropWeapon:
                stream.writeInt32(3)
            case let .dropAmmo(weaponTypeIndex, amount):
                stream.writeInt32(4)
                stream.writeInt32(weaponTypeIndex)
                stream.writeInt32(amount)
            case let .aim(shoot):
                stream.writeInt32(5)
                stream.writeBool(shoot)
        }
    }
}
