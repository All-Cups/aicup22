#ifndef __MODEL_OBSTACLE_HPP__
#define __MODEL_OBSTACLE_HPP__

#include "Stream.hpp"
#include "model/Vec2.hpp"
#include <sstream>
#include <stdexcept>
#include <string>

namespace model {

// An obstacle on the map
class Obstacle {
public:
    // Unique id
    int id;
    // Center position
    model::Vec2 position;
    // Obstacle's radius
    double radius;
    // Whether units can see through this obstacle, or it blocks the view
    bool canSeeThrough;
    // Whether projectiles can go through this obstacle
    bool canShootThrough;

    Obstacle(int id, model::Vec2 position, double radius, bool canSeeThrough, bool canShootThrough);

    // Read Obstacle from input stream
    static Obstacle readFrom(InputStream& stream);

    // Write Obstacle to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Obstacle
    std::string toString() const;
};

}

#endif