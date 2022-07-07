module model.obstacle;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.vec2;

/// An obstacle on the map
struct Obstacle {
    /// Unique id
    int id;
    /// Center position
    model.Vec2 position;
    /// Obstacle's radius
    double radius;
    /// Whether units can see through this obstacle, or it blocks the view
    bool canSeeThrough;
    /// Whether projectiles can go through this obstacle
    bool canShootThrough;

    this(int id, model.Vec2 position, double radius, bool canSeeThrough, bool canShootThrough) {
        this.id = id;
        this.position = position;
        this.radius = radius;
        this.canSeeThrough = canSeeThrough;
        this.canShootThrough = canShootThrough;
    }

    /// Read Obstacle from reader
    static Obstacle readFrom(Stream reader) {
        int id;
        id = reader.readInt();
        model.Vec2 position;
        position = model.Vec2.readFrom(reader);
        double radius;
        radius = reader.readDouble();
        bool canSeeThrough;
        canSeeThrough = reader.readBool();
        bool canShootThrough;
        canShootThrough = reader.readBool();
        return Obstacle(id, position, radius, canSeeThrough, canShootThrough);
    }

    /// Write Obstacle to writer
    void writeTo(Stream writer) const {
        writer.write(id);
        position.writeTo(writer);
        writer.write(radius);
        writer.write(canSeeThrough);
        writer.write(canShootThrough);
    }
}