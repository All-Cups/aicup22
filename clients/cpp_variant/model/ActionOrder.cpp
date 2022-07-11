#include "ActionOrder.hpp"
#include <stdexcept>

namespace model {

Pickup::Pickup(int loot) : loot(loot) { }

// Read Pickup from input stream
Pickup Pickup::readFrom(InputStream& stream) {
    int loot = stream.readInt();
    return Pickup(loot);
}

// Write Pickup to output stream
void Pickup::writeTo(OutputStream& stream) const {
    stream.write(loot);
}

// Get string representation of Pickup
std::string Pickup::toString() const {
    std::stringstream ss;
    ss << "Pickup { ";
    ss << "loot: ";
    ss << loot;
    ss << " }";
    return ss.str();
}

bool Pickup::operator ==(const Pickup& other) const {
    return loot == other.loot;
}

UseShieldPotion::UseShieldPotion() { }

// Read UseShieldPotion from input stream
UseShieldPotion UseShieldPotion::readFrom(InputStream& stream) {
    return UseShieldPotion();
}

// Write UseShieldPotion to output stream
void UseShieldPotion::writeTo(OutputStream& stream) const {
}

// Get string representation of UseShieldPotion
std::string UseShieldPotion::toString() const {
    std::stringstream ss;
    ss << "UseShieldPotion { ";
    ss << " }";
    return ss.str();
}

bool UseShieldPotion::operator ==(const UseShieldPotion& other) const {
    return true;
}

DropShieldPotions::DropShieldPotions(int amount) : amount(amount) { }

// Read DropShieldPotions from input stream
DropShieldPotions DropShieldPotions::readFrom(InputStream& stream) {
    int amount = stream.readInt();
    return DropShieldPotions(amount);
}

// Write DropShieldPotions to output stream
void DropShieldPotions::writeTo(OutputStream& stream) const {
    stream.write(amount);
}

// Get string representation of DropShieldPotions
std::string DropShieldPotions::toString() const {
    std::stringstream ss;
    ss << "DropShieldPotions { ";
    ss << "amount: ";
    ss << amount;
    ss << " }";
    return ss.str();
}

bool DropShieldPotions::operator ==(const DropShieldPotions& other) const {
    return amount == other.amount;
}

DropWeapon::DropWeapon() { }

// Read DropWeapon from input stream
DropWeapon DropWeapon::readFrom(InputStream& stream) {
    return DropWeapon();
}

// Write DropWeapon to output stream
void DropWeapon::writeTo(OutputStream& stream) const {
}

// Get string representation of DropWeapon
std::string DropWeapon::toString() const {
    std::stringstream ss;
    ss << "DropWeapon { ";
    ss << " }";
    return ss.str();
}

bool DropWeapon::operator ==(const DropWeapon& other) const {
    return true;
}

DropAmmo::DropAmmo(int weaponTypeIndex, int amount) : weaponTypeIndex(weaponTypeIndex), amount(amount) { }

// Read DropAmmo from input stream
DropAmmo DropAmmo::readFrom(InputStream& stream) {
    int weaponTypeIndex = stream.readInt();
    int amount = stream.readInt();
    return DropAmmo(weaponTypeIndex, amount);
}

// Write DropAmmo to output stream
void DropAmmo::writeTo(OutputStream& stream) const {
    stream.write(weaponTypeIndex);
    stream.write(amount);
}

// Get string representation of DropAmmo
std::string DropAmmo::toString() const {
    std::stringstream ss;
    ss << "DropAmmo { ";
    ss << "weaponTypeIndex: ";
    ss << weaponTypeIndex;
    ss << ", ";
    ss << "amount: ";
    ss << amount;
    ss << " }";
    return ss.str();
}

bool DropAmmo::operator ==(const DropAmmo& other) const {
    return weaponTypeIndex == other.weaponTypeIndex && amount == other.amount;
}

Aim::Aim(bool shoot) : shoot(shoot) { }

// Read Aim from input stream
Aim Aim::readFrom(InputStream& stream) {
    bool shoot = stream.readBool();
    return Aim(shoot);
}

// Write Aim to output stream
void Aim::writeTo(OutputStream& stream) const {
    stream.write(shoot);
}

// Get string representation of Aim
std::string Aim::toString() const {
    std::stringstream ss;
    ss << "Aim { ";
    ss << "shoot: ";
    ss << shoot;
    ss << " }";
    return ss.str();
}

bool Aim::operator ==(const Aim& other) const {
    return shoot == other.shoot;
}

    
// Read ActionOrder from input stream
ActionOrder readActionOrder(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return Pickup::readFrom(stream);
    case 1:
        return UseShieldPotion::readFrom(stream);
    case 2:
        return DropShieldPotions::readFrom(stream);
    case 3:
        return DropWeapon::readFrom(stream);
    case 4:
        return DropAmmo::readFrom(stream);
    case 5:
        return Aim::readFrom(stream);
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

// Write ActionOrder to output stream
void writeActionOrder(const ActionOrder& value, OutputStream& stream) {
    std::visit([&](auto& arg) {
        using T = std::decay_t<decltype(arg)>;
        if constexpr (std::is_same_v<T, Pickup>) {
            stream.write((int) 0);
        }
        if constexpr (std::is_same_v<T, UseShieldPotion>) {
            stream.write((int) 1);
        }
        if constexpr (std::is_same_v<T, DropShieldPotions>) {
            stream.write((int) 2);
        }
        if constexpr (std::is_same_v<T, DropWeapon>) {
            stream.write((int) 3);
        }
        if constexpr (std::is_same_v<T, DropAmmo>) {
            stream.write((int) 4);
        }
        if constexpr (std::is_same_v<T, Aim>) {
            stream.write((int) 5);
        }
        arg.writeTo(stream);
    }, value);
}

// Get string representation of ActionOrder
std::string actionOrderToString(const ActionOrder& value) {
    return std::visit([](auto& arg) {
        return arg.toString();
    }, value);
}


}