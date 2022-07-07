#include "Vec2.hpp"

namespace model {

Vec2::Vec2(double x, double y) : x(x), y(y) { }

// Read Vec2 from input stream
Vec2 Vec2::readFrom(InputStream& stream) {
    double x = stream.readDouble();
    double y = stream.readDouble();
    return Vec2(x, y);
}

// Write Vec2 to output stream
void Vec2::writeTo(OutputStream& stream) const {
    stream.write(x);
    stream.write(y);
}

// Get string representation of Vec2
std::string Vec2::toString() const {
    std::stringstream ss;
    ss << "Vec2 { ";
    ss << "x: ";
    ss << x;
    ss << ", ";
    ss << "y: ";
    ss << y;
    ss << " }";
    return ss.str();
}

}