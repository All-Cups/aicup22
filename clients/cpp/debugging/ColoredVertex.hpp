#ifndef __MODEL_COLORED_VERTEX_HPP__
#define __MODEL_COLORED_VERTEX_HPP__

#include "Stream.hpp"
#include "debugging/Color.hpp"
#include "model/Vec2.hpp"
#include <sstream>
#include <stdexcept>
#include <string>

namespace debugging {

// Point + color
class ColoredVertex {
public:
    // Position
    model::Vec2 position;
    // Color
    debugging::Color color;

    ColoredVertex(model::Vec2 position, debugging::Color color);

    // Read ColoredVertex from input stream
    static ColoredVertex readFrom(InputStream& stream);

    // Write ColoredVertex to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of ColoredVertex
    std::string toString() const;
};

}

#endif