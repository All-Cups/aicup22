#ifndef __MODEL_ZONE_HPP__
#define __MODEL_ZONE_HPP__

#include "Stream.hpp"
#include "model/Vec2.hpp"
#include <sstream>
#include <stdexcept>
#include <string>

namespace model {

// Current state of the game zone
class Zone {
public:
    // Current center
    model::Vec2 currentCenter;
    // Current radius
    double currentRadius;
    // Next center
    model::Vec2 nextCenter;
    // Next radius
    double nextRadius;

    Zone(model::Vec2 currentCenter, double currentRadius, model::Vec2 nextCenter, double nextRadius);

    // Read Zone from input stream
    static Zone readFrom(InputStream& stream);

    // Write Zone to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Zone
    std::string toString() const;
};

}

#endif