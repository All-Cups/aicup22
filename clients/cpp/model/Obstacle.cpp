#include "Obstacle.hpp"

namespace model {

Obstacle::Obstacle(int id, model::Vec2 position, double radius, bool canSeeThrough, bool canShootThrough) : id(id), position(position), radius(radius), canSeeThrough(canSeeThrough), canShootThrough(canShootThrough) { }

// Read Obstacle from input stream
Obstacle Obstacle::readFrom(InputStream& stream) {
    int id = stream.readInt();
    model::Vec2 position = model::Vec2::readFrom(stream);
    double radius = stream.readDouble();
    bool canSeeThrough = stream.readBool();
    bool canShootThrough = stream.readBool();
    return Obstacle(id, position, radius, canSeeThrough, canShootThrough);
}

// Write Obstacle to output stream
void Obstacle::writeTo(OutputStream& stream) const {
    stream.write(id);
    position.writeTo(stream);
    stream.write(radius);
    stream.write(canSeeThrough);
    stream.write(canShootThrough);
}

// Get string representation of Obstacle
std::string Obstacle::toString() const {
    std::stringstream ss;
    ss << "Obstacle { ";
    ss << "id: ";
    ss << id;
    ss << ", ";
    ss << "position: ";
    ss << position.toString();
    ss << ", ";
    ss << "radius: ";
    ss << radius;
    ss << ", ";
    ss << "canSeeThrough: ";
    ss << canSeeThrough;
    ss << ", ";
    ss << "canShootThrough: ";
    ss << canShootThrough;
    ss << " }";
    return ss.str();
}

}