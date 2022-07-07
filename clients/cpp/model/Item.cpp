#include "Item.hpp"
#include <stdexcept>

namespace model {

Item::Weapon::Weapon(int typeIndex) : typeIndex(typeIndex) { }

// Read Weapon from input stream
Item::Weapon Item::Weapon::readFrom(InputStream& stream) {
    int typeIndex = stream.readInt();
    return Item::Weapon(typeIndex);
}

// Write Weapon to output stream
void Item::Weapon::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write(typeIndex);
}

// Get string representation of Weapon
std::string Item::Weapon::toString() const {
    std::stringstream ss;
    ss << "Item::Weapon { ";
    ss << "typeIndex: ";
    ss << typeIndex;
    ss << " }";
    return ss.str();
}

bool Item::Weapon::operator ==(const Item::Weapon& other) const {
    return typeIndex == other.typeIndex;
}

Item::ShieldPotions::ShieldPotions(int amount) : amount(amount) { }

// Read ShieldPotions from input stream
Item::ShieldPotions Item::ShieldPotions::readFrom(InputStream& stream) {
    int amount = stream.readInt();
    return Item::ShieldPotions(amount);
}

// Write ShieldPotions to output stream
void Item::ShieldPotions::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write(amount);
}

// Get string representation of ShieldPotions
std::string Item::ShieldPotions::toString() const {
    std::stringstream ss;
    ss << "Item::ShieldPotions { ";
    ss << "amount: ";
    ss << amount;
    ss << " }";
    return ss.str();
}

bool Item::ShieldPotions::operator ==(const Item::ShieldPotions& other) const {
    return amount == other.amount;
}

Item::Ammo::Ammo(int weaponTypeIndex, int amount) : weaponTypeIndex(weaponTypeIndex), amount(amount) { }

// Read Ammo from input stream
Item::Ammo Item::Ammo::readFrom(InputStream& stream) {
    int weaponTypeIndex = stream.readInt();
    int amount = stream.readInt();
    return Item::Ammo(weaponTypeIndex, amount);
}

// Write Ammo to output stream
void Item::Ammo::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write(weaponTypeIndex);
    stream.write(amount);
}

// Get string representation of Ammo
std::string Item::Ammo::toString() const {
    std::stringstream ss;
    ss << "Item::Ammo { ";
    ss << "weaponTypeIndex: ";
    ss << weaponTypeIndex;
    ss << ", ";
    ss << "amount: ";
    ss << amount;
    ss << " }";
    return ss.str();
}

bool Item::Ammo::operator ==(const Item::Ammo& other) const {
    return weaponTypeIndex == other.weaponTypeIndex && amount == other.amount;
}

// Read Item from input stream
std::shared_ptr<Item> Item::readFrom(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return std::shared_ptr<Item::Weapon>(new Item::Weapon(Item::Weapon::readFrom(stream)));
    case 1:
        return std::shared_ptr<Item::ShieldPotions>(new Item::ShieldPotions(Item::ShieldPotions::readFrom(stream)));
    case 2:
        return std::shared_ptr<Item::Ammo>(new Item::Ammo(Item::Ammo::readFrom(stream)));
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

}