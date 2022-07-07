/**
 * Lootable item
 */
class Item {
    /**
     * Read Item from input stream
     */
    static async readFrom(stream) {
        let tag = await stream.readInt();
        if (tag == Item.Weapon.TAG) {
            return await Item.Weapon.readFrom(stream);
        }
        if (tag == Item.ShieldPotions.TAG) {
            return await Item.ShieldPotions.readFrom(stream);
        }
        if (tag == Item.Ammo.TAG) {
            return await Item.Ammo.readFrom(stream);
        }
        throw new Error("Unexpected tag value");
    }
}
/**
 * Weapon
 */
class Weapon extends Item {
    /**
     * Weapon type index (starting with 0)
     */
    typeIndex;

    constructor(typeIndex) {
        super();
        this.typeIndex = typeIndex;
    }

    /**
     * Read Weapon from input stream
     */
    static async readFrom(stream) {
        let typeIndex;
        typeIndex = await stream.readInt();
        return new Weapon(typeIndex);
    }

    /**
     * Write Weapon to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Weapon.TAG);
        let typeIndex = this.typeIndex;
        await stream.writeInt(typeIndex);
    }
}

Weapon.TAG = 0;
Item.Weapon = Weapon;
/**
 * Shield potions
 */
class ShieldPotions extends Item {
    /**
     * Amount of potions
     */
    amount;

    constructor(amount) {
        super();
        this.amount = amount;
    }

    /**
     * Read ShieldPotions from input stream
     */
    static async readFrom(stream) {
        let amount;
        amount = await stream.readInt();
        return new ShieldPotions(amount);
    }

    /**
     * Write ShieldPotions to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(ShieldPotions.TAG);
        let amount = this.amount;
        await stream.writeInt(amount);
    }
}

ShieldPotions.TAG = 1;
Item.ShieldPotions = ShieldPotions;
/**
 * Ammo
 */
class Ammo extends Item {
    /**
     * Weapon type index (starting with 0)
     */
    weaponTypeIndex;
    /**
     * Amount of ammo
     */
    amount;

    constructor(weaponTypeIndex, amount) {
        super();
        this.weaponTypeIndex = weaponTypeIndex;
        this.amount = amount;
    }

    /**
     * Read Ammo from input stream
     */
    static async readFrom(stream) {
        let weaponTypeIndex;
        weaponTypeIndex = await stream.readInt();
        let amount;
        amount = await stream.readInt();
        return new Ammo(weaponTypeIndex, amount);
    }

    /**
     * Write Ammo to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Ammo.TAG);
        let weaponTypeIndex = this.weaponTypeIndex;
        await stream.writeInt(weaponTypeIndex);
        let amount = this.amount;
        await stream.writeInt(amount);
    }
}

Ammo.TAG = 2;
Item.Ammo = Ammo;
module.exports = Item;