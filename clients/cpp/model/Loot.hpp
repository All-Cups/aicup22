#ifndef __MODEL_LOOT_HPP__
#define __MODEL_LOOT_HPP__

#include "Stream.hpp"
#include "model/Item.hpp"
#include "model/Vec2.hpp"
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>

namespace model {

// Loot lying on the ground
class Loot {
public:
    // Unique id
    int id;
    // Position
    model::Vec2 position;
    // Item
    std::shared_ptr<model::Item> item;

    Loot(int id, model::Vec2 position, std::shared_ptr<model::Item> item);

    // Read Loot from input stream
    static Loot readFrom(InputStream& stream);

    // Write Loot to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Loot
    std::string toString() const;
};

}

#endif