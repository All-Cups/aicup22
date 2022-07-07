#include "Camera.hpp"

namespace debugging {

Camera::Camera(model::Vec2 center, double rotation, double attack, double fov) : center(center), rotation(rotation), attack(attack), fov(fov) { }

// Read Camera from input stream
Camera Camera::readFrom(InputStream& stream) {
    model::Vec2 center = model::Vec2::readFrom(stream);
    double rotation = stream.readDouble();
    double attack = stream.readDouble();
    double fov = stream.readDouble();
    return Camera(center, rotation, attack, fov);
}

// Write Camera to output stream
void Camera::writeTo(OutputStream& stream) const {
    center.writeTo(stream);
    stream.write(rotation);
    stream.write(attack);
    stream.write(fov);
}

// Get string representation of Camera
std::string Camera::toString() const {
    std::stringstream ss;
    ss << "Camera { ";
    ss << "center: ";
    ss << center.toString();
    ss << ", ";
    ss << "rotation: ";
    ss << rotation;
    ss << ", ";
    ss << "attack: ";
    ss << attack;
    ss << ", ";
    ss << "fov: ";
    ss << fov;
    ss << " }";
    return ss.str();
}

}