#ifndef __MODEL_ACTION_TYPE_HPP__
#define __MODEL_ACTION_TYPE_HPP__

#include "Stream.hpp"

namespace model {

// Type of action a unit is currently performing
enum class ActionType {
    // Picking up or dropping loot
    LOOTING = 0,
    // Using a shield potion
    USE_SHIELD_POTION = 1
};

// Read ActionType from input stream
ActionType readActionType(InputStream& stream);

// Get string representation of ActionType
std::string actionTypeToString(ActionType value);

}

#endif