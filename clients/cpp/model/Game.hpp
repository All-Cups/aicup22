#ifndef __MODEL_GAME_HPP__
#define __MODEL_GAME_HPP__

#include "Stream.hpp"
#include "model/Action.hpp"
#include "model/ActionType.hpp"
#include "model/Item.hpp"
#include "model/Loot.hpp"
#include "model/Player.hpp"
#include "model/Projectile.hpp"
#include "model/Sound.hpp"
#include "model/Unit.hpp"
#include "model/Vec2.hpp"
#include "model/Zone.hpp"
#include <memory>
#include <optional>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace model {

// Current game's state
class Game {
public:
    // Your player's id
    int myId;
    // List of players (teams)
    std::vector<model::Player> players;
    // Current tick
    int currentTick;
    // List of units visible by your team
    std::vector<model::Unit> units;
    // List of loot visible by your team
    std::vector<model::Loot> loot;
    // List of projectiles visible by your team
    std::vector<model::Projectile> projectiles;
    // Current state of game zone
    model::Zone zone;
    // List of sounds heard by your team during last tick
    std::vector<model::Sound> sounds;

    Game(int myId, std::vector<model::Player> players, int currentTick, std::vector<model::Unit> units, std::vector<model::Loot> loot, std::vector<model::Projectile> projectiles, model::Zone zone, std::vector<model::Sound> sounds);

    // Read Game from input stream
    static Game readFrom(InputStream& stream);

    // Write Game to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Game
    std::string toString() const;
};

}

#endif