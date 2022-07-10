#include "UnitOrder.hpp"

namespace model {

UnitOrder::UnitOrder(model::Vec2 targetVelocity, model::Vec2 targetDirection, std::optional<model::ActionOrder> action) : targetVelocity(targetVelocity), targetDirection(targetDirection), action(action) { }

// Read UnitOrder from input stream
UnitOrder UnitOrder::readFrom(InputStream& stream) {
    model::Vec2 targetVelocity = model::Vec2::readFrom(stream);
    model::Vec2 targetDirection = model::Vec2::readFrom(stream);
    std::optional<model::ActionOrder> action = std::optional<model::ActionOrder>();
    if (stream.readBool()) {
        model::ActionOrder actionValue = model::readActionOrder(stream);
        action.emplace(actionValue);
    }
    return UnitOrder(targetVelocity, targetDirection, action);
}

// Write UnitOrder to output stream
void UnitOrder::writeTo(OutputStream& stream) const {
    targetVelocity.writeTo(stream);
    targetDirection.writeTo(stream);
    if (action) {
        stream.write(true);
        const model::ActionOrder& actionValue = *action;
        writeActionOrder(actionValue, stream);
    } else {
        stream.write(false);
    }
}

// Get string representation of UnitOrder
std::string UnitOrder::toString() const {
    std::stringstream ss;
    ss << "UnitOrder { ";
    ss << "targetVelocity: ";
    ss << targetVelocity.toString();
    ss << ", ";
    ss << "targetDirection: ";
    ss << targetDirection.toString();
    ss << ", ";
    ss << "action: ";
    if (action) {
        const model::ActionOrder& actionValue = *action;
        ss << actionOrderToString(actionValue);
    } else {
        ss << "none";
    }
    ss << " }";
    return ss.str();
}

}