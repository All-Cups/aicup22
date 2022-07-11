#ifndef __MODEL_PLAYER_HPP__
#define __MODEL_PLAYER_HPP__

#include "Stream.hpp"
#include <sstream>
#include <string>

namespace model {

// Game's participant (team of units)
class Player {
public:
    // Unique id
    int id;
    // Number of kills
    int kills;
    // Total damage dealt to enemies
    double damage;
    // Survival place (number of survivor teams currently/at the moment of death)
    int place;
    // Team score
    double score;

    Player(int id, int kills, double damage, int place, double score);

    // Read Player from input stream
    static Player readFrom(InputStream& stream);

    // Write Player to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Player
    std::string toString() const;
};

}

#endif