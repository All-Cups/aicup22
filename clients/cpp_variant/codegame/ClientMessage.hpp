#ifndef __MODEL_CLIENT_MESSAGE_HPP__
#define __MODEL_CLIENT_MESSAGE_HPP__

#include "Stream.hpp"
#include "debugging/Color.hpp"
#include "debugging/ColoredVertex.hpp"
#include "debugging/DebugCommand.hpp"
#include "debugging/DebugData.hpp"
#include "model/ActionOrder.hpp"
#include "model/Order.hpp"
#include "model/UnitOrder.hpp"
#include "model/Vec2.hpp"
#include <memory>
#include <optional>
#include <sstream>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <variant>
#include <vector>

namespace codegame {


// Ask app to perform new debug command
class DebugMessage {
public:
    // Command to perform
    debugging::DebugCommand command;

    DebugMessage(debugging::DebugCommand command);

    // Read DebugMessage from input stream
    static DebugMessage readFrom(InputStream& stream);

    // Write DebugMessage to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of DebugMessage
    std::string toString() const;
};

// Reply for ServerMessage::GetOrder
class OrderMessage {
public:
    // Player's order
    model::Order order;

    OrderMessage(model::Order order);

    // Read OrderMessage from input stream
    static OrderMessage readFrom(InputStream& stream);

    // Write OrderMessage to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of OrderMessage
    std::string toString() const;
};

// Signifies finish of the debug update
class DebugUpdateDone {
public:

    DebugUpdateDone();

    // Read DebugUpdateDone from input stream
    static DebugUpdateDone readFrom(InputStream& stream);

    // Write DebugUpdateDone to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of DebugUpdateDone
    std::string toString() const;

    bool operator ==(const DebugUpdateDone& other) const;
};

// Request debug state from the app
class RequestDebugState {
public:

    RequestDebugState();

    // Read RequestDebugState from input stream
    static RequestDebugState readFrom(InputStream& stream);

    // Write RequestDebugState to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of RequestDebugState
    std::string toString() const;

    bool operator ==(const RequestDebugState& other) const;
};

// Message sent from client
typedef std::variant<DebugMessage, OrderMessage, DebugUpdateDone, RequestDebugState> ClientMessage;

// Read ClientMessage from input stream
ClientMessage readClientMessage(InputStream& stream);

// Write ClientMessage to output stream
void writeClientMessage(const ClientMessage& value, OutputStream& stream);

// Get string representation of ClientMessage
std::string clientMessageToString(const ClientMessage& value);

}

#endif