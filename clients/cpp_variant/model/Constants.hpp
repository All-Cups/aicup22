#ifndef __MODEL_CONSTANTS_HPP__
#define __MODEL_CONSTANTS_HPP__

#include "Stream.hpp"
#include "model/Obstacle.hpp"
#include "model/SoundProperties.hpp"
#include "model/Vec2.hpp"
#include "model/WeaponProperties.hpp"
#include <optional>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace model {

// Non changing game state
class Constants {
public:
    // Number of ticks per game second
    double ticksPerSecond;
    // Starting number of units in each team
    int teamSize;
    // Initial zone radius
    double initialZoneRadius;
    // Speed of zone radius
    double zoneSpeed;
    // Damage dealt to units outside of the zone per second
    double zoneDamagePerSecond;
    // Unit spawning time
    double spawnTime;
    // Damage dealt to units trying to spawn in incorrect position per second
    double spawnCollisionDamagePerSecond;
    // Time required to perform looting actions (in seconds)
    double lootingTime;
    // Number of bot players (teams)
    int botPlayers;
    // Units' radius
    double unitRadius;
    // Max units' health
    double unitHealth;
    // Health automatically restored per second
    double healthRegenerationPerSecond;
    // Time until automatic health regeneration since last health damage (in seconds)
    double healthRegenerationDelay;
    // Max value of unit's shield
    double maxShield;
    // Initial value of unit's shield
    double spawnShield;
    // Initial number of extra lives for units
    int extraLives;
    // Zone radius after which respawning is disabled
    double lastRespawnZoneRadius;
    // Units' field of view without aiming (in degrees)
    double fieldOfView;
    // Units' view distance
    double viewDistance;
    // Whether units' view is blocked by obstacles
    bool viewBlocking;
    // Unit rotation speed without aiming (degrees per second)
    double rotationSpeed;
    // Units' movement speed while spawning
    double spawnMovementSpeed;
    // Max unit speed when walking forward
    double maxUnitForwardSpeed;
    // Max unit speed when walking backward
    double maxUnitBackwardSpeed;
    // Max unit acceleration
    double unitAcceleration;
    // Whether a unit can damage units of the same team
    bool friendlyFire;
    // Score given for killing enemy unit
    double killScore;
    // Score multiplier for damaging enemy units
    double damageScoreMultiplier;
    // Score given for every team killed before you
    double scorePerPlace;
    // List of properties of every weapon type
    std::vector<model::WeaponProperties> weapons;
    // Starting weapon with which units spawn, or None
    std::optional<int> startingWeapon;
    // Ammo for starting weapon given when unit spawns
    int startingWeaponAmmo;
    // Max number of shield potions in unit's inventory
    int maxShieldPotionsInInventory;
    // Amount of shield restored using one potion
    double shieldPerPotion;
    // Time required to perform action of using shield potion
    double shieldPotionUseTime;
    // List of properties of every sound type
    std::vector<model::SoundProperties> sounds;
    // Sound type index when moving (starting with 0), or None
    std::optional<int> stepsSoundTypeIndex;
    // Distance when steps sound will be 100% probability
    double stepsSoundTravelDistance;
    // List of obstacles on the map
    std::vector<model::Obstacle> obstacles;

    Constants(double ticksPerSecond, int teamSize, double initialZoneRadius, double zoneSpeed, double zoneDamagePerSecond, double spawnTime, double spawnCollisionDamagePerSecond, double lootingTime, int botPlayers, double unitRadius, double unitHealth, double healthRegenerationPerSecond, double healthRegenerationDelay, double maxShield, double spawnShield, int extraLives, double lastRespawnZoneRadius, double fieldOfView, double viewDistance, bool viewBlocking, double rotationSpeed, double spawnMovementSpeed, double maxUnitForwardSpeed, double maxUnitBackwardSpeed, double unitAcceleration, bool friendlyFire, double killScore, double damageScoreMultiplier, double scorePerPlace, std::vector<model::WeaponProperties> weapons, std::optional<int> startingWeapon, int startingWeaponAmmo, int maxShieldPotionsInInventory, double shieldPerPotion, double shieldPotionUseTime, std::vector<model::SoundProperties> sounds, std::optional<int> stepsSoundTypeIndex, double stepsSoundTravelDistance, std::vector<model::Obstacle> obstacles);

    // Read Constants from input stream
    static Constants readFrom(InputStream& stream);

    // Write Constants to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Constants
    std::string toString() const;
};

}

#endif