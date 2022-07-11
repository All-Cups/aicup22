#include "DebugCommand.hpp"
#include <stdexcept>

namespace debugging {

Add::Add(debugging::DebugData debugData) : debugData(debugData) { }

// Read Add from input stream
Add Add::readFrom(InputStream& stream) {
    debugging::DebugData debugData = debugging::readDebugData(stream);
    return Add(debugData);
}

// Write Add to output stream
void Add::writeTo(OutputStream& stream) const {
    writeDebugData(debugData, stream);
}

// Get string representation of Add
std::string Add::toString() const {
    std::stringstream ss;
    ss << "Add { ";
    ss << "debugData: ";
    ss << debugDataToString(debugData);
    ss << " }";
    return ss.str();
}

Clear::Clear() { }

// Read Clear from input stream
Clear Clear::readFrom(InputStream& stream) {
    return Clear();
}

// Write Clear to output stream
void Clear::writeTo(OutputStream& stream) const {
}

// Get string representation of Clear
std::string Clear::toString() const {
    std::stringstream ss;
    ss << "Clear { ";
    ss << " }";
    return ss.str();
}

bool Clear::operator ==(const Clear& other) const {
    return true;
}

SetAutoFlush::SetAutoFlush(bool enable) : enable(enable) { }

// Read SetAutoFlush from input stream
SetAutoFlush SetAutoFlush::readFrom(InputStream& stream) {
    bool enable = stream.readBool();
    return SetAutoFlush(enable);
}

// Write SetAutoFlush to output stream
void SetAutoFlush::writeTo(OutputStream& stream) const {
    stream.write(enable);
}

// Get string representation of SetAutoFlush
std::string SetAutoFlush::toString() const {
    std::stringstream ss;
    ss << "SetAutoFlush { ";
    ss << "enable: ";
    ss << enable;
    ss << " }";
    return ss.str();
}

bool SetAutoFlush::operator ==(const SetAutoFlush& other) const {
    return enable == other.enable;
}

Flush::Flush() { }

// Read Flush from input stream
Flush Flush::readFrom(InputStream& stream) {
    return Flush();
}

// Write Flush to output stream
void Flush::writeTo(OutputStream& stream) const {
}

// Get string representation of Flush
std::string Flush::toString() const {
    std::stringstream ss;
    ss << "Flush { ";
    ss << " }";
    return ss.str();
}

bool Flush::operator ==(const Flush& other) const {
    return true;
}

    
// Read DebugCommand from input stream
DebugCommand readDebugCommand(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return Add::readFrom(stream);
    case 1:
        return Clear::readFrom(stream);
    case 2:
        return SetAutoFlush::readFrom(stream);
    case 3:
        return Flush::readFrom(stream);
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

// Write DebugCommand to output stream
void writeDebugCommand(const DebugCommand& value, OutputStream& stream) {
    std::visit([&](auto& arg) {
        using T = std::decay_t<decltype(arg)>;
        if constexpr (std::is_same_v<T, Add>) {
            stream.write((int) 0);
        }
        if constexpr (std::is_same_v<T, Clear>) {
            stream.write((int) 1);
        }
        if constexpr (std::is_same_v<T, SetAutoFlush>) {
            stream.write((int) 2);
        }
        if constexpr (std::is_same_v<T, Flush>) {
            stream.write((int) 3);
        }
        arg.writeTo(stream);
    }, value);
}

// Get string representation of DebugCommand
std::string debugCommandToString(const DebugCommand& value) {
    return std::visit([](auto& arg) {
        return arg.toString();
    }, value);
}


}