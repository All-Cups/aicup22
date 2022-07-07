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
#include <vector>

namespace codegame {

// Message sent from server
class ServerMessage {
public:
    // Update constants
    class UpdateConstants;
    // Get order for next tick
    class GetOrder;
    // Signifies end of the game
    class Finish;
    // Debug update
    class DebugUpdate;

    // Read ServerMessage from input stream
    static std::shared_ptr<ServerMessage> readFrom(InputStream& stream);

    // Write ServerMessage to output stream
    virtual void writeTo(OutputStream& stream) const = 0;

    // Get string representation of ServerMessage
    virtual std::string toString() const = 0;
};

// Update constants
class ServerMessage::UpdateConstants : public ServerMessage {
public:
    static const int TAG = 0;

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
class ServerMessage::GetOrder : public ServerMessage {
public:
    static const int TAG = 1;

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
class ServerMessage::Finish : public ServerMessage {
public:
    static const int TAG = 2;


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
class ServerMessage::DebugUpdate : public ServerMessage {
public:
    static const int TAG = 3;


    DebugUpdate();

    // Read DebugUpdate from input stream
    static DebugUpdate readFrom(InputStream& stream);

    // Write DebugUpdate to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of DebugUpdate
    std::string toString() const;

    bool operator ==(const DebugUpdate& other) const;
};

}

#endif