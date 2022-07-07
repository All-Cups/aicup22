module debugging.color;

import stream;
import std.conv;
import std.typecons : Nullable;


/// RGBA Color
struct Color {
    /// Red component
    double r;
    /// Green component
    double g;
    /// Blue component
    double b;
    /// Alpha (opacity) component
    double a;

    this(double r, double g, double b, double a) {
        this.r = r;
        this.g = g;
        this.b = b;
        this.a = a;
    }

    /// Read Color from reader
    static Color readFrom(Stream reader) {
        double r;
        r = reader.readDouble();
        double g;
        g = reader.readDouble();
        double b;
        b = reader.readDouble();
        double a;
        a = reader.readDouble();
        return Color(r, g, b, a);
    }

    /// Write Color to writer
    void writeTo(Stream writer) const {
        writer.write(r);
        writer.write(g);
        writer.write(b);
        writer.write(a);
    }
}