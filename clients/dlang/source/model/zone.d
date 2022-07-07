module model.zone;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.vec2;

/// Current state of the game zone
struct Zone {
    /// Current center
    model.Vec2 currentCenter;
    /// Current radius
    double currentRadius;
    /// Next center
    model.Vec2 nextCenter;
    /// Next radius
    double nextRadius;

    this(model.Vec2 currentCenter, double currentRadius, model.Vec2 nextCenter, double nextRadius) {
        this.currentCenter = currentCenter;
        this.currentRadius = currentRadius;
        this.nextCenter = nextCenter;
        this.nextRadius = nextRadius;
    }

    /// Read Zone from reader
    static Zone readFrom(Stream reader) {
        model.Vec2 currentCenter;
        currentCenter = model.Vec2.readFrom(reader);
        double currentRadius;
        currentRadius = reader.readDouble();
        model.Vec2 nextCenter;
        nextCenter = model.Vec2.readFrom(reader);
        double nextRadius;
        nextRadius = reader.readDouble();
        return Zone(currentCenter, currentRadius, nextCenter, nextRadius);
    }

    /// Write Zone to writer
    void writeTo(Stream writer) const {
        currentCenter.writeTo(writer);
        writer.write(currentRadius);
        nextCenter.writeTo(writer);
        writer.write(nextRadius);
    }
}