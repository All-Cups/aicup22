#include "ActionOrder.hpp"
#include <stdexcept>

namespace model {

ActionOrder::Pickup::Pickup(int loot) : loot(loot) { }

// Read Pickup from input stream
ActionOrder::Pickup ActionOrder::Pickup::readFrom(InputStream& stream) {
    int loot = stream.readInt();
    return ActionOrder::Pickup(loot);
}

// Write Pickup to output stream
void ActionOrder::Pickup::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write(loot);
}

// Get string representation of Pickup
std::string ActionOrder::Pickup::toString() const {
    std::stringstream ss;
    ss << "ActionOrder::Pickup { ";
    ss << "loot: ";
    ss << loot;
    ss << " }";
    return ss.str();
}

bool ActionOrder::Pickup::operator ==(const ActionOrder::Pickup& other) const {
    return loot == other.loot;
}

ActionOrder::UseShieldPotion::UseShieldPotion() { }

// Read UseShieldPotion from input stream
ActionOrder::UseShieldPotion ActionOrder::UseShieldPotion::readFrom(InputStream& stream) {
    return ActionOrder::UseShieldPotion();
}

// Write UseShieldPotion to output stream
void ActionOrder::UseShieldPotion::writeTo(OutputStream& stream) const {
    stream.write(TAG);
}

// Get string representation of UseShieldPotion
std::string ActionOrder::UseShieldPotion::toString() const {
    std::stringstream ss;
    ss << "ActionOrder::UseShieldPotion { ";
    ss << " }";
    return ss.str();
}

bool ActionOrder::UseShieldPotion::operator ==(const ActionOrder::UseShieldPotion& other) const {
    return true;
}

ActionOrder::DropShieldPotions::DropShieldPotions(int amount) : amount(amount) { }

// Read DropShieldPotions from input stream
ActionOrder::DropShieldPotions ActionOrder::DropShieldPotions::readFrom(InputStream& stream) {
    int amount = stream.readInt();
    return ActionOrder::DropShieldPotions(amount);
}

// Write DropShieldPotions to output stream
void ActionOrder::DropShieldPotions::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write(amount);
}

// Get string representation of DropShieldPotions
std::string ActionOrder::DropShieldPotions::toString() const {
    std::stringstream ss;
    ss << "ActionOrder::DropShieldPotions { ";
    ss << "amount: ";
    ss << amount;
    ss << " }";
    return ss.str();
}

bool ActionOrder::DropShieldPotions::operator ==(const ActionOrder::DropShieldPotions& other) const {
    return amount == other.amount;
}

ActionOrder::DropWeapon::DropWeapon() { }

// Read DropWeapon from input stream
ActionOrder::DropWeapon ActionOrder::DropWeapon::readFrom(InputStream& stream) {
    return ActionOrder::DropWeapon();
}

// Write DropWeapon to output stream
void ActionOrder::DropWeapon::writeTo(OutputStream& stream) const {
    stream.write(TAG);
}

// Get string representation of DropWeapon
std::string ActionOrder::DropWeapon::toString() const {
    std::stringstream ss;
    ss << "ActionOrder::DropWeapon { ";
    ss << " }";
    return ss.str();
}

bool ActionOrder::DropWeapon::operator ==(const ActionOrder::DropWeapon& other) const {
    return true;
}

ActionOrder::DropAmmo::DropAmmo(int weaponTypeIndex, int amount) : weaponTypeIndex(weaponTypeIndex), amount(amount) { }

// Read DropAmmo from input stream
ActionOrder::DropAmmo ActionOrder::DropAmmo::readFrom(InputStream& stream) {
    int weaponTypeIndex = stream.readInt();
    int amount = stream.readInt();
    return ActionOrder::DropAmmo(weaponTypeIndex, amount);
}

// Write DropAmmo to output stream
void ActionOrder::DropAmmo::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write(weaponTypeIndex);
    stream.write(amount);
}

// Get string representation of DropAmmo
std::string ActionOrder::DropAmmo::toString() const {
    std::stringstream ss;
    ss << "ActionOrder::DropAmmo { ";
    ss << "weaponTypeIndex: ";
    ss << weaponTypeIndex;
    ss << ", ";
    ss << "amount: ";
    ss << amount;
    ss << " }";
    return ss.str();
}

bool ActionOrder::DropAmmo::operator ==(const ActionOrder::DropAmmo& other) const {
    return weaponTypeIndex == other.weaponTypeIndex && amount == other.amount;
}

ActionOrder::Aim::Aim(bool shoot) : shoot(shoot) { }

// Read Aim from input stream
ActionOrder::Aim ActionOrder::Aim::readFrom(InputStream& stream) {
    bool shoot = stream.readBool();
    return ActionOrder::Aim(shoot);
}

// Write Aim to output stream
void ActionOrder::Aim::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write(shoot);
}

// Get string representation of Aim
std::string ActionOrder::Aim::toString() const {
    std::stringstream ss;
    ss << "ActionOrder::Aim { ";
    ss << "shoot: ";
    ss << shoot;
    ss << " }";
    return ss.str();
}

bool ActionOrder::Aim::operator ==(const ActionOrder::Aim& other) const {
    return shoot == other.shoot;
}

// Read ActionOrder from input stream
std::shared_ptr<ActionOrder> ActionOrder::readFrom(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return std::shared_ptr<ActionOrder::Pickup>(new ActionOrder::Pickup(ActionOrder::Pickup::readFrom(stream)));
    case 1:
        return std::shared_ptr<ActionOrder::UseShieldPotion>(new ActionOrder::UseShieldPotion(ActionOrder::UseShieldPotion::readFrom(stream)));
    case 2:
        return std::shared_ptr<ActionOrder::DropShieldPotions>(new ActionOrder::DropShieldPotions(ActionOrder::DropShieldPotions::readFrom(stream)));
    case 3:
        return std::shared_ptr<ActionOrder::DropWeapon>(new ActionOrder::DropWeapon(ActionOrder::DropWeapon::readFrom(stream)));
    case 4:
        return std::shared_ptr<ActionOrder::DropAmmo>(new ActionOrder::DropAmmo(ActionOrder::DropAmmo::readFrom(stream)));
    case 5:
        return std::shared_ptr<ActionOrder::Aim>(new ActionOrder::Aim(ActionOrder::Aim::readFrom(stream)));
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

}