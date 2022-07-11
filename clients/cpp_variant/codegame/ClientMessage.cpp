#include "ClientMessage.hpp"
#include <stdexcept>

namespace codegame {

DebugMessage::DebugMessage(debugging::DebugCommand command) : command(command) { }

// Read DebugMessage from input stream
DebugMessage DebugMessage::readFrom(InputStream& stream) {
    debugging::DebugCommand command = debugging::readDebugCommand(stream);
    return DebugMessage(command);
}

// Write DebugMessage to output stream
void DebugMessage::writeTo(OutputStream& stream) const {
    writeDebugCommand(command, stream);
}

// Get string representation of DebugMessage
std::string DebugMessage::toString() const {
    std::stringstream ss;
    ss << "DebugMessage { ";
    ss << "command: ";
    ss << debugCommandToString(command);
    ss << " }";
    return ss.str();
}

OrderMessage::OrderMessage(model::Order order) : order(order) { }

// Read OrderMessage from input stream
OrderMessage OrderMessage::readFrom(InputStream& stream) {
    model::Order order = model::Order::readFrom(stream);
    return OrderMessage(order);
}

// Write OrderMessage to output stream
void OrderMessage::writeTo(OutputStream& stream) const {
    order.writeTo(stream);
}

// Get string representation of OrderMessage
std::string OrderMessage::toString() const {
    std::stringstream ss;
    ss << "OrderMessage { ";
    ss << "order: ";
    ss << order.toString();
    ss << " }";
    return ss.str();
}

DebugUpdateDone::DebugUpdateDone() { }

// Read DebugUpdateDone from input stream
DebugUpdateDone DebugUpdateDone::readFrom(InputStream& stream) {
    return DebugUpdateDone();
}

// Write DebugUpdateDone to output stream
void DebugUpdateDone::writeTo(OutputStream& stream) const {
}

// Get string representation of DebugUpdateDone
std::string DebugUpdateDone::toString() const {
    std::stringstream ss;
    ss << "DebugUpdateDone { ";
    ss << " }";
    return ss.str();
}

bool DebugUpdateDone::operator ==(const DebugUpdateDone& other) const {
    return true;
}

RequestDebugState::RequestDebugState() { }

// Read RequestDebugState from input stream
RequestDebugState RequestDebugState::readFrom(InputStream& stream) {
    return RequestDebugState();
}

// Write RequestDebugState to output stream
void RequestDebugState::writeTo(OutputStream& stream) const {
}

// Get string representation of RequestDebugState
std::string RequestDebugState::toString() const {
    std::stringstream ss;
    ss << "RequestDebugState { ";
    ss << " }";
    return ss.str();
}

bool RequestDebugState::operator ==(const RequestDebugState& other) const {
    return true;
}

    
// Read ClientMessage from input stream
ClientMessage readClientMessage(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return DebugMessage::readFrom(stream);
    case 1:
        return OrderMessage::readFrom(stream);
    case 2:
        return DebugUpdateDone::readFrom(stream);
    case 3:
        return RequestDebugState::readFrom(stream);
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

// Write ClientMessage to output stream
void writeClientMessage(const ClientMessage& value, OutputStream& stream) {
    std::visit([&](auto& arg) {
        using T = std::decay_t<decltype(arg)>;
        if constexpr (std::is_same_v<T, DebugMessage>) {
            stream.write((int) 0);
        }
        if constexpr (std::is_same_v<T, OrderMessage>) {
            stream.write((int) 1);
        }
        if constexpr (std::is_same_v<T, DebugUpdateDone>) {
            stream.write((int) 2);
        }
        if constexpr (std::is_same_v<T, RequestDebugState>) {
            stream.write((int) 3);
        }
        arg.writeTo(stream);
    }, value);
}

// Get string representation of ClientMessage
std::string clientMessageToString(const ClientMessage& value) {
    return std::visit([](auto& arg) {
        return arg.toString();
    }, value);
}


}