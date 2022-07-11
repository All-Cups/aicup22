#ifndef __MODEL_ACTION_ORDER_HPP__
#define __MODEL_ACTION_ORDER_HPP__

#include "Stream.hpp"
#include <memory>
#include <sstream>
#include <string>
#include <variant>

namespace model {


// Pick up loot
class Pickup {
public:
    // Loot id
    int loot;

    Pickup(int loot);

    // Read Pickup from input stream
    static Pickup readFrom(InputStream& stream);

    // Write Pickup to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Pickup
    std::string toString() const;

    bool operator ==(const Pickup& other) const;
};

// Use shield potion
class UseShieldPotion {
public:

    UseShieldPotion();

    // Read UseShieldPotion from input stream
    static UseShieldPotion readFrom(InputStream& stream);

    // Write UseShieldPotion to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of UseShieldPotion
    std::string toString() const;

    bool operator ==(const UseShieldPotion& other) const;
};

// Drop shield potions on the ground
class DropShieldPotions {
public:
    // Amount of potions
    int amount;

    DropShieldPotions(int amount);

    // Read DropShieldPotions from input stream
    static DropShieldPotions readFrom(InputStream& stream);

    // Write DropShieldPotions to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of DropShieldPotions
    std::string toString() const;

    bool operator ==(const DropShieldPotions& other) const;
};

// Drop current weapon
class DropWeapon {
public:

    DropWeapon();

    // Read DropWeapon from input stream
    static DropWeapon readFrom(InputStream& stream);

    // Write DropWeapon to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of DropWeapon
    std::string toString() const;

    bool operator ==(const DropWeapon& other) const;
};

// Drop ammo
class DropAmmo {
public:
    // Weapon type index (starting with 0)
    int weaponTypeIndex;
    // Amount of ammo
    int amount;

    DropAmmo(int weaponTypeIndex, int amount);

    // Read DropAmmo from input stream
    static DropAmmo readFrom(InputStream& stream);

    // Write DropAmmo to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of DropAmmo
    std::string toString() const;

    bool operator ==(const DropAmmo& other) const;
};

// Start/continue aiming
class Aim {
public:
    // Shoot (only possible in full aim)
    bool shoot;

    Aim(bool shoot);

    // Read Aim from input stream
    static Aim readFrom(InputStream& stream);

    // Write Aim to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Aim
    std::string toString() const;

    bool operator ==(const Aim& other) const;
};

// Order to perform an action for unit
typedef std::variant<Pickup, UseShieldPotion, DropShieldPotions, DropWeapon, DropAmmo, Aim> ActionOrder;

// Read ActionOrder from input stream
ActionOrder readActionOrder(InputStream& stream);

// Write ActionOrder to output stream
void writeActionOrder(const ActionOrder& value, OutputStream& stream);

// Get string representation of ActionOrder
std::string actionOrderToString(const ActionOrder& value);

}

#endif