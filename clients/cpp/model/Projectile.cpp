#include "Projectile.hpp"

namespace model {

Projectile::Projectile(int id, int weaponTypeIndex, int shooterId, int shooterPlayerId, model::Vec2 position, model::Vec2 velocity, double lifeTime) : id(id), weaponTypeIndex(weaponTypeIndex), shooterId(shooterId), shooterPlayerId(shooterPlayerId), position(position), velocity(velocity), lifeTime(lifeTime) { }

// Read Projectile from input stream
Projectile Projectile::readFrom(InputStream& stream) {
    int id = stream.readInt();
    int weaponTypeIndex = stream.readInt();
    int shooterId = stream.readInt();
    int shooterPlayerId = stream.readInt();
    model::Vec2 position = model::Vec2::readFrom(stream);
    model::Vec2 velocity = model::Vec2::readFrom(stream);
    double lifeTime = stream.readDouble();
    return Projectile(id, weaponTypeIndex, shooterId, shooterPlayerId, position, velocity, lifeTime);
}

// Write Projectile to output stream
void Projectile::writeTo(OutputStream& stream) const {
    stream.write(id);
    stream.write(weaponTypeIndex);
    stream.write(shooterId);
    stream.write(shooterPlayerId);
    position.writeTo(stream);
    velocity.writeTo(stream);
    stream.write(lifeTime);
}

// Get string representation of Projectile
std::string Projectile::toString() const {
    std::stringstream ss;
    ss << "Projectile { ";
    ss << "id: ";
    ss << id;
    ss << ", ";
    ss << "weaponTypeIndex: ";
    ss << weaponTypeIndex;
    ss << ", ";
    ss << "shooterId: ";
    ss << shooterId;
    ss << ", ";
    ss << "shooterPlayerId: ";
    ss << shooterPlayerId;
    ss << ", ";
    ss << "position: ";
    ss << position.toString();
    ss << ", ";
    ss << "velocity: ";
    ss << velocity.toString();
    ss << ", ";
    ss << "lifeTime: ";
    ss << lifeTime;
    ss << " }";
    return ss.str();
}

}