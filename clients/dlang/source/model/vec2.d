module model.vec2;

import stream;
import std.conv;
import std.typecons : Nullable;


/// 2 dimensional vector.
struct Vec2 {
    /// `x` coordinate of the vector
    double x;
    /// `y` coordinate of the vector
    double y;

    this(double x, double y) {
        this.x = x;
        this.y = y;
    }

    /// Read Vec2 from reader
    static Vec2 readFrom(Stream reader) {
        double x;
        x = reader.readDouble();
        double y;
        y = reader.readDouble();
        return Vec2(x, y);
    }

    /// Write Vec2 to writer
    void writeTo(Stream writer) const {
        writer.write(x);
        writer.write(y);
    }
}