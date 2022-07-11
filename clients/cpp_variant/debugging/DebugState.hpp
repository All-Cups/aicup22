#ifndef __MODEL_DEBUG_STATE_HPP__
#define __MODEL_DEBUG_STATE_HPP__

#include "Stream.hpp"
#include "debugging/Camera.hpp"
#include "model/Vec2.hpp"
#include <optional>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace debugging {

// Renderer's state
class DebugState {
public:
    // Pressed keys
    std::vector<std::string> pressedKeys;
    // Cursor's position in game coordinates
    model::Vec2 cursorWorldPosition;
    // Id of unit which is followed by the camera, or None
    std::optional<int> lockedUnit;
    // Current camera state
    debugging::Camera camera;

    DebugState(std::vector<std::string> pressedKeys, model::Vec2 cursorWorldPosition, std::optional<int> lockedUnit, debugging::Camera camera);

    // Read DebugState from input stream
    static DebugState readFrom(InputStream& stream);

    // Write DebugState to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of DebugState
    std::string toString() const;
};

}

#endif