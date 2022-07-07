#include "Loot.hpp"

namespace model {

Loot::Loot(int id, model::Vec2 position, std::shared_ptr<model::Item> item) : id(id), position(position), item(item) { }

// Read Loot from input stream
Loot Loot::readFrom(InputStream& stream) {
    int id = stream.readInt();
    model::Vec2 position = model::Vec2::readFrom(stream);
    std::shared_ptr<model::Item> item = model::Item::readFrom(stream);
    return Loot(id, position, item);
}

// Write Loot to output stream
void Loot::writeTo(OutputStream& stream) const {
    stream.write(id);
    position.writeTo(stream);
    item->writeTo(stream);
}

// Get string representation of Loot
std::string Loot::toString() const {
    std::stringstream ss;
    ss << "Loot { ";
    ss << "id: ";
    ss << id;
    ss << ", ";
    ss << "position: ";
    ss << position.toString();
    ss << ", ";
    ss << "item: ";
    ss << item->toString();
    ss << " }";
    return ss.str();
}

}