#ifndef __MODEL_WEAPON_PROPERTIES_HPP__
#define __MODEL_WEAPON_PROPERTIES_HPP__

#include "Stream.hpp"
#include <optional>
#include <sstream>
#include <string>

namespace model {

// Weapon properties
class WeaponProperties {
public:
    // Name
    std::string name;
    // Shooting speed (number of shots per second)
    double roundsPerSecond;
    // Accuracy (spread angle) of a shot (in degrees)
    double spread;
    // Aiming time
    double aimTime;
    // Field of view in full aim (in degrees)
    double aimFieldOfView;
    // Rotation speed in full aim (degrees per second)
    double aimRotationSpeed;
    // Movement speed modifier in full aim
    double aimMovementSpeedModifier;
    // Speed of projectiles
    double projectileSpeed;
    // Damage of a projectile
    double projectileDamage;
    // Projectiles' life time
    double projectileLifeTime;
    // Index of the sound when shooting (starting with 0), or None
    std::optional<int> shotSoundTypeIndex;
    // Index of the sound when hitting something (starting with 0), or None
    std::optional<int> projectileHitSoundTypeIndex;
    // Max amount of ammo unit can hold in their inventory
    int maxInventoryAmmo;

    WeaponProperties(std::string name, double roundsPerSecond, double spread, double aimTime, double aimFieldOfView, double aimRotationSpeed, double aimMovementSpeedModifier, double projectileSpeed, double projectileDamage, double projectileLifeTime, std::optional<int> shotSoundTypeIndex, std::optional<int> projectileHitSoundTypeIndex, int maxInventoryAmmo);

    // Read WeaponProperties from input stream
    static WeaponProperties readFrom(InputStream& stream);

    // Write WeaponProperties to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of WeaponProperties
    std::string toString() const;
};

}

#endif