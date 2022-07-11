#include "Color.hpp"

namespace debugging {

Color::Color(double r, double g, double b, double a) : r(r), g(g), b(b), a(a) { }

// Read Color from input stream
Color Color::readFrom(InputStream& stream) {
    double r = stream.readDouble();
    double g = stream.readDouble();
    double b = stream.readDouble();
    double a = stream.readDouble();
    return Color(r, g, b, a);
}

// Write Color to output stream
void Color::writeTo(OutputStream& stream) const {
    stream.write(r);
    stream.write(g);
    stream.write(b);
    stream.write(a);
}

// Get string representation of Color
std::string Color::toString() const {
    std::stringstream ss;
    ss << "Color { ";
    ss << "r: ";
    ss << r;
    ss << ", ";
    ss << "g: ";
    ss << g;
    ss << ", ";
    ss << "b: ";
    ss << b;
    ss << ", ";
    ss << "a: ";
    ss << a;
    ss << " }";
    return ss.str();
}

}