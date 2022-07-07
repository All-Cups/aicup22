#ifndef __MODEL_ACTION_ORDER_HPP__
#define __MODEL_ACTION_ORDER_HPP__

#include "Stream.hpp"
#include <memory>
#include <sstream>
#include <string>

namespace model {

// Order to perform an action for unit
class ActionOrder {
public:
    // Pick up loot
    class Pickup;
    // Use shield potion
    class UseShieldPotion;
    // Drop shield potions on the ground
    class DropShieldPotions;
    // Drop current weapon
    class DropWeapon;
    // Drop ammo
    class DropAmmo;
    // Start/continue aiming
    class Aim;

    // Read ActionOrder from input stream
    static std::shared_ptr<ActionOrder> readFrom(InputStream& stream);

    // Write ActionOrder to output stream
    virtual void writeTo(OutputStream& stream) const = 0;

    // Get string representation of ActionOrder
    virtual std::string toString() const = 0;
};

// Pick up loot
class ActionOrder::Pickup : public ActionOrder {
public:
    static const int TAG = 0;

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
class ActionOrder::UseShieldPotion : public ActionOrder {
public:
    static const int TAG = 1;


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
class ActionOrder::DropShieldPotions : public ActionOrder {
public:
    static const int TAG = 2;

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
class ActionOrder::DropWeapon : public ActionOrder {
public:
    static const int TAG = 3;


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
class ActionOrder::DropAmmo : public ActionOrder {
public:
    static const int TAG = 4;

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
class ActionOrder::Aim : public ActionOrder {
public:
    static const int TAG = 5;

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

}

#endif