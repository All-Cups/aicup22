#ifndef __MODEL_VEC2_HPP__
#define __MODEL_VEC2_HPP__

#include "Stream.hpp"
#include <sstream>
#include <string>

namespace model {

// 2 dimensional vector.
class Vec2 {
public:
    // `x` coordinate of the vector
    double x;
    // `y` coordinate of the vector
    double y;

    Vec2(double x, double y);

    // Read Vec2 from input stream
    static Vec2 readFrom(InputStream& stream);

    // Write Vec2 to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Vec2
    std::string toString() const;
};

}

#endif