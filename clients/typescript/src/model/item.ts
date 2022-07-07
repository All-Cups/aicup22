import { Stream } from "../stream";

/**
 * Lootable item
 */
export abstract class Item {
    /**
     * Write Item to output stream
     */
    abstract writeTo(stream: Stream): Promise<void>;

    /**
     * Read Item from input stream
     */
    static async readFrom(stream: Stream): Promise<Item> {
        const tag = await stream.readInt();
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

export namespace Item {
    /**
     * Weapon
     */
    export class Weapon extends Item {
        /**
         * Weapon type index (starting with 0)
         */
        typeIndex: number
    
        constructor(typeIndex: number) {
            super();
            this.typeIndex = typeIndex;
        }
    
        /**
         * Read Weapon from input stream
         */
        static async readFrom(stream: Stream): Promise<Item.Weapon> {
            let typeIndex;
            typeIndex = await stream.readInt();
            return new Weapon(typeIndex)
        }
    
        /**
         * Write Weapon to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(Weapon.TAG);
            let typeIndex = this.typeIndex;
            await stream.writeInt(typeIndex);
        }
    }
    
    export namespace Weapon {
        export const TAG = 0;
    }
    /**
     * Shield potions
     */
    export class ShieldPotions extends Item {
        /**
         * Amount of potions
         */
        amount: number
    
        constructor(amount: number) {
            super();
            this.amount = amount;
        }
    
        /**
         * Read ShieldPotions from input stream
         */
        static async readFrom(stream: Stream): Promise<Item.ShieldPotions> {
            let amount;
            amount = await stream.readInt();
            return new ShieldPotions(amount)
        }
    
        /**
         * Write ShieldPotions to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(ShieldPotions.TAG);
            let amount = this.amount;
            await stream.writeInt(amount);
        }
    }
    
    export namespace ShieldPotions {
        export const TAG = 1;
    }
    /**
     * Ammo
     */
    export class Ammo extends Item {
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
         * Read Ammo from input stream
         */
        static async readFrom(stream: Stream): Promise<Item.Ammo> {
            let weaponTypeIndex;
            weaponTypeIndex = await stream.readInt();
            let amount;
            amount = await stream.readInt();
            return new Ammo(weaponTypeIndex, amount)
        }
    
        /**
         * Write Ammo to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(Ammo.TAG);
            let weaponTypeIndex = this.weaponTypeIndex;
            await stream.writeInt(weaponTypeIndex);
            let amount = this.amount;
            await stream.writeInt(amount);
        }
    }
    
    export namespace Ammo {
        export const TAG = 2;
    }
}