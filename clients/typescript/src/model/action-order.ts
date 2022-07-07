import { Stream } from "../stream";

/**
 * Order to perform an action for unit
 */
export abstract class ActionOrder {
    /**
     * Write ActionOrder to output stream
     */
    abstract writeTo(stream: Stream): Promise<void>;

    /**
     * Read ActionOrder from input stream
     */
    static async readFrom(stream: Stream): Promise<ActionOrder> {
        const tag = await stream.readInt();
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

export namespace ActionOrder {
    /**
     * Pick up loot
     */
    export class Pickup extends ActionOrder {
        /**
         * Loot id
         */
        loot: number
    
        constructor(loot: number) {
            super();
            this.loot = loot;
        }
    
        /**
         * Read Pickup from input stream
         */
        static async readFrom(stream: Stream): Promise<ActionOrder.Pickup> {
            let loot;
            loot = await stream.readInt();
            return new Pickup(loot)
        }
    
        /**
         * Write Pickup to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(Pickup.TAG);
            let loot = this.loot;
            await stream.writeInt(loot);
        }
    }
    
    export namespace Pickup {
        export const TAG = 0;
    }
    /**
     * Use shield potion
     */
    export class UseShieldPotion extends ActionOrder {
    
        constructor() {
            super();
        }
    
        /**
         * Read UseShieldPotion from input stream
         */
        static async readFrom(stream: Stream): Promise<ActionOrder.UseShieldPotion> {
            return new UseShieldPotion()
        }
    
        /**
         * Write UseShieldPotion to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(UseShieldPotion.TAG);
        }
    }
    
    export namespace UseShieldPotion {
        export const TAG = 1;
    }
    /**
     * Drop shield potions on the ground
     */
    export class DropShieldPotions extends ActionOrder {
        /**
         * Amount of potions
         */
        amount: number
    
        constructor(amount: number) {
            super();
            this.amount = amount;
        }
    
        /**
         * Read DropShieldPotions from input stream
         */
        static async readFrom(stream: Stream): Promise<ActionOrder.DropShieldPotions> {
            let amount;
            amount = await stream.readInt();
            return new DropShieldPotions(amount)
        }
    
        /**
         * Write DropShieldPotions to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(DropShieldPotions.TAG);
            let amount = this.amount;
            await stream.writeInt(amount);
        }
    }
    
    export namespace DropShieldPotions {
        export const TAG = 2;
    }
    /**
     * Drop current weapon
     */
    export class DropWeapon extends ActionOrder {
    
        constructor() {
            super();
        }
    
        /**
         * Read DropWeapon from input stream
         */
        static async readFrom(stream: Stream): Promise<ActionOrder.DropWeapon> {
            return new DropWeapon()
        }
    
        /**
         * Write DropWeapon to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(DropWeapon.TAG);
        }
    }
    
    export namespace DropWeapon {
        export const TAG = 3;
    }
    /**
     * Drop ammo
     */
    export class DropAmmo extends ActionOrder {
        /**
         * Weapon type index (starting with 0)
         */
        weaponTypeIndex: number
        /**
         * Amount of ammo
         */
        amount: number
    
        constructor(weaponTypeIndex: number, amount: number) {
            super();
            this.weaponTypeIndex = weaponTypeIndex;
            this.amount = amount;
        }
    
        /**
         * Read DropAmmo from input stream
         */
        static async readFrom(stream: Stream): Promise<ActionOrder.DropAmmo> {
            let weaponTypeIndex;
            weaponTypeIndex = await stream.readInt();
            let amount;
            amount = await stream.readInt();
            return new DropAmmo(weaponTypeIndex, amount)
        }
    
        /**
         * Write DropAmmo to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(DropAmmo.TAG);
            let weaponTypeIndex = this.weaponTypeIndex;
            await stream.writeInt(weaponTypeIndex);
            let amount = this.amount;
            await stream.writeInt(amount);
        }
    }
    
    export namespace DropAmmo {
        export const TAG = 4;
    }
    /**
     * Start/continue aiming
     */
    export class Aim extends ActionOrder {
        /**
         * Shoot (only possible in full aim)
         */
        shoot: boolean
    
        constructor(shoot: boolean) {
            super();
            this.shoot = shoot;
        }
    
        /**
         * Read Aim from input stream
         */
        static async readFrom(stream: Stream): Promise<ActionOrder.Aim> {
            let shoot;
            shoot = await stream.readBool();
            return new Aim(shoot)
        }
    
        /**
         * Write Aim to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(Aim.TAG);
            let shoot = this.shoot;
            await stream.writeBool(shoot);
        }
    }
    
    export namespace Aim {
        export const TAG = 5;
    }
}