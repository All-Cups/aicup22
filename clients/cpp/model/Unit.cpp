#include "Unit.hpp"

namespace model {

Unit::Unit(int id, int playerId, double health, double shield, int extraLives, model::Vec2 position, std::optional<double> remainingSpawnTime, model::Vec2 velocity, model::Vec2 direction, double aim, std::optional<model::Action> action, int healthRegenerationStartTick, std::optional<int> weapon, int nextShotTick, std::vector<int> ammo, int shieldPotions) : id(id), playerId(playerId), health(health), shield(shield), extraLives(extraLives), position(position), remainingSpawnTime(remainingSpawnTime), velocity(velocity), direction(direction), aim(aim), action(action), healthRegenerationStartTick(healthRegenerationStartTick), weapon(weapon), nextShotTick(nextShotTick), ammo(ammo), shieldPotions(shieldPotions) { }

// Read Unit from input stream
Unit Unit::readFrom(InputStream& stream) {
    int id = stream.readInt();
    int playerId = stream.readInt();
    double health = stream.readDouble();
    double shield = stream.readDouble();
    int extraLives = stream.readInt();
    model::Vec2 position = model::Vec2::readFrom(stream);
    std::optional<double> remainingSpawnTime = std::optional<double>();
    if (stream.readBool()) {
        double remainingSpawnTimeValue = stream.readDouble();
        remainingSpawnTime.emplace(remainingSpawnTimeValue);
    }
    model::Vec2 velocity = model::Vec2::readFrom(stream);
    model::Vec2 direction = model::Vec2::readFrom(stream);
    double aim = stream.readDouble();
    std::optional<model::Action> action = std::optional<model::Action>();
    if (stream.readBool()) {
        model::Action actionValue = model::Action::readFrom(stream);
        action.emplace(actionValue);
    }
    int healthRegenerationStartTick = stream.readInt();
    std::optional<int> weapon = std::optional<int>();
    if (stream.readBool()) {
        int weaponValue = stream.readInt();
        weapon.emplace(weaponValue);
    }
    int nextShotTick = stream.readInt();
    std::vector<int> ammo = std::vector<int>();
    size_t ammoSize = stream.readInt();
    ammo.reserve(ammoSize);
    for (size_t ammoIndex = 0; ammoIndex < ammoSize; ammoIndex++) {
        int ammoElement = stream.readInt();
        ammo.emplace_back(ammoElement);
    }
    int shieldPotions = stream.readInt();
    return Unit(id, playerId, health, shield, extraLives, position, remainingSpawnTime, velocity, direction, aim, action, healthRegenerationStartTick, weapon, nextShotTick, ammo, shieldPotions);
}

// Write Unit to output stream
void Unit::writeTo(OutputStream& stream) const {
    stream.write(id);
    stream.write(playerId);
    stream.write(health);
    stream.write(shield);
    stream.write(extraLives);
    position.writeTo(stream);
    if (remainingSpawnTime) {
        stream.write(true);
        const double& remainingSpawnTimeValue = *remainingSpawnTime;
        stream.write(remainingSpawnTimeValue);
    } else {
        stream.write(false);
    }
    velocity.writeTo(stream);
    direction.writeTo(stream);
    stream.write(aim);
    if (action) {
        stream.write(true);
        const model::Action& actionValue = *action;
        actionValue.writeTo(stream);
    } else {
        stream.write(false);
    }
    stream.write(healthRegenerationStartTick);
    if (weapon) {
        stream.write(true);
        const int& weaponValue = *weapon;
        stream.write(weaponValue);
    } else {
        stream.write(false);
    }
    stream.write(nextShotTick);
    stream.write((int)(ammo.size()));
    for (const int& ammoElement : ammo) {
        stream.write(ammoElement);
    }
    stream.write(shieldPotions);
}

// Get string representation of Unit
std::string Unit::toString() const {
    std::stringstream ss;
    ss << "Unit { ";
    ss << "id: ";
    ss << id;
    ss << ", ";
    ss << "playerId: ";
    ss << playerId;
    ss << ", ";
    ss << "health: ";
    ss << health;
    ss << ", ";
    ss << "shield: ";
    ss << shield;
    ss << ", ";
    ss << "extraLives: ";
    ss << extraLives;
    ss << ", ";
    ss << "position: ";
    ss << position.toString();
    ss << ", ";
    ss << "remainingSpawnTime: ";
    if (remainingSpawnTime) {
        const double& remainingSpawnTimeValue = *remainingSpawnTime;
        ss << remainingSpawnTimeValue;
    } else {
        ss << "none";
    }
    ss << ", ";
    ss << "velocity: ";
    ss << velocity.toString();
    ss << ", ";
    ss << "direction: ";
    ss << direction.toString();
    ss << ", ";
    ss << "aim: ";
    ss << aim;
    ss << ", ";
    ss << "action: ";
    if (action) {
        const model::Action& actionValue = *action;
        ss << actionValue.toString();
    } else {
        ss << "none";
    }
    ss << ", ";
    ss << "healthRegenerationStartTick: ";
    ss << healthRegenerationStartTick;
    ss << ", ";
    ss << "weapon: ";
    if (weapon) {
        const int& weaponValue = *weapon;
        ss << weaponValue;
    } else {
        ss << "none";
    }
    ss << ", ";
    ss << "nextShotTick: ";
    ss << nextShotTick;
    ss << ", ";
    ss << "ammo: ";
    ss << "[ ";
    for (size_t ammoIndex = 0; ammoIndex < ammo.size(); ammoIndex++) {
        const int& ammoElement = ammo[ammoIndex];
        if (ammoIndex != 0) {
            ss << ", ";
        }
        ss << ammoElement;
    }
    ss << " ]";
    ss << ", ";
    ss << "shieldPotions: ";
    ss << shieldPotions;
    ss << " }";
    return ss.str();
}

}