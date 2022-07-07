package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Loot lying on the ground
 */
public class Loot {
    /**
     * Unique id
     */
    private int id;

    /**
     * Unique id
     */
    public int getId() {
        return id;
    }

    /**
     * Unique id
     */
    public void setId(int value) {
        this.id = value;
    }
    /**
     * Position
     */
    private ai_cup_22.model.Vec2 position;

    /**
     * Position
     */
    public ai_cup_22.model.Vec2 getPosition() {
        return position;
    }

    /**
     * Position
     */
    public void setPosition(ai_cup_22.model.Vec2 value) {
        this.position = value;
    }
    /**
     * Item
     */
    private ai_cup_22.model.Item item;

    /**
     * Item
     */
    public ai_cup_22.model.Item getItem() {
        return item;
    }

    /**
     * Item
     */
    public void setItem(ai_cup_22.model.Item value) {
        this.item = value;
    }

    public Loot(int id, ai_cup_22.model.Vec2 position, ai_cup_22.model.Item item) {
        this.id = id;
        this.position = position;
        this.item = item;
    }

    /**
     * Read Loot from input stream
     */
    public static Loot readFrom(java.io.InputStream stream) throws java.io.IOException {
        int id;
        id = StreamUtil.readInt(stream);
        ai_cup_22.model.Vec2 position;
        position = ai_cup_22.model.Vec2.readFrom(stream);
        ai_cup_22.model.Item item;
        item = ai_cup_22.model.Item.readFrom(stream);
        return new Loot(id, position, item);
    }

    /**
     * Write Loot to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeInt(stream, id);
        position.writeTo(stream);
        item.writeTo(stream);
    }

    /**
     * Get string representation of Loot
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Loot { ");
        stringBuilder.append("id: ");
        stringBuilder.append(String.valueOf(id));
        stringBuilder.append(", ");
        stringBuilder.append("position: ");
        stringBuilder.append(String.valueOf(position));
        stringBuilder.append(", ");
        stringBuilder.append("item: ");
        stringBuilder.append(String.valueOf(item));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}