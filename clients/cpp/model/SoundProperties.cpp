#include "SoundProperties.hpp"

namespace model {

SoundProperties::SoundProperties(std::string name, double distance, double offset) : name(name), distance(distance), offset(offset) { }

// Read SoundProperties from input stream
SoundProperties SoundProperties::readFrom(InputStream& stream) {
    std::string name = stream.readString();
    double distance = stream.readDouble();
    double offset = stream.readDouble();
    return SoundProperties(name, distance, offset);
}

// Write SoundProperties to output stream
void SoundProperties::writeTo(OutputStream& stream) const {
    stream.write(name);
    stream.write(distance);
    stream.write(offset);
}

// Get string representation of SoundProperties
std::string SoundProperties::toString() const {
    std::stringstream ss;
    ss << "SoundProperties { ";
    ss << "name: ";
    ss << '"' << name << '"';
    ss << ", ";
    ss << "distance: ";
    ss << distance;
    ss << ", ";
    ss << "offset: ";
    ss << offset;
    ss << " }";
    return ss.str();
}

}