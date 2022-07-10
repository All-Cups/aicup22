#ifndef __MODEL_DEBUG_COMMAND_HPP__
#define __MODEL_DEBUG_COMMAND_HPP__

#include "Stream.hpp"
#include "debugging/Color.hpp"
#include "debugging/ColoredVertex.hpp"
#include "debugging/DebugData.hpp"
#include "model/Vec2.hpp"
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <variant>
#include <vector>

namespace debugging {


// Add debug data to current tick
class Add {
public:
    // Data to add
    debugging::DebugData debugData;

    Add(debugging::DebugData debugData);

    // Read Add from input stream
    static Add readFrom(InputStream& stream);

    // Write Add to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Add
    std::string toString() const;
};

// Clear current tick's debug data
class Clear {
public:

    Clear();

    // Read Clear from input stream
    static Clear readFrom(InputStream& stream);

    // Write Clear to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Clear
    std::string toString() const;

    bool operator ==(const Clear& other) const;
};

// Enable/disable auto performing of commands
class SetAutoFlush {
public:
    // Enable/disable autoflush
    bool enable;

    SetAutoFlush(bool enable);

    // Read SetAutoFlush from input stream
    static SetAutoFlush readFrom(InputStream& stream);

    // Write SetAutoFlush to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of SetAutoFlush
    std::string toString() const;

    bool operator ==(const SetAutoFlush& other) const;
};

// Perform all previously sent commands
class Flush {
public:

    Flush();

    // Read Flush from input stream
    static Flush readFrom(InputStream& stream);

    // Write Flush to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Flush
    std::string toString() const;

    bool operator ==(const Flush& other) const;
};

// Debug commands that can be sent while debugging with the app
typedef std::variant<Add, Clear, SetAutoFlush, Flush> DebugCommand;

// Read DebugCommand from input stream
DebugCommand readDebugCommand(InputStream& stream);

// Write DebugCommand to output stream
void writeDebugCommand(const DebugCommand& value, OutputStream& stream);

// Get string representation of DebugCommand
std::string debugCommandToString(const DebugCommand& value);

}

#endif