#include "ActionType.hpp"
#include <stdexcept>

namespace model {

// Read ActionType from input stream
ActionType readActionType(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return ActionType::LOOTING;
    case 1:
        return ActionType::USE_SHIELD_POTION;
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

// Get string representation of ActionType
std::string actionTypeToString(ActionType value) {
    switch (value) {
    case ActionType::LOOTING:
        return "LOOTING";
    case ActionType::USE_SHIELD_POTION:
        return "USE_SHIELD_POTION";
    default:
        throw std::runtime_error("Impossible happened");
    }
}

}