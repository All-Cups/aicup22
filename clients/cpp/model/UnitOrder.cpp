#include "UnitOrder.hpp"

namespace model {

UnitOrder::UnitOrder(model::Vec2 targetVelocity, model::Vec2 targetDirection, std::optional<std::shared_ptr<model::ActionOrder>> action) : targetVelocity(targetVelocity), targetDirection(targetDirection), action(action) { }

// Read UnitOrder from input stream
UnitOrder UnitOrder::readFrom(InputStream& stream) {
    model::Vec2 targetVelocity = model::Vec2::readFrom(stream);
    model::Vec2 targetDirection = model::Vec2::readFrom(stream);
    std::optional<std::shared_ptr<model::ActionOrder>> action = std::optional<std::shared_ptr<model::ActionOrder>>();
    if (stream.readBool()) {
        std::shared_ptr<model::ActionOrder> actionValue = model::ActionOrder::readFrom(stream);
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
        const std::shared_ptr<model::ActionOrder>& actionValue = *action;
        actionValue->writeTo(stream);
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
        const std::shared_ptr<model::ActionOrder>& actionValue = *action;
        ss << actionValue->toString();
    } else {
        ss << "none";
    }
    ss << " }";
    return ss.str();
}

}