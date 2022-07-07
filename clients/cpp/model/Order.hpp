#ifndef __MODEL_ORDER_HPP__
#define __MODEL_ORDER_HPP__

#include "Stream.hpp"
#include "model/ActionOrder.hpp"
#include "model/UnitOrder.hpp"
#include "model/Vec2.hpp"
#include <memory>
#include <optional>
#include <sstream>
#include <stdexcept>
#include <string>
#include <unordered_map>

namespace model {

// Player's (team's) orders
class Order {
public:
    // Orders for each of your units
    std::unordered_map<int, model::UnitOrder> unitOrders;

    Order(std::unordered_map<int, model::UnitOrder> unitOrders);

    // Read Order from input stream
    static Order readFrom(InputStream& stream);

    // Write Order to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Order
    std::string toString() const;
};

}

#endif