#ifndef __MODEL_CAMERA_HPP__
#define __MODEL_CAMERA_HPP__

#include "Stream.hpp"
#include "model/Vec2.hpp"
#include <sstream>
#include <stdexcept>
#include <string>

namespace debugging {

// Camera state
class Camera {
public:
    // Center
    model::Vec2 center;
    // Rotation
    double rotation;
    // Attack angle
    double attack;
    // Vertical field of view
    double fov;

    Camera(model::Vec2 center, double rotation, double attack, double fov);

    // Read Camera from input stream
    static Camera readFrom(InputStream& stream);

    // Write Camera to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Camera
    std::string toString() const;
};

}

#endif