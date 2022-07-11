#include "ServerMessage.hpp"
#include <stdexcept>

namespace codegame {

UpdateConstants::UpdateConstants(model::Constants constants) : constants(constants) { }

// Read UpdateConstants from input stream
UpdateConstants UpdateConstants::readFrom(InputStream& stream) {
    model::Constants constants = model::Constants::readFrom(stream);
    return UpdateConstants(constants);
}

// Write UpdateConstants to output stream
void UpdateConstants::writeTo(OutputStream& stream) const {
    constants.writeTo(stream);
}

// Get string representation of UpdateConstants
std::string UpdateConstants::toString() const {
    std::stringstream ss;
    ss << "UpdateConstants { ";
    ss << "constants: ";
    ss << constants.toString();
    ss << " }";
    return ss.str();
}

GetOrder::GetOrder(model::Game playerView, bool debugAvailable) : playerView(playerView), debugAvailable(debugAvailable) { }

// Read GetOrder from input stream
GetOrder GetOrder::readFrom(InputStream& stream) {
    model::Game playerView = model::Game::readFrom(stream);
    bool debugAvailable = stream.readBool();
    return GetOrder(playerView, debugAvailable);
}

// Write GetOrder to output stream
void GetOrder::writeTo(OutputStream& stream) const {
    playerView.writeTo(stream);
    stream.write(debugAvailable);
}

// Get string representation of GetOrder
std::string GetOrder::toString() const {
    std::stringstream ss;
    ss << "GetOrder { ";
    ss << "playerView: ";
    ss << playerView.toString();
    ss << ", ";
    ss << "debugAvailable: ";
    ss << debugAvailable;
    ss << " }";
    return ss.str();
}

Finish::Finish() { }

// Read Finish from input stream
Finish Finish::readFrom(InputStream& stream) {
    return Finish();
}

// Write Finish to output stream
void Finish::writeTo(OutputStream& stream) const {
}

// Get string representation of Finish
std::string Finish::toString() const {
    std::stringstream ss;
    ss << "Finish { ";
    ss << " }";
    return ss.str();
}

bool Finish::operator ==(const Finish& other) const {
    return true;
}

DebugUpdate::DebugUpdate(int displayedTick) : displayedTick(displayedTick) { }

// Read DebugUpdate from input stream
DebugUpdate DebugUpdate::readFrom(InputStream& stream) {
    int displayedTick = stream.readInt();
    return DebugUpdate(displayedTick);
}

// Write DebugUpdate to output stream
void DebugUpdate::writeTo(OutputStream& stream) const {
    stream.write(displayedTick);
}

// Get string representation of DebugUpdate
std::string DebugUpdate::toString() const {
    std::stringstream ss;
    ss << "DebugUpdate { ";
    ss << "displayedTick: ";
    ss << displayedTick;
    ss << " }";
    return ss.str();
}

bool DebugUpdate::operator ==(const DebugUpdate& other) const {
    return displayedTick == other.displayedTick;
}

    
// Read ServerMessage from input stream
ServerMessage readServerMessage(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return UpdateConstants::readFrom(stream);
    case 1:
        return GetOrder::readFrom(stream);
    case 2:
        return Finish::readFrom(stream);
    case 3:
        return DebugUpdate::readFrom(stream);
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

// Write ServerMessage to output stream
void writeServerMessage(const ServerMessage& value, OutputStream& stream) {
    std::visit([&](auto& arg) {
        using T = std::decay_t<decltype(arg)>;
        if constexpr (std::is_same_v<T, UpdateConstants>) {
            stream.write((int) 0);
        }
        if constexpr (std::is_same_v<T, GetOrder>) {
            stream.write((int) 1);
        }
        if constexpr (std::is_same_v<T, Finish>) {
            stream.write((int) 2);
        }
        if constexpr (std::is_same_v<T, DebugUpdate>) {
            stream.write((int) 3);
        }
        arg.writeTo(stream);
    }, value);
}

// Get string representation of ServerMessage
std::string serverMessageToString(const ServerMessage& value) {
    return std::visit([](auto& arg) {
        return arg.toString();
    }, value);
}


}