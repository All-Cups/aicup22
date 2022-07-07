import { Item } from "./item";
import { Vec2 } from "./vec2";
import { Stream } from "../stream";

/**
 * Loot lying on the ground
 */
export class Loot {
    /**
     * Unique id
     */
    id: number
    /**
     * Position
     */
    position: Vec2
    /**
     * Item
     */
    item: Item

    constructor(id: number, position: Vec2, item: Item) {
        this.id = id;
        this.position = position;
        this.item = item;
    }

    /**
     * Read Loot from input stream
     */
    static async readFrom(stream: Stream): Promise<Loot> {
        let id;
        id = await stream.readInt();
        let position;
        position = await Vec2.readFrom(stream);
        let item;
        item = await Item.readFrom(stream);
        return new Loot(id, position, item)
    }

    /**
     * Write Loot to output stream
     */
    async writeTo(stream: Stream) {
        let id = this.id;
        await stream.writeInt(id);
        let position = this.position;
        await position.writeTo(stream);
        let item = this.item;
        await item.writeTo(stream);
    }
}