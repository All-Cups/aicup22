#include "Item.hpp"
#include <stdexcept>

namespace model {

Weapon::Weapon(int typeIndex) : typeIndex(typeIndex) { }

// Read Weapon from input stream
Weapon Weapon::readFrom(InputStream& stream) {
    int typeIndex = stream.readInt();
    return Weapon(typeIndex);
}

// Write Weapon to output stream
void Weapon::writeTo(OutputStream& stream) const {
    stream.write(typeIndex);
}

// Get string representation of Weapon
std::string Weapon::toString() const {
    std::stringstream ss;
    ss << "Weapon { ";
    ss << "typeIndex: ";
    ss << typeIndex;
    ss << " }";
    return ss.str();
}

bool Weapon::operator ==(const Weapon& other) const {
    return typeIndex == other.typeIndex;
}

ShieldPotions::ShieldPotions(int amount) : amount(amount) { }

// Read ShieldPotions from input stream
ShieldPotions ShieldPotions::readFrom(InputStream& stream) {
    int amount = stream.readInt();
    return ShieldPotions(amount);
}

// Write ShieldPotions to output stream
void ShieldPotions::writeTo(OutputStream& stream) const {
    stream.write(amount);
}

// Get string representation of ShieldPotions
std::string ShieldPotions::toString() const {
    std::stringstream ss;
    ss << "ShieldPotions { ";
    ss << "amount: ";
    ss << amount;
    ss << " }";
    return ss.str();
}

bool ShieldPotions::operator ==(const ShieldPotions& other) const {
    return amount == other.amount;
}

Ammo::Ammo(int weaponTypeIndex, int amount) : weaponTypeIndex(weaponTypeIndex), amount(amount) { }

// Read Ammo from input stream
Ammo Ammo::readFrom(InputStream& stream) {
    int weaponTypeIndex = stream.readInt();
    int amount = stream.readInt();
    return Ammo(weaponTypeIndex, amount);
}

// Write Ammo to output stream
void Ammo::writeTo(OutputStream& stream) const {
    stream.write(weaponTypeIndex);
    stream.write(amount);
}

// Get string representation of Ammo
std::string Ammo::toString() const {
    std::stringstream ss;
    ss << "Ammo { ";
    ss << "weaponTypeIndex: ";
    ss << weaponTypeIndex;
    ss << ", ";
    ss << "amount: ";
    ss << amount;
    ss << " }";
    return ss.str();
}

bool Ammo::operator ==(const Ammo& other) const {
    return weaponTypeIndex == other.weaponTypeIndex && amount == other.amount;
}

    
// Read Item from input stream
Item readItem(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return Weapon::readFrom(stream);
    case 1:
        return ShieldPotions::readFrom(stream);
    case 2:
        return Ammo::readFrom(stream);
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

// Write Item to output stream
void writeItem(const Item& value, OutputStream& stream) {
    std::visit([&](auto& arg) {
        using T = std::decay_t<decltype(arg)>;
        if constexpr (std::is_same_v<T, Weapon>) {
            stream.write((int) 0);
        }
        if constexpr (std::is_same_v<T, ShieldPotions>) {
            stream.write((int) 1);
        }
        if constexpr (std::is_same_v<T, Ammo>) {
            stream.write((int) 2);
        }
        arg.writeTo(stream);
    }, value);
}

// Get string representation of Item
std::string itemToString(const Item& value) {
    return std::visit([](auto& arg) {
        return arg.toString();
    }, value);
}


}