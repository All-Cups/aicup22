#include "Action.hpp"

namespace model {

Action::Action(int finishTick, model::ActionType actionType) : finishTick(finishTick), actionType(actionType) { }

// Read Action from input stream
Action Action::readFrom(InputStream& stream) {
    int finishTick = stream.readInt();
    model::ActionType actionType = readActionType(stream);
    return Action(finishTick, actionType);
}

// Write Action to output stream
void Action::writeTo(OutputStream& stream) const {
    stream.write(finishTick);
    stream.write((int)(actionType));
}

// Get string representation of Action
std::string Action::toString() const {
    std::stringstream ss;
    ss << "Action { ";
    ss << "finishTick: ";
    ss << finishTick;
    ss << ", ";
    ss << "actionType: ";
    ss << actionTypeToString(actionType);
    ss << " }";
    return ss.str();
}

bool Action::operator ==(const Action& other) const {
    return finishTick == other.finishTick && actionType == other.actionType;
}

}

size_t std::hash<model::Action>::operator ()(const model::Action& value) const {
    size_t result = 0;
    result ^= std::hash<int>{}(value.finishTick) + 0x9e3779b9 + (result << 6) + (result >> 2);
    result ^= std::hash<model::ActionType>{}(value.actionType) + 0x9e3779b9 + (result << 6) + (result >> 2);
    return result;
}