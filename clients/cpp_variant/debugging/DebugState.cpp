#include "DebugState.hpp"

namespace debugging {

DebugState::DebugState(std::vector<std::string> pressedKeys, model::Vec2 cursorWorldPosition, std::optional<int> lockedUnit, debugging::Camera camera) : pressedKeys(pressedKeys), cursorWorldPosition(cursorWorldPosition), lockedUnit(lockedUnit), camera(camera) { }

// Read DebugState from input stream
DebugState DebugState::readFrom(InputStream& stream) {
    std::vector<std::string> pressedKeys = std::vector<std::string>();
    size_t pressedKeysSize = stream.readInt();
    pressedKeys.reserve(pressedKeysSize);
    for (size_t pressedKeysIndex = 0; pressedKeysIndex < pressedKeysSize; pressedKeysIndex++) {
        std::string pressedKeysElement = stream.readString();
        pressedKeys.emplace_back(pressedKeysElement);
    }
    model::Vec2 cursorWorldPosition = model::Vec2::readFrom(stream);
    std::optional<int> lockedUnit = std::optional<int>();
    if (stream.readBool()) {
        int lockedUnitValue = stream.readInt();
        lockedUnit.emplace(lockedUnitValue);
    }
    debugging::Camera camera = debugging::Camera::readFrom(stream);
    return DebugState(pressedKeys, cursorWorldPosition, lockedUnit, camera);
}

// Write DebugState to output stream
void DebugState::writeTo(OutputStream& stream) const {
    stream.write((int)(pressedKeys.size()));
    for (const std::string& pressedKeysElement : pressedKeys) {
        stream.write(pressedKeysElement);
    }
    cursorWorldPosition.writeTo(stream);
    if (lockedUnit) {
        stream.write(true);
        const int& lockedUnitValue = *lockedUnit;
        stream.write(lockedUnitValue);
    } else {
        stream.write(false);
    }
    camera.writeTo(stream);
}

// Get string representation of DebugState
std::string DebugState::toString() const {
    std::stringstream ss;
    ss << "DebugState { ";
    ss << "pressedKeys: ";
    ss << "[ ";
    for (size_t pressedKeysIndex = 0; pressedKeysIndex < pressedKeys.size(); pressedKeysIndex++) {
        const std::string& pressedKeysElement = pressedKeys[pressedKeysIndex];
        if (pressedKeysIndex != 0) {
            ss << ", ";
        }
        ss << '"' << pressedKeysElement << '"';
    }
    ss << " ]";
    ss << ", ";
    ss << "cursorWorldPosition: ";
    ss << cursorWorldPosition.toString();
    ss << ", ";
    ss << "lockedUnit: ";
    if (lockedUnit) {
        const int& lockedUnitValue = *lockedUnit;
        ss << lockedUnitValue;
    } else {
        ss << "none";
    }
    ss << ", ";
    ss << "camera: ";
    ss << camera.toString();
    ss << " }";
    return ss.str();
}

}