#ifndef __MODEL_ITEM_HPP__
#define __MODEL_ITEM_HPP__

#include "Stream.hpp"
#include <memory>
#include <sstream>
#include <string>

namespace model {

// Lootable item
class Item {
public:
    // Weapon
    class Weapon;
    // Shield potions
    class ShieldPotions;
    // Ammo
    class Ammo;

    // Read Item from input stream
    static std::shared_ptr<Item> readFrom(InputStream& stream);

    // Write Item to output stream
    virtual void writeTo(OutputStream& stream) const = 0;

    // Get string representation of Item
    virtual std::string toString() const = 0;
};

// Weapon
class Item::Weapon : public Item {
public:
    static const int TAG = 0;

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
class Item::ShieldPotions : public Item {
public:
    static const int TAG = 1;

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
class Item::Ammo : public Item {
public:
    static const int TAG = 2;

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

}

#endif