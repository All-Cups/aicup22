#ifndef __MODEL_ACTION_HPP__
#define __MODEL_ACTION_HPP__

#include "Stream.hpp"
#include "model/ActionType.hpp"
#include <sstream>
#include <stdexcept>
#include <string>

namespace model {

// Action unit is currently performing
class Action {
public:
    // Tick when the action will be finished
    int finishTick;
    // Type of the action
    model::ActionType actionType;

    Action(int finishTick, model::ActionType actionType);

    // Read Action from input stream
    static Action readFrom(InputStream& stream);

    // Write Action to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Action
    std::string toString() const;

    bool operator ==(const Action& other) const;
};

}

namespace std {
    template<>
    struct hash<model::Action> {
        size_t operator ()(const model::Action& value) const;
    };
}

#endif