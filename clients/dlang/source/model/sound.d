module model.sound;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.vec2;

/// Sound heard by one of your units
struct Sound {
    /// Sound type index (starting with 0)
    int typeIndex;
    /// Id of unit that heard this sound
    int unitId;
    /// Position where sound was heard (different from sound source position)
    model.Vec2 position;

    this(int typeIndex, int unitId, model.Vec2 position) {
        this.typeIndex = typeIndex;
        this.unitId = unitId;
        this.position = position;
    }

    /// Read Sound from reader
    static Sound readFrom(Stream reader) {
        int typeIndex;
        typeIndex = reader.readInt();
        int unitId;
        unitId = reader.readInt();
        model.Vec2 position;
        position = model.Vec2.readFrom(reader);
        return Sound(typeIndex, unitId, position);
    }

    /// Write Sound to writer
    void writeTo(Stream writer) const {
        writer.write(typeIndex);
        writer.write(unitId);
        position.writeTo(writer);
    }
}