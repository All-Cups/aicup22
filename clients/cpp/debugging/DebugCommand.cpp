#include "DebugCommand.hpp"
#include <stdexcept>

namespace debugging {

DebugCommand::Add::Add(std::shared_ptr<debugging::DebugData> debugData) : debugData(debugData) { }

// Read Add from input stream
DebugCommand::Add DebugCommand::Add::readFrom(InputStream& stream) {
    std::shared_ptr<debugging::DebugData> debugData = debugging::DebugData::readFrom(stream);
    return DebugCommand::Add(debugData);
}

// Write Add to output stream
void DebugCommand::Add::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    debugData->writeTo(stream);
}

// Get string representation of Add
std::string DebugCommand::Add::toString() const {
    std::stringstream ss;
    ss << "DebugCommand::Add { ";
    ss << "debugData: ";
    ss << debugData->toString();
    ss << " }";
    return ss.str();
}

DebugCommand::Clear::Clear() { }

// Read Clear from input stream
DebugCommand::Clear DebugCommand::Clear::readFrom(InputStream& stream) {
    return DebugCommand::Clear();
}

// Write Clear to output stream
void DebugCommand::Clear::writeTo(OutputStream& stream) const {
    stream.write(TAG);
}

// Get string representation of Clear
std::string DebugCommand::Clear::toString() const {
    std::stringstream ss;
    ss << "DebugCommand::Clear { ";
    ss << " }";
    return ss.str();
}

bool DebugCommand::Clear::operator ==(const DebugCommand::Clear& other) const {
    return true;
}

DebugCommand::SetAutoFlush::SetAutoFlush(bool enable) : enable(enable) { }

// Read SetAutoFlush from input stream
DebugCommand::SetAutoFlush DebugCommand::SetAutoFlush::readFrom(InputStream& stream) {
    bool enable = stream.readBool();
    return DebugCommand::SetAutoFlush(enable);
}

// Write SetAutoFlush to output stream
void DebugCommand::SetAutoFlush::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write(enable);
}

// Get string representation of SetAutoFlush
std::string DebugCommand::SetAutoFlush::toString() const {
    std::stringstream ss;
    ss << "DebugCommand::SetAutoFlush { ";
    ss << "enable: ";
    ss << enable;
    ss << " }";
    return ss.str();
}

bool DebugCommand::SetAutoFlush::operator ==(const DebugCommand::SetAutoFlush& other) const {
    return enable == other.enable;
}

DebugCommand::Flush::Flush() { }

// Read Flush from input stream
DebugCommand::Flush DebugCommand::Flush::readFrom(InputStream& stream) {
    return DebugCommand::Flush();
}

// Write Flush to output stream
void DebugCommand::Flush::writeTo(OutputStream& stream) const {
    stream.write(TAG);
}

// Get string representation of Flush
std::string DebugCommand::Flush::toString() const {
    std::stringstream ss;
    ss << "DebugCommand::Flush { ";
    ss << " }";
    return ss.str();
}

bool DebugCommand::Flush::operator ==(const DebugCommand::Flush& other) const {
    return true;
}

// Read DebugCommand from input stream
std::shared_ptr<DebugCommand> DebugCommand::readFrom(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return std::shared_ptr<DebugCommand::Add>(new DebugCommand::Add(DebugCommand::Add::readFrom(stream)));
    case 1:
        return std::shared_ptr<DebugCommand::Clear>(new DebugCommand::Clear(DebugCommand::Clear::readFrom(stream)));
    case 2:
        return std::shared_ptr<DebugCommand::SetAutoFlush>(new DebugCommand::SetAutoFlush(DebugCommand::SetAutoFlush::readFrom(stream)));
    case 3:
        return std::shared_ptr<DebugCommand::Flush>(new DebugCommand::Flush(DebugCommand::Flush::readFrom(stream)));
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

}