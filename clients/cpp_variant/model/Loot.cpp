#include "Loot.hpp"

namespace model {

Loot::Loot(int id, model::Vec2 position, model::Item item) : id(id), position(position), item(item) { }

// Read Loot from input stream
Loot Loot::readFrom(InputStream& stream) {
    int id = stream.readInt();
    model::Vec2 position = model::Vec2::readFrom(stream);
    model::Item item = model::readItem(stream);
    return Loot(id, position, item);
}

// Write Loot to output stream
void Loot::writeTo(OutputStream& stream) const {
    stream.write(id);
    position.writeTo(stream);
    writeItem(item, stream);
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
    ss << itemToString(item);
    ss << " }";
    return ss.str();
}

}