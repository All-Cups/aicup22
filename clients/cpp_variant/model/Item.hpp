#ifndef __MODEL_ITEM_HPP__
#define __MODEL_ITEM_HPP__

#include "Stream.hpp"
#include <memory>
#include <sstream>
#include <string>
#include <variant>

namespace model {


// Weapon
class Weapon {
public:
    // Weapon type index (starting with 0)
    int typeIndex;

    Weapon(int typeIndex);

    // Read Weapon from input stream
    static Weapon readFrom(InputStream& stream);

    // Write Weapon to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Weapon
    std::string toString() const;

    bool operator ==(const Weapon& other) const;
};

// Shield potions
class ShieldPotions {
public:
    // Amount of potions
    int amount;

    ShieldPotions(int amount);

    // Read ShieldPotions from input stream
    static ShieldPotions readFrom(InputStream& stream);

    // Write ShieldPotions to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of ShieldPotions
    std::string toString() const;

    bool operator ==(const ShieldPotions& other) const;
};

// Ammo
class Ammo {
public:
    // Weapon type index (starting with 0)
    int weaponTypeIndex;
    // Amount of ammo
    int amount;

    Ammo(int weaponTypeIndex, int amount);

    // Read Ammo from input stream
    static Ammo readFrom(InputStream& stream);

    // Write Ammo to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Ammo
    std::string toString() const;

    bool operator ==(const Ammo& other) const;
};

// Lootable item
typedef std::variant<Weapon, ShieldPotions, Ammo> Item;

// Read Item from input stream
Item readItem(InputStream& stream);

// Write Item to output stream
void writeItem(const Item& value, OutputStream& stream);

// Get string representation of Item
std::string itemToString(const Item& value);

}

#endif