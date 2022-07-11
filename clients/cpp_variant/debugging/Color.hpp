#ifndef __MODEL_COLOR_HPP__
#define __MODEL_COLOR_HPP__

#include "Stream.hpp"
#include <sstream>
#include <string>

namespace debugging {

// RGBA Color
class Color {
public:
    // Red component
    double r;
    // Green component
    double g;
    // Blue component
    double b;
    // Alpha (opacity) component
    double a;

    Color(double r, double g, double b, double a);

    // Read Color from input stream
    static Color readFrom(InputStream& stream);

    // Write Color to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Color
    std::string toString() const;
};

}

#endif