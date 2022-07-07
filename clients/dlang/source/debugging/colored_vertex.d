module debugging.colored_vertex;

import stream;
import std.conv;
import std.typecons : Nullable;
import debugging.color;
import model.vec2;

/// Point + color
struct ColoredVertex {
    /// Position
    model.Vec2 position;
    /// Color
    debugging.Color color;

    this(model.Vec2 position, debugging.Color color) {
        this.position = position;
        this.color = color;
    }

    /// Read ColoredVertex from reader
    static ColoredVertex readFrom(Stream reader) {
        model.Vec2 position;
        position = model.Vec2.readFrom(reader);
        debugging.Color color;
        color = debugging.Color.readFrom(reader);
        return ColoredVertex(position, color);
    }

    /// Write ColoredVertex to writer
    void writeTo(Stream writer) const {
        position.writeTo(writer);
        color.writeTo(writer);
    }
}