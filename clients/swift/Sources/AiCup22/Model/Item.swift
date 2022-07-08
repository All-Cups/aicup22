/// Lootable item
enum Item {
    /// Weapon
    ///
    /// - typeIndex: Weapon type index (starting with 0)
    case weapon(typeIndex: Int32)

    /// Shield potions
    ///
    /// - amount: Amount of potions
    case shieldPotions(amount: Int32)

    /// Ammo
    ///
    /// - weaponTypeIndex: Weapon type index (starting with 0)
    /// - amount: Amount of ammo
    case ammo(weaponTypeIndex: Int32, amount: Int32)

    /// Read Item from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Item {
        switch stream.readInt32() {
            case 0:
                var typeIndex: Int32
                typeIndex = stream.readInt32()
                return Item.weapon(typeIndex: typeIndex)
            case 1:
                var amount: Int32
                amount = stream.readInt32()
                return Item.shieldPotions(amount: amount)
            case 2:
                var weaponTypeIndex: Int32
                weaponTypeIndex = stream.readInt32()
                var amount: Int32
                amount = stream.readInt32()
                return Item.ammo(weaponTypeIndex: weaponTypeIndex, amount: amount)
            default:
                fatalError("Unexpected tag value")
        }
    }

    /// Write Item to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        switch self {
            case let .weapon(typeIndex):
                stream.writeInt32(0)
                stream.writeInt32(typeIndex)
            case let .shieldPotions(amount):
                stream.writeInt32(1)
                stream.writeInt32(amount)
            case let .ammo(weaponTypeIndex, amount):
                stream.writeInt32(2)
                stream.writeInt32(weaponTypeIndex)
                stream.writeInt32(amount)
        }
    }
}
