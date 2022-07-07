#include "WeaponProperties.hpp"

namespace model {

WeaponProperties::WeaponProperties(std::string name, double roundsPerSecond, double spread, double aimTime, double aimFieldOfView, double aimRotationSpeed, double aimMovementSpeedModifier, double projectileSpeed, double projectileDamage, double projectileLifeTime, std::optional<int> shotSoundTypeIndex, std::optional<int> projectileHitSoundTypeIndex, int maxInventoryAmmo) : name(name), roundsPerSecond(roundsPerSecond), spread(spread), aimTime(aimTime), aimFieldOfView(aimFieldOfView), aimRotationSpeed(aimRotationSpeed), aimMovementSpeedModifier(aimMovementSpeedModifier), projectileSpeed(projectileSpeed), projectileDamage(projectileDamage), projectileLifeTime(projectileLifeTime), shotSoundTypeIndex(shotSoundTypeIndex), projectileHitSoundTypeIndex(projectileHitSoundTypeIndex), maxInventoryAmmo(maxInventoryAmmo) { }

// Read WeaponProperties from input stream
WeaponProperties WeaponProperties::readFrom(InputStream& stream) {
    std::string name = stream.readString();
    double roundsPerSecond = stream.readDouble();
    double spread = stream.readDouble();
    double aimTime = stream.readDouble();
    double aimFieldOfView = stream.readDouble();
    double aimRotationSpeed = stream.readDouble();
    double aimMovementSpeedModifier = stream.readDouble();
    double projectileSpeed = stream.readDouble();
    double projectileDamage = stream.readDouble();
    double projectileLifeTime = stream.readDouble();
    std::optional<int> shotSoundTypeIndex = std::optional<int>();
    if (stream.readBool()) {
        int shotSoundTypeIndexValue = stream.readInt();
        shotSoundTypeIndex.emplace(shotSoundTypeIndexValue);
    }
    std::optional<int> projectileHitSoundTypeIndex = std::optional<int>();
    if (stream.readBool()) {
        int projectileHitSoundTypeIndexValue = stream.readInt();
        projectileHitSoundTypeIndex.emplace(projectileHitSoundTypeIndexValue);
    }
    int maxInventoryAmmo = stream.readInt();
    return WeaponProperties(name, roundsPerSecond, spread, aimTime, aimFieldOfView, aimRotationSpeed, aimMovementSpeedModifier, projectileSpeed, projectileDamage, projectileLifeTime, shotSoundTypeIndex, projectileHitSoundTypeIndex, maxInventoryAmmo);
}

// Write WeaponProperties to output stream
void WeaponProperties::writeTo(OutputStream& stream) const {
    stream.write(name);
    stream.write(roundsPerSecond);
    stream.write(spread);
    stream.write(aimTime);
    stream.write(aimFieldOfView);
    stream.write(aimRotationSpeed);
    stream.write(aimMovementSpeedModifier);
    stream.write(projectileSpeed);
    stream.write(projectileDamage);
    stream.write(projectileLifeTime);
    if (shotSoundTypeIndex) {
        stream.write(true);
        const int& shotSoundTypeIndexValue = *shotSoundTypeIndex;
        stream.write(shotSoundTypeIndexValue);
    } else {
        stream.write(false);
    }
    if (projectileHitSoundTypeIndex) {
        stream.write(true);
        const int& projectileHitSoundTypeIndexValue = *projectileHitSoundTypeIndex;
        stream.write(projectileHitSoundTypeIndexValue);
    } else {
        stream.write(false);
    }
    stream.write(maxInventoryAmmo);
}

// Get string representation of WeaponProperties
std::string WeaponProperties::toString() const {
    std::stringstream ss;
    ss << "WeaponProperties { ";
    ss << "name: ";
    ss << '"' << name << '"';
    ss << ", ";
    ss << "roundsPerSecond: ";
    ss << roundsPerSecond;
    ss << ", ";
    ss << "spread: ";
    ss << spread;
    ss << ", ";
    ss << "aimTime: ";
    ss << aimTime;
    ss << ", ";
    ss << "aimFieldOfView: ";
    ss << aimFieldOfView;
    ss << ", ";
    ss << "aimRotationSpeed: ";
    ss << aimRotationSpeed;
    ss << ", ";
    ss << "aimMovementSpeedModifier: ";
    ss << aimMovementSpeedModifier;
    ss << ", ";
    ss << "projectileSpeed: ";
    ss << projectileSpeed;
    ss << ", ";
    ss << "projectileDamage: ";
    ss << projectileDamage;
    ss << ", ";
    ss << "projectileLifeTime: ";
    ss << projectileLifeTime;
    ss << ", ";
    ss << "shotSoundTypeIndex: ";
    if (shotSoundTypeIndex) {
        const int& shotSoundTypeIndexValue = *shotSoundTypeIndex;
        ss << shotSoundTypeIndexValue;
    } else {
        ss << "none";
    }
    ss << ", ";
    ss << "projectileHitSoundTypeIndex: ";
    if (projectileHitSoundTypeIndex) {
        const int& projectileHitSoundTypeIndexValue = *projectileHitSoundTypeIndex;
        ss << projectileHitSoundTypeIndexValue;
    } else {
        ss << "none";
    }
    ss << ", ";
    ss << "maxInventoryAmmo: ";
    ss << maxInventoryAmmo;
    ss << " }";
    return ss.str();
}

}