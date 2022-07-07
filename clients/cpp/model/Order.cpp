#include "Order.hpp"

namespace model {

Order::Order(std::unordered_map<int, model::UnitOrder> unitOrders) : unitOrders(unitOrders) { }

// Read Order from input stream
Order Order::readFrom(InputStream& stream) {
    size_t unitOrdersSize = stream.readInt();
    std::unordered_map<int, model::UnitOrder> unitOrders = std::unordered_map<int, model::UnitOrder>();
    unitOrders.reserve(unitOrdersSize);
    for (size_t unitOrdersIndex = 0; unitOrdersIndex < unitOrdersSize; unitOrdersIndex++) {
        int unitOrdersKey = stream.readInt();
        model::UnitOrder unitOrdersValue = model::UnitOrder::readFrom(stream);
        unitOrders.emplace(std::make_pair(unitOrdersKey, unitOrdersValue));
    }
    return Order(unitOrders);
}

// Write Order to output stream
void Order::writeTo(OutputStream& stream) const {
    stream.write((int)(unitOrders.size()));
    for (const auto& unitOrdersEntry : unitOrders) {
        const int& unitOrdersKey = unitOrdersEntry.first;
        const model::UnitOrder& unitOrdersValue = unitOrdersEntry.second;
        stream.write(unitOrdersKey);
        unitOrdersValue.writeTo(stream);
    }
}

// Get string representation of Order
std::string Order::toString() const {
    std::stringstream ss;
    ss << "Order { ";
    ss << "unitOrders: ";
    ss << "{ ";
    size_t unitOrdersIndex = 0;
    for (const auto& unitOrdersEntry : unitOrders) {
        if (unitOrdersIndex != 0) {
            ss << ", ";
        }
        const int& unitOrdersKey = unitOrdersEntry.first;
        const model::UnitOrder& unitOrdersValue = unitOrdersEntry.second;
        ss << unitOrdersKey;
        ss << ": ";
        ss << unitOrdersValue.toString();
        unitOrdersIndex++;
    }
    ss << " }";
    ss << " }";
    return ss.str();
}

}