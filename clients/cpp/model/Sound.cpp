#include "Sound.hpp"

namespace model {

Sound::Sound(int typeIndex, int unitId, model::Vec2 position) : typeIndex(typeIndex), unitId(unitId), position(position) { }

// Read Sound from input stream
Sound Sound::readFrom(InputStream& stream) {
    int typeIndex = stream.readInt();
    int unitId = stream.readInt();
    model::Vec2 position = model::Vec2::readFrom(stream);
    return Sound(typeIndex, unitId, position);
}

// Write Sound to output stream
void Sound::writeTo(OutputStream& stream) const {
    stream.write(typeIndex);
    stream.write(unitId);
    position.writeTo(stream);
}

// Get string representation of Sound
std::string Sound::toString() const {
    std::stringstream ss;
    ss << "Sound { ";
    ss << "typeIndex: ";
    ss << typeIndex;
    ss << ", ";
    ss << "unitId: ";
    ss << unitId;
    ss << ", ";
    ss << "position: ";
    ss << position.toString();
    ss << " }";
    return ss.str();
}

}