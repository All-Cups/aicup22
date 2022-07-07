#ifndef __MODEL_PROJECTILE_HPP__
#define __MODEL_PROJECTILE_HPP__

#include "Stream.hpp"
#include "model/Vec2.hpp"
#include <sstream>
#include <stdexcept>
#include <string>

namespace model {

// Weapon projectile
class Projectile {
public:
    // Unique id
    int id;
    // Index of the weapon this projectile was shot from (starts with 0)
    int weaponTypeIndex;
    // Id of unit who made the shot
    int shooterId;
    // Id of player (team), whose unit made the shot
    int shooterPlayerId;
    // Current position
    model::Vec2 position;
    // Projectile's velocity
    model::Vec2 velocity;
    // Left time of projectile's life
    double lifeTime;

    Projectile(int id, int weaponTypeIndex, int shooterId, int shooterPlayerId, model::Vec2 position, model::Vec2 velocity, double lifeTime);

    // Read Projectile from input stream
    static Projectile readFrom(InputStream& stream);

    // Write Projectile to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Projectile
    std::string toString() const;
};

}

#endif