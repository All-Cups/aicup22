#ifndef __MODEL_SOUND_PROPERTIES_HPP__
#define __MODEL_SOUND_PROPERTIES_HPP__

#include "Stream.hpp"
#include <sstream>
#include <string>

namespace model {

// Sound properties
class SoundProperties {
public:
    // Name
    std::string name;
    // Distance from which the sound can be heard
    double distance;
    // Offset modifier
    double offset;

    SoundProperties(std::string name, double distance, double offset);

    // Read SoundProperties from input stream
    static SoundProperties readFrom(InputStream& stream);

    // Write SoundProperties to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of SoundProperties
    std::string toString() const;
};

}

#endif