#include "Zone.hpp"

namespace model {

Zone::Zone(model::Vec2 currentCenter, double currentRadius, model::Vec2 nextCenter, double nextRadius) : currentCenter(currentCenter), currentRadius(currentRadius), nextCenter(nextCenter), nextRadius(nextRadius) { }

// Read Zone from input stream
Zone Zone::readFrom(InputStream& stream) {
    model::Vec2 currentCenter = model::Vec2::readFrom(stream);
    double currentRadius = stream.readDouble();
    model::Vec2 nextCenter = model::Vec2::readFrom(stream);
    double nextRadius = stream.readDouble();
    return Zone(currentCenter, currentRadius, nextCenter, nextRadius);
}

// Write Zone to output stream
void Zone::writeTo(OutputStream& stream) const {
    currentCenter.writeTo(stream);
    stream.write(currentRadius);
    nextCenter.writeTo(stream);
    stream.write(nextRadius);
}

// Get string representation of Zone
std::string Zone::toString() const {
    std::stringstream ss;
    ss << "Zone { ";
    ss << "currentCenter: ";
    ss << currentCenter.toString();
    ss << ", ";
    ss << "currentRadius: ";
    ss << currentRadius;
    ss << ", ";
    ss << "nextCenter: ";
    ss << nextCenter.toString();
    ss << ", ";
    ss << "nextRadius: ";
    ss << nextRadius;
    ss << " }";
    return ss.str();
}

}