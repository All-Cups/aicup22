#include "ColoredVertex.hpp"

namespace debugging {

ColoredVertex::ColoredVertex(model::Vec2 position, debugging::Color color) : position(position), color(color) { }

// Read ColoredVertex from input stream
ColoredVertex ColoredVertex::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    debugging::Color color = debugging::Color::readFrom(stream);
    return ColoredVertex(position, color);
}

// Write ColoredVertex to output stream
void ColoredVertex::writeTo(OutputStream& stream) const {
    position.writeTo(stream);
    color.writeTo(stream);
}

// Get string representation of ColoredVertex
std::string ColoredVertex::toString() const {
    std::stringstream ss;
    ss << "ColoredVertex { ";
    ss << "position: ";
    ss << position.toString();
    ss << ", ";
    ss << "color: ";
    ss << color.toString();
    ss << " }";
    return ss.str();
}

}