/**
 * Order to perform an action for unit
 */
class ActionOrder {
    /**
     * Read ActionOrder from input stream
     */
    static async readFrom(stream) {
        let tag = await stream.readInt();
        if (tag == ActionOrder.Pickup.TAG) {
            return await ActionOrder.Pickup.readFrom(stream);
        }
        if (tag == ActionOrder.UseShieldPotion.TAG) {
            return await ActionOrder.UseShieldPotion.readFrom(stream);
        }
        if (tag == ActionOrder.DropShieldPotions.TAG) {
            return await ActionOrder.DropShieldPotions.readFrom(stream);
        }
        if (tag == ActionOrder.DropWeapon.TAG) {
            return await ActionOrder.DropWeapon.readFrom(stream);
        }
        if (tag == ActionOrder.DropAmmo.TAG) {
            return await ActionOrder.DropAmmo.readFrom(stream);
        }
        if (tag == ActionOrder.Aim.TAG) {
            return await ActionOrder.Aim.readFrom(stream);
        }
        throw new Error("Unexpected tag value");
    }
}
/**
 * Pick up loot
 */
class Pickup extends ActionOrder {
    /**
     * Loot id
     */
    loot;

    constructor(loot) {
        super();
        this.loot = loot;
    }

    /**
     * Read Pickup from input stream
     */
    static async readFrom(stream) {
        let loot;
        loot = await stream.readInt();
        return new Pickup(loot);
    }

    /**
     * Write Pickup to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Pickup.TAG);
        let loot = this.loot;
        await stream.writeInt(loot);
    }
}

Pickup.TAG = 0;
ActionOrder.Pickup = Pickup;
/**
 * Use shield potion
 */
class UseShieldPotion extends ActionOrder {

    constructor() {
        super();
    }

    /**
     * Read UseShieldPotion from input stream
     */
    static async readFrom(stream) {
        return new UseShieldPotion();
    }

    /**
     * Write UseShieldPotion to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(UseShieldPotion.TAG);
    }
}

UseShieldPotion.TAG = 1;
ActionOrder.UseShieldPotion = UseShieldPotion;
/**
 * Drop shield potions on the ground
 */
class DropShieldPotions extends ActionOrder {
    /**
     * Amount of potions
     */
    amount;

    constructor(amount) {
        super();
        this.amount = amount;
    }

    /**
     * Read DropShieldPotions from input stream
     */
    static async readFrom(stream) {
        let amount;
        amount = await stream.readInt();
        return new DropShieldPotions(amount);
    }

    /**
     * Write DropShieldPotions to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(DropShieldPotions.TAG);
        let amount = this.amount;
        await stream.writeInt(amount);
    }
}

DropShieldPotions.TAG = 2;
ActionOrder.DropShieldPotions = DropShieldPotions;
/**
 * Drop current weapon
 */
class DropWeapon extends ActionOrder {

    constructor() {
        super();
    }

    /**
     * Read DropWeapon from input stream
     */
    static async readFrom(stream) {
        return new DropWeapon();
    }

    /**
     * Write DropWeapon to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(DropWeapon.TAG);
    }
}

DropWeapon.TAG = 3;
ActionOrder.DropWeapon = DropWeapon;
/**
 * Drop ammo
 */
class DropAmmo extends ActionOrder {
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
     * Read DropAmmo from input stream
     */
    static async readFrom(stream) {
        let weaponTypeIndex;
        weaponTypeIndex = await stream.readInt();
        let amount;
        amount = await stream.readInt();
        return new DropAmmo(weaponTypeIndex, amount);
    }

    /**
     * Write DropAmmo to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(DropAmmo.TAG);
        let weaponTypeIndex = this.weaponTypeIndex;
        await stream.writeInt(weaponTypeIndex);
        let amount = this.amount;
        await stream.writeInt(amount);
    }
}

DropAmmo.TAG = 4;
ActionOrder.DropAmmo = DropAmmo;
/**
 * Start/continue aiming
 */
class Aim extends ActionOrder {
    /**
     * Shoot (only possible in full aim)
     */
    shoot;

    constructor(shoot) {
        super();
        this.shoot = shoot;
    }

    /**
     * Read Aim from input stream
     */
    static async readFrom(stream) {
        let shoot;
        shoot = await stream.readBool();
        return new Aim(shoot);
    }

    /**
     * Write Aim to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Aim.TAG);
        let shoot = this.shoot;
        await stream.writeBool(shoot);
    }
}

Aim.TAG = 5;
ActionOrder.Aim = Aim;
module.exports = ActionOrder;