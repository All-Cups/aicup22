#ifndef __MODEL_SOUND_HPP__
#define __MODEL_SOUND_HPP__

#include "Stream.hpp"
#include "model/Vec2.hpp"
#include <sstream>
#include <stdexcept>
#include <string>

namespace model {

// Sound heard by one of your units
class Sound {
public:
    // Sound type index (starting with 0)
    int typeIndex;
    // Id of unit that heard this sound
    int unitId;
    // Position where sound was heard (different from sound source position)
    model::Vec2 position;

    Sound(int typeIndex, int unitId, model::Vec2 position);

    // Read Sound from input stream
    static Sound readFrom(InputStream& stream);

    // Write Sound to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Sound
    std::string toString() const;
};

}

#endif