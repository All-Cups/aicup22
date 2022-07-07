module debugging.camera;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.vec2;

/// Camera state
struct Camera {
    /// Center
    model.Vec2 center;
    /// Rotation
    double rotation;
    /// Attack angle
    double attack;
    /// Vertical field of view
    double fov;

    this(model.Vec2 center, double rotation, double attack, double fov) {
        this.center = center;
        this.rotation = rotation;
        this.attack = attack;
        this.fov = fov;
    }

    /// Read Camera from reader
    static Camera readFrom(Stream reader) {
        model.Vec2 center;
        center = model.Vec2.readFrom(reader);
        double rotation;
        rotation = reader.readDouble();
        double attack;
        attack = reader.readDouble();
        double fov;
        fov = reader.readDouble();
        return Camera(center, rotation, attack, fov);
    }

    /// Write Camera to writer
    void writeTo(Stream writer) const {
        center.writeTo(writer);
        writer.write(rotation);
        writer.write(attack);
        writer.write(fov);
    }
}