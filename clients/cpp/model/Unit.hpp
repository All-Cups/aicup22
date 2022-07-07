#ifndef __MODEL_UNIT_HPP__
#define __MODEL_UNIT_HPP__

#include "Stream.hpp"
#include "model/Action.hpp"
#include "model/ActionType.hpp"
#include "model/Vec2.hpp"
#include <optional>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace model {

// A unit
class Unit {
public:
    // Unique id
    int id;
    // Id of the player (team) controlling the unit
    int playerId;
    // Current health
    double health;
    // Current shield value
    double shield;
    // Left extra lives of this unit
    int extraLives;
    // Current position of unit's center
    model::Vec2 position;
    // Remaining time until unit will be spawned, or None
    std::optional<double> remainingSpawnTime;
    // Current velocity
    model::Vec2 velocity;
    // Current view direction (vector of length 1)
    model::Vec2 direction;
    // Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
    double aim;
    // Current action unit is performing, or None
    std::optional<model::Action> action;
    // Tick when health regeneration will start (can be less than current game tick)
    int healthRegenerationStartTick;
    // Index of the weapon this unit is holding (starting with 0), or None
    std::optional<int> weapon;
    // Next tick when unit can shoot again (can be less than current game tick)
    int nextShotTick;
    // List of ammo in unit's inventory for every weapon type
    std::vector<int> ammo;
    // Number of shield potions in inventory
    int shieldPotions;

    Unit(int id, int playerId, double health, double shield, int extraLives, model::Vec2 position, std::optional<double> remainingSpawnTime, model::Vec2 velocity, model::Vec2 direction, double aim, std::optional<model::Action> action, int healthRegenerationStartTick, std::optional<int> weapon, int nextShotTick, std::vector<int> ammo, int shieldPotions);

    // Read Unit from input stream
    static Unit readFrom(InputStream& stream);

    // Write Unit to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Unit
    std::string toString() const;
};

}

#endif