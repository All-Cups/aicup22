#include "ServerMessage.hpp"
#include <stdexcept>

namespace codegame {

ServerMessage::UpdateConstants::UpdateConstants(model::Constants constants) : constants(constants) { }

// Read UpdateConstants from input stream
ServerMessage::UpdateConstants ServerMessage::UpdateConstants::readFrom(InputStream& stream) {
    model::Constants constants = model::Constants::readFrom(stream);
    return ServerMessage::UpdateConstants(constants);
}

// Write UpdateConstants to output stream
void ServerMessage::UpdateConstants::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    constants.writeTo(stream);
}

// Get string representation of UpdateConstants
std::string ServerMessage::UpdateConstants::toString() const {
    std::stringstream ss;
    ss << "ServerMessage::UpdateConstants { ";
    ss << "constants: ";
    ss << constants.toString();
    ss << " }";
    return ss.str();
}

ServerMessage::GetOrder::GetOrder(model::Game playerView, bool debugAvailable) : playerView(playerView), debugAvailable(debugAvailable) { }

// Read GetOrder from input stream
ServerMessage::GetOrder ServerMessage::GetOrder::readFrom(InputStream& stream) {
    model::Game playerView = model::Game::readFrom(stream);
    bool debugAvailable = stream.readBool();
    return ServerMessage::GetOrder(playerView, debugAvailable);
}

// Write GetOrder to output stream
void ServerMessage::GetOrder::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    playerView.writeTo(stream);
    stream.write(debugAvailable);
}

// Get string representation of GetOrder
std::string ServerMessage::GetOrder::toString() const {
    std::stringstream ss;
    ss << "ServerMessage::GetOrder { ";
    ss << "playerView: ";
    ss << playerView.toString();
    ss << ", ";
    ss << "debugAvailable: ";
    ss << debugAvailable;
    ss << " }";
    return ss.str();
}

ServerMessage::Finish::Finish() { }

// Read Finish from input stream
ServerMessage::Finish ServerMessage::Finish::readFrom(InputStream& stream) {
    return ServerMessage::Finish();
}

// Write Finish to output stream
void ServerMessage::Finish::writeTo(OutputStream& stream) const {
    stream.write(TAG);
}

// Get string representation of Finish
std::string ServerMessage::Finish::toString() const {
    std::stringstream ss;
    ss << "ServerMessage::Finish { ";
    ss << " }";
    return ss.str();
}

bool ServerMessage::Finish::operator ==(const ServerMessage::Finish& other) const {
    return true;
}

ServerMessage::DebugUpdate::DebugUpdate() { }

// Read DebugUpdate from input stream
ServerMessage::DebugUpdate ServerMessage::DebugUpdate::readFrom(InputStream& stream) {
    return ServerMessage::DebugUpdate();
}

// Write DebugUpdate to output stream
void ServerMessage::DebugUpdate::writeTo(OutputStream& stream) const {
    stream.write(TAG);
}

// Get string representation of DebugUpdate
std::string ServerMessage::DebugUpdate::toString() const {
    std::stringstream ss;
    ss << "ServerMessage::DebugUpdate { ";
    ss << " }";
    return ss.str();
}

bool ServerMessage::DebugUpdate::operator ==(const ServerMessage::DebugUpdate& other) const {
    return true;
}

// Read ServerMessage from input stream
std::shared_ptr<ServerMessage> ServerMessage::readFrom(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return std::shared_ptr<ServerMessage::UpdateConstants>(new ServerMessage::UpdateConstants(ServerMessage::UpdateConstants::readFrom(stream)));
    case 1:
        return std::shared_ptr<ServerMessage::GetOrder>(new ServerMessage::GetOrder(ServerMessage::GetOrder::readFrom(stream)));
    case 2:
        return std::shared_ptr<ServerMessage::Finish>(new ServerMessage::Finish(ServerMessage::Finish::readFrom(stream)));
    case 3:
        return std::shared_ptr<ServerMessage::DebugUpdate>(new ServerMessage::DebugUpdate(ServerMessage::DebugUpdate::readFrom(stream)));
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

}