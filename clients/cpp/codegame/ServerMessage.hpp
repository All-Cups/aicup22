#ifndef __MODEL_SERVER_MESSAGE_HPP__
#define __MODEL_SERVER_MESSAGE_HPP__

#include "Stream.hpp"
#include "model/Action.hpp"
#include "model/ActionType.hpp"
#include "model/Constants.hpp"
#include "model/Game.hpp"
#include "model/Item.hpp"
#include "model/Loot.hpp"
#include "model/Obstacle.hpp"
#include "model/Player.hpp"
#include "model/Projectile.hpp"
#include "model/Sound.hpp"
#include "model/SoundProperties.hpp"
#include "model/Unit.hpp"
#include "model/Vec2.hpp"
#include "model/WeaponProperties.hpp"
#include "model/Zone.hpp"
#include <memory>
#include <optional>
#include <sstream>
#include <stdexcept>
#include <string>
#include <variant>
#include <vector>

namespace codegame {


// Update constants
class UpdateConstants {
public:
    // New constants
    model::Constants constants;

    UpdateConstants(model::Constants constants);

    // Read UpdateConstants from input stream
    static UpdateConstants readFrom(InputStream& stream);

    // Write UpdateConstants to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of UpdateConstants
    std::string toString() const;
};

// Get order for next tick
class GetOrder {
public:
    // Player's view
    model::Game playerView;
    // Whether app is running with debug interface available
    bool debugAvailable;

    GetOrder(model::Game playerView, bool debugAvailable);

    // Read GetOrder from input stream
    static GetOrder readFrom(InputStream& stream);

    // Write GetOrder to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of GetOrder
    std::string toString() const;
};

// Signifies end of the game
class Finish {
public:

    Finish();

    // Read Finish from input stream
    static Finish readFrom(InputStream& stream);

    // Write Finish to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Finish
    std::string toString() const;

    bool operator ==(const Finish& other) const;
};

// Debug update
class DebugUpdate {
public:
    // Displayed tick
    int displayedTick;

    DebugUpdate(int displayedTick);

    // Read DebugUpdate from input stream
    static DebugUpdate readFrom(InputStream& stream);

    // Write DebugUpdate to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of DebugUpdate
    std::string toString() const;

    bool operator ==(const DebugUpdate& other) const;
};

// Message sent from server
typedef std::variant<UpdateConstants, GetOrder, Finish, DebugUpdate> ServerMessage;

// Read ServerMessage from input stream
ServerMessage readServerMessage(InputStream& stream);

// Write ServerMessage to output stream
void writeServerMessage(const ServerMessage& value, OutputStream& stream);

// Get string representation of ServerMessage
std::string serverMessageToString(const ServerMessage& value);

}

#endif