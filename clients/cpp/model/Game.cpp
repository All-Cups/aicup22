#include "Game.hpp"

namespace model {

Game::Game(int myId, std::vector<model::Player> players, int currentTick, std::vector<model::Unit> units, std::vector<model::Loot> loot, std::vector<model::Projectile> projectiles, model::Zone zone, std::vector<model::Sound> sounds) : myId(myId), players(players), currentTick(currentTick), units(units), loot(loot), projectiles(projectiles), zone(zone), sounds(sounds) { }

// Read Game from input stream
Game Game::readFrom(InputStream& stream) {
    int myId = stream.readInt();
    std::vector<model::Player> players = std::vector<model::Player>();
    size_t playersSize = stream.readInt();
    players.reserve(playersSize);
    for (size_t playersIndex = 0; playersIndex < playersSize; playersIndex++) {
        model::Player playersElement = model::Player::readFrom(stream);
        players.emplace_back(playersElement);
    }
    int currentTick = stream.readInt();
    std::vector<model::Unit> units = std::vector<model::Unit>();
    size_t unitsSize = stream.readInt();
    units.reserve(unitsSize);
    for (size_t unitsIndex = 0; unitsIndex < unitsSize; unitsIndex++) {
        model::Unit unitsElement = model::Unit::readFrom(stream);
        units.emplace_back(unitsElement);
    }
    std::vector<model::Loot> loot = std::vector<model::Loot>();
    size_t lootSize = stream.readInt();
    loot.reserve(lootSize);
    for (size_t lootIndex = 0; lootIndex < lootSize; lootIndex++) {
        model::Loot lootElement = model::Loot::readFrom(stream);
        loot.emplace_back(lootElement);
    }
    std::vector<model::Projectile> projectiles = std::vector<model::Projectile>();
    size_t projectilesSize = stream.readInt();
    projectiles.reserve(projectilesSize);
    for (size_t projectilesIndex = 0; projectilesIndex < projectilesSize; projectilesIndex++) {
        model::Projectile projectilesElement = model::Projectile::readFrom(stream);
        projectiles.emplace_back(projectilesElement);
    }
    model::Zone zone = model::Zone::readFrom(stream);
    std::vector<model::Sound> sounds = std::vector<model::Sound>();
    size_t soundsSize = stream.readInt();
    sounds.reserve(soundsSize);
    for (size_t soundsIndex = 0; soundsIndex < soundsSize; soundsIndex++) {
        model::Sound soundsElement = model::Sound::readFrom(stream);
        sounds.emplace_back(soundsElement);
    }
    return Game(myId, players, currentTick, units, loot, projectiles, zone, sounds);
}

// Write Game to output stream
void Game::writeTo(OutputStream& stream) const {
    stream.write(myId);
    stream.write((int)(players.size()));
    for (const model::Player& playersElement : players) {
        playersElement.writeTo(stream);
    }
    stream.write(currentTick);
    stream.write((int)(units.size()));
    for (const model::Unit& unitsElement : units) {
        unitsElement.writeTo(stream);
    }
    stream.write((int)(loot.size()));
    for (const model::Loot& lootElement : loot) {
        lootElement.writeTo(stream);
    }
    stream.write((int)(projectiles.size()));
    for (const model::Projectile& projectilesElement : projectiles) {
        projectilesElement.writeTo(stream);
    }
    zone.writeTo(stream);
    stream.write((int)(sounds.size()));
    for (const model::Sound& soundsElement : sounds) {
        soundsElement.writeTo(stream);
    }
}

// Get string representation of Game
std::string Game::toString() const {
    std::stringstream ss;
    ss << "Game { ";
    ss << "myId: ";
    ss << myId;
    ss << ", ";
    ss << "players: ";
    ss << "[ ";
    for (size_t playersIndex = 0; playersIndex < players.size(); playersIndex++) {
        const model::Player& playersElement = players[playersIndex];
        if (playersIndex != 0) {
            ss << ", ";
        }
        ss << playersElement.toString();
    }
    ss << " ]";
    ss << ", ";
    ss << "currentTick: ";
    ss << currentTick;
    ss << ", ";
    ss << "units: ";
    ss << "[ ";
    for (size_t unitsIndex = 0; unitsIndex < units.size(); unitsIndex++) {
        const model::Unit& unitsElement = units[unitsIndex];
        if (unitsIndex != 0) {
            ss << ", ";
        }
        ss << unitsElement.toString();
    }
    ss << " ]";
    ss << ", ";
    ss << "loot: ";
    ss << "[ ";
    for (size_t lootIndex = 0; lootIndex < loot.size(); lootIndex++) {
        const model::Loot& lootElement = loot[lootIndex];
        if (lootIndex != 0) {
            ss << ", ";
        }
        ss << lootElement.toString();
    }
    ss << " ]";
    ss << ", ";
    ss << "projectiles: ";
    ss << "[ ";
    for (size_t projectilesIndex = 0; projectilesIndex < projectiles.size(); projectilesIndex++) {
        const model::Projectile& projectilesElement = projectiles[projectilesIndex];
        if (projectilesIndex != 0) {
            ss << ", ";
        }
        ss << projectilesElement.toString();
    }
    ss << " ]";
    ss << ", ";
    ss << "zone: ";
    ss << zone.toString();
    ss << ", ";
    ss << "sounds: ";
    ss << "[ ";
    for (size_t soundsIndex = 0; soundsIndex < sounds.size(); soundsIndex++) {
        const model::Sound& soundsElement = sounds[soundsIndex];
        if (soundsIndex != 0) {
            ss << ", ";
        }
        ss << soundsElement.toString();
    }
    ss << " ]";
    ss << " }";
    return ss.str();
}

}