#include "ClientMessage.hpp"
#include <stdexcept>

namespace codegame {

ClientMessage::DebugMessage::DebugMessage(std::shared_ptr<debugging::DebugCommand> command) : command(command) { }

// Read DebugMessage from input stream
ClientMessage::DebugMessage ClientMessage::DebugMessage::readFrom(InputStream& stream) {
    std::shared_ptr<debugging::DebugCommand> command = debugging::DebugCommand::readFrom(stream);
    return ClientMessage::DebugMessage(command);
}

// Write DebugMessage to output stream
void ClientMessage::DebugMessage::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    command->writeTo(stream);
}

// Get string representation of DebugMessage
std::string ClientMessage::DebugMessage::toString() const {
    std::stringstream ss;
    ss << "ClientMessage::DebugMessage { ";
    ss << "command: ";
    ss << command->toString();
    ss << " }";
    return ss.str();
}

ClientMessage::OrderMessage::OrderMessage(model::Order order) : order(order) { }

// Read OrderMessage from input stream
ClientMessage::OrderMessage ClientMessage::OrderMessage::readFrom(InputStream& stream) {
    model::Order order = model::Order::readFrom(stream);
    return ClientMessage::OrderMessage(order);
}

// Write OrderMessage to output stream
void ClientMessage::OrderMessage::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    order.writeTo(stream);
}

// Get string representation of OrderMessage
std::string ClientMessage::OrderMessage::toString() const {
    std::stringstream ss;
    ss << "ClientMessage::OrderMessage { ";
    ss << "order: ";
    ss << order.toString();
    ss << " }";
    return ss.str();
}

ClientMessage::DebugUpdateDone::DebugUpdateDone() { }

// Read DebugUpdateDone from input stream
ClientMessage::DebugUpdateDone ClientMessage::DebugUpdateDone::readFrom(InputStream& stream) {
    return ClientMessage::DebugUpdateDone();
}

// Write DebugUpdateDone to output stream
void ClientMessage::DebugUpdateDone::writeTo(OutputStream& stream) const {
    stream.write(TAG);
}

// Get string representation of DebugUpdateDone
std::string ClientMessage::DebugUpdateDone::toString() const {
    std::stringstream ss;
    ss << "ClientMessage::DebugUpdateDone { ";
    ss << " }";
    return ss.str();
}

bool ClientMessage::DebugUpdateDone::operator ==(const ClientMessage::DebugUpdateDone& other) const {
    return true;
}

ClientMessage::RequestDebugState::RequestDebugState() { }

// Read RequestDebugState from input stream
ClientMessage::RequestDebugState ClientMessage::RequestDebugState::readFrom(InputStream& stream) {
    return ClientMessage::RequestDebugState();
}

// Write RequestDebugState to output stream
void ClientMessage::RequestDebugState::writeTo(OutputStream& stream) const {
    stream.write(TAG);
}

// Get string representation of RequestDebugState
std::string ClientMessage::RequestDebugState::toString() const {
    std::stringstream ss;
    ss << "ClientMessage::RequestDebugState { ";
    ss << " }";
    return ss.str();
}

bool ClientMessage::RequestDebugState::operator ==(const ClientMessage::RequestDebugState& other) const {
    return true;
}

// Read ClientMessage from input stream
std::shared_ptr<ClientMessage> ClientMessage::readFrom(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return std::shared_ptr<ClientMessage::DebugMessage>(new ClientMessage::DebugMessage(ClientMessage::DebugMessage::readFrom(stream)));
    case 1:
        return std::shared_ptr<ClientMessage::OrderMessage>(new ClientMessage::OrderMessage(ClientMessage::OrderMessage::readFrom(stream)));
    case 2:
        return std::shared_ptr<ClientMessage::DebugUpdateDone>(new ClientMessage::DebugUpdateDone(ClientMessage::DebugUpdateDone::readFrom(stream)));
    case 3:
        return std::shared_ptr<ClientMessage::RequestDebugState>(new ClientMessage::RequestDebugState(ClientMessage::RequestDebugState::readFrom(stream)));
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

}