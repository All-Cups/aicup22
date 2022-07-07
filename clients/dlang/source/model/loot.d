module model.loot;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.item;
import model.vec2;

/// Loot lying on the ground
struct Loot {
    /// Unique id
    int id;
    /// Position
    model.Vec2 position;
    /// Item
    model.Item item;

    this(int id, model.Vec2 position, model.Item item) {
        this.id = id;
        this.position = position;
        this.item = item;
    }

    /// Read Loot from reader
    static Loot readFrom(Stream reader) {
        int id;
        id = reader.readInt();
        model.Vec2 position;
        position = model.Vec2.readFrom(reader);
        model.Item item;
        item = model.Item.readFrom(reader);
        return Loot(id, position, item);
    }

    /// Write Loot to writer
    void writeTo(Stream writer) const {
        writer.write(id);
        position.writeTo(writer);
        item.writeTo(writer);
    }
}