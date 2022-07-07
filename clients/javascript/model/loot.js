const Item = require.main.require('./model/item');
const Vec2 = require.main.require('./model/vec2');
/**
 * Loot lying on the ground
 */
class Loot {
    /**
     * Unique id
     */
    id;
    /**
     * Position
     */
    position;
    /**
     * Item
     */
    item;

    constructor(id, position, item) {
        this.id = id;
        this.position = position;
        this.item = item;
    }

    /**
     * Read Loot from input stream
     */
    static async readFrom(stream) {
        let id;
        id = await stream.readInt();
        let position;
        position = await Vec2.readFrom(stream);
        let item;
        item = await Item.readFrom(stream);
        return new Loot(id, position, item);
    }

    /**
     * Write Loot to output stream
     */
    async writeTo(stream) {
        let id = this.id;
        await stream.writeInt(id);
        let position = this.position;
        await position.writeTo(stream);
        let item = this.item;
        await item.writeTo(stream);
    }
}
module.exports = Loot