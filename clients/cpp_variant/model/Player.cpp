#include "Player.hpp"

namespace model {

Player::Player(int id, int kills, double damage, int place, double score) : id(id), kills(kills), damage(damage), place(place), score(score) { }

// Read Player from input stream
Player Player::readFrom(InputStream& stream) {
    int id = stream.readInt();
    int kills = stream.readInt();
    double damage = stream.readDouble();
    int place = stream.readInt();
    double score = stream.readDouble();
    return Player(id, kills, damage, place, score);
}

// Write Player to output stream
void Player::writeTo(OutputStream& stream) const {
    stream.write(id);
    stream.write(kills);
    stream.write(damage);
    stream.write(place);
    stream.write(score);
}

// Get string representation of Player
std::string Player::toString() const {
    std::stringstream ss;
    ss << "Player { ";
    ss << "id: ";
    ss << id;
    ss << ", ";
    ss << "kills: ";
    ss << kills;
    ss << ", ";
    ss << "damage: ";
    ss << damage;
    ss << ", ";
    ss << "place: ";
    ss << place;
    ss << ", ";
    ss << "score: ";
    ss << score;
    ss << " }";
    return ss.str();
}

}