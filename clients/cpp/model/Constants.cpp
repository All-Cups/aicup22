#include "Constants.hpp"

namespace model {

Constants::Constants(double ticksPerSecond, int teamSize, double initialZoneRadius, double zoneSpeed, double zoneDamagePerSecond, double spawnTime, double spawnCollisionDamagePerSecond, double lootingTime, int botPlayers, double unitRadius, double unitHealth, double healthRegenerationPerSecond, double healthRegenerationDelay, double maxShield, double spawnShield, int extraLives, double lastRespawnZoneRadius, double fieldOfView, double viewDistance, bool viewBlocking, double rotationSpeed, double spawnMovementSpeed, double maxUnitForwardSpeed, double maxUnitBackwardSpeed, double unitAcceleration, bool friendlyFire, double killScore, double damageScoreMultiplier, double scorePerPlace, std::vector<model::WeaponProperties> weapons, std::optional<int> startingWeapon, int startingWeaponAmmo, int maxShieldPotionsInInventory, double shieldPerPotion, double shieldPotionUseTime, std::vector<model::SoundProperties> sounds, std::optional<int> stepsSoundTypeIndex, double stepsSoundTravelDistance, std::vector<model::Obstacle> obstacles) : ticksPerSecond(ticksPerSecond), teamSize(teamSize), initialZoneRadius(initialZoneRadius), zoneSpeed(zoneSpeed), zoneDamagePerSecond(zoneDamagePerSecond), spawnTime(spawnTime), spawnCollisionDamagePerSecond(spawnCollisionDamagePerSecond), lootingTime(lootingTime), botPlayers(botPlayers), unitRadius(unitRadius), unitHealth(unitHealth), healthRegenerationPerSecond(healthRegenerationPerSecond), healthRegenerationDelay(healthRegenerationDelay), maxShield(maxShield), spawnShield(spawnShield), extraLives(extraLives), lastRespawnZoneRadius(lastRespawnZoneRadius), fieldOfView(fieldOfView), viewDistance(viewDistance), viewBlocking(viewBlocking), rotationSpeed(rotationSpeed), spawnMovementSpeed(spawnMovementSpeed), maxUnitForwardSpeed(maxUnitForwardSpeed), maxUnitBackwardSpeed(maxUnitBackwardSpeed), unitAcceleration(unitAcceleration), friendlyFire(friendlyFire), killScore(killScore), damageScoreMultiplier(damageScoreMultiplier), scorePerPlace(scorePerPlace), weapons(weapons), startingWeapon(startingWeapon), startingWeaponAmmo(startingWeaponAmmo), maxShieldPotionsInInventory(maxShieldPotionsInInventory), shieldPerPotion(shieldPerPotion), shieldPotionUseTime(shieldPotionUseTime), sounds(sounds), stepsSoundTypeIndex(stepsSoundTypeIndex), stepsSoundTravelDistance(stepsSoundTravelDistance), obstacles(obstacles) { }

// Read Constants from input stream
Constants Constants::readFrom(InputStream& stream) {
    double ticksPerSecond = stream.readDouble();
    int teamSize = stream.readInt();
    double initialZoneRadius = stream.readDouble();
    double zoneSpeed = stream.readDouble();
    double zoneDamagePerSecond = stream.readDouble();
    double spawnTime = stream.readDouble();
    double spawnCollisionDamagePerSecond = stream.readDouble();
    double lootingTime = stream.readDouble();
    int botPlayers = stream.readInt();
    double unitRadius = stream.readDouble();
    double unitHealth = stream.readDouble();
    double healthRegenerationPerSecond = stream.readDouble();
    double healthRegenerationDelay = stream.readDouble();
    double maxShield = stream.readDouble();
    double spawnShield = stream.readDouble();
    int extraLives = stream.readInt();
    double lastRespawnZoneRadius = stream.readDouble();
    double fieldOfView = stream.readDouble();
    double viewDistance = stream.readDouble();
    bool viewBlocking = stream.readBool();
    double rotationSpeed = stream.readDouble();
    double spawnMovementSpeed = stream.readDouble();
    double maxUnitForwardSpeed = stream.readDouble();
    double maxUnitBackwardSpeed = stream.readDouble();
    double unitAcceleration = stream.readDouble();
    bool friendlyFire = stream.readBool();
    double killScore = stream.readDouble();
    double damageScoreMultiplier = stream.readDouble();
    double scorePerPlace = stream.readDouble();
    std::vector<model::WeaponProperties> weapons = std::vector<model::WeaponProperties>();
    size_t weaponsSize = stream.readInt();
    weapons.reserve(weaponsSize);
    for (size_t weaponsIndex = 0; weaponsIndex < weaponsSize; weaponsIndex++) {
        model::WeaponProperties weaponsElement = model::WeaponProperties::readFrom(stream);
        weapons.emplace_back(weaponsElement);
    }
    std::optional<int> startingWeapon = std::optional<int>();
    if (stream.readBool()) {
        int startingWeaponValue = stream.readInt();
        startingWeapon.emplace(startingWeaponValue);
    }
    int startingWeaponAmmo = stream.readInt();
    int maxShieldPotionsInInventory = stream.readInt();
    double shieldPerPotion = stream.readDouble();
    double shieldPotionUseTime = stream.readDouble();
    std::vector<model::SoundProperties> sounds = std::vector<model::SoundProperties>();
    size_t soundsSize = stream.readInt();
    sounds.reserve(soundsSize);
    for (size_t soundsIndex = 0; soundsIndex < soundsSize; soundsIndex++) {
        model::SoundProperties soundsElement = model::SoundProperties::readFrom(stream);
        sounds.emplace_back(soundsElement);
    }
    std::optional<int> stepsSoundTypeIndex = std::optional<int>();
    if (stream.readBool()) {
        int stepsSoundTypeIndexValue = stream.readInt();
        stepsSoundTypeIndex.emplace(stepsSoundTypeIndexValue);
    }
    double stepsSoundTravelDistance = stream.readDouble();
    std::vector<model::Obstacle> obstacles = std::vector<model::Obstacle>();
    size_t obstaclesSize = stream.readInt();
    obstacles.reserve(obstaclesSize);
    for (size_t obstaclesIndex = 0; obstaclesIndex < obstaclesSize; obstaclesIndex++) {
        model::Obstacle obstaclesElement = model::Obstacle::readFrom(stream);
        obstacles.emplace_back(obstaclesElement);
    }
    return Constants(ticksPerSecond, teamSize, initialZoneRadius, zoneSpeed, zoneDamagePerSecond, spawnTime, spawnCollisionDamagePerSecond, lootingTime, botPlayers, unitRadius, unitHealth, healthRegenerationPerSecond, healthRegenerationDelay, maxShield, spawnShield, extraLives, lastRespawnZoneRadius, fieldOfView, viewDistance, viewBlocking, rotationSpeed, spawnMovementSpeed, maxUnitForwardSpeed, maxUnitBackwardSpeed, unitAcceleration, friendlyFire, killScore, damageScoreMultiplier, scorePerPlace, weapons, startingWeapon, startingWeaponAmmo, maxShieldPotionsInInventory, shieldPerPotion, shieldPotionUseTime, sounds, stepsSoundTypeIndex, stepsSoundTravelDistance, obstacles);
}

// Write Constants to output stream
void Constants::writeTo(OutputStream& stream) const {
    stream.write(ticksPerSecond);
    stream.write(teamSize);
    stream.write(initialZoneRadius);
    stream.write(zoneSpeed);
    stream.write(zoneDamagePerSecond);
    stream.write(spawnTime);
    stream.write(spawnCollisionDamagePerSecond);
    stream.write(lootingTime);
    stream.write(botPlayers);
    stream.write(unitRadius);
    stream.write(unitHealth);
    stream.write(healthRegenerationPerSecond);
    stream.write(healthRegenerationDelay);
    stream.write(maxShield);
    stream.write(spawnShield);
    stream.write(extraLives);
    stream.write(lastRespawnZoneRadius);
    stream.write(fieldOfView);
    stream.write(viewDistance);
    stream.write(viewBlocking);
    stream.write(rotationSpeed);
    stream.write(spawnMovementSpeed);
    stream.write(maxUnitForwardSpeed);
    stream.write(maxUnitBackwardSpeed);
    stream.write(unitAcceleration);
    stream.write(friendlyFire);
    stream.write(killScore);
    stream.write(damageScoreMultiplier);
    stream.write(scorePerPlace);
    stream.write((int)(weapons.size()));
    for (const model::WeaponProperties& weaponsElement : weapons) {
        weaponsElement.writeTo(stream);
    }
    if (startingWeapon) {
        stream.write(true);
        const int& startingWeaponValue = *startingWeapon;
        stream.write(startingWeaponValue);
    } else {
        stream.write(false);
    }
    stream.write(startingWeaponAmmo);
    stream.write(maxShieldPotionsInInventory);
    stream.write(shieldPerPotion);
    stream.write(shieldPotionUseTime);
    stream.write((int)(sounds.size()));
    for (const model::SoundProperties& soundsElement : sounds) {
        soundsElement.writeTo(stream);
    }
    if (stepsSoundTypeIndex) {
        stream.write(true);
        const int& stepsSoundTypeIndexValue = *stepsSoundTypeIndex;
        stream.write(stepsSoundTypeIndexValue);
    } else {
        stream.write(false);
    }
    stream.write(stepsSoundTravelDistance);
    stream.write((int)(obstacles.size()));
    for (const model::Obstacle& obstaclesElement : obstacles) {
        obstaclesElement.writeTo(stream);
    }
}

// Get string representation of Constants
std::string Constants::toString() const {
    std::stringstream ss;
    ss << "Constants { ";
    ss << "ticksPerSecond: ";
    ss << ticksPerSecond;
    ss << ", ";
    ss << "teamSize: ";
    ss << teamSize;
    ss << ", ";
    ss << "initialZoneRadius: ";
    ss << initialZoneRadius;
    ss << ", ";
    ss << "zoneSpeed: ";
    ss << zoneSpeed;
    ss << ", ";
    ss << "zoneDamagePerSecond: ";
    ss << zoneDamagePerSecond;
    ss << ", ";
    ss << "spawnTime: ";
    ss << spawnTime;
    ss << ", ";
    ss << "spawnCollisionDamagePerSecond: ";
    ss << spawnCollisionDamagePerSecond;
    ss << ", ";
    ss << "lootingTime: ";
    ss << lootingTime;
    ss << ", ";
    ss << "botPlayers: ";
    ss << botPlayers;
    ss << ", ";
    ss << "unitRadius: ";
    ss << unitRadius;
    ss << ", ";
    ss << "unitHealth: ";
    ss << unitHealth;
    ss << ", ";
    ss << "healthRegenerationPerSecond: ";
    ss << healthRegenerationPerSecond;
    ss << ", ";
    ss << "healthRegenerationDelay: ";
    ss << healthRegenerationDelay;
    ss << ", ";
    ss << "maxShield: ";
    ss << maxShield;
    ss << ", ";
    ss << "spawnShield: ";
    ss << spawnShield;
    ss << ", ";
    ss << "extraLives: ";
    ss << extraLives;
    ss << ", ";
    ss << "lastRespawnZoneRadius: ";
    ss << lastRespawnZoneRadius;
    ss << ", ";
    ss << "fieldOfView: ";
    ss << fieldOfView;
    ss << ", ";
    ss << "viewDistance: ";
    ss << viewDistance;
    ss << ", ";
    ss << "viewBlocking: ";
    ss << viewBlocking;
    ss << ", ";
    ss << "rotationSpeed: ";
    ss << rotationSpeed;
    ss << ", ";
    ss << "spawnMovementSpeed: ";
    ss << spawnMovementSpeed;
    ss << ", ";
    ss << "maxUnitForwardSpeed: ";
    ss << maxUnitForwardSpeed;
    ss << ", ";
    ss << "maxUnitBackwardSpeed: ";
    ss << maxUnitBackwardSpeed;
    ss << ", ";
    ss << "unitAcceleration: ";
    ss << unitAcceleration;
    ss << ", ";
    ss << "friendlyFire: ";
    ss << friendlyFire;
    ss << ", ";
    ss << "killScore: ";
    ss << killScore;
    ss << ", ";
    ss << "damageScoreMultiplier: ";
    ss << damageScoreMultiplier;
    ss << ", ";
    ss << "scorePerPlace: ";
    ss << scorePerPlace;
    ss << ", ";
    ss << "weapons: ";
    ss << "[ ";
    for (size_t weaponsIndex = 0; weaponsIndex < weapons.size(); weaponsIndex++) {
        const model::WeaponProperties& weaponsElement = weapons[weaponsIndex];
        if (weaponsIndex != 0) {
            ss << ", ";
        }
        ss << weaponsElement.toString();
    }
    ss << " ]";
    ss << ", ";
    ss << "startingWeapon: ";
    if (startingWeapon) {
        const int& startingWeaponValue = *startingWeapon;
        ss << startingWeaponValue;
    } else {
        ss << "none";
    }
    ss << ", ";
    ss << "startingWeaponAmmo: ";
    ss << startingWeaponAmmo;
    ss << ", ";
    ss << "maxShieldPotionsInInventory: ";
    ss << maxShieldPotionsInInventory;
    ss << ", ";
    ss << "shieldPerPotion: ";
    ss << shieldPerPotion;
    ss << ", ";
    ss << "shieldPotionUseTime: ";
    ss << shieldPotionUseTime;
    ss << ", ";
    ss << "sounds: ";
    ss << "[ ";
    for (size_t soundsIndex = 0; soundsIndex < sounds.size(); soundsIndex++) {
        const model::SoundProperties& soundsElement = sounds[soundsIndex];
        if (soundsIndex != 0) {
            ss << ", ";
        }
        ss << soundsElement.toString();
    }
    ss << " ]";
    ss << ", ";
    ss << "stepsSoundTypeIndex: ";
    if (stepsSoundTypeIndex) {
        const int& stepsSoundTypeIndexValue = *stepsSoundTypeIndex;
        ss << stepsSoundTypeIndexValue;
    } else {
        ss << "none";
    }
    ss << ", ";
    ss << "stepsSoundTravelDistance: ";
    ss << stepsSoundTravelDistance;
    ss << ", ";
    ss << "obstacles: ";
    ss << "[ ";
    for (size_t obstaclesIndex = 0; obstaclesIndex < obstacles.size(); obstaclesIndex++) {
        const model::Obstacle& obstaclesElement = obstacles[obstaclesIndex];
        if (obstaclesIndex != 0) {
            ss << ", ";
        }
        ss << obstaclesElement.toString();
    }
    ss << " ]";
    ss << " }";
    return ss.str();
}

}