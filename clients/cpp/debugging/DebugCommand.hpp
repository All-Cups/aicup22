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
#include <vector>

namespace debugging {

// Debug commands that can be sent while debugging with the app
class DebugCommand {
public:
    // Add debug data to current tick
    class Add;
    // Clear current tick's debug data
    class Clear;
    // Enable/disable auto performing of commands
    class SetAutoFlush;
    // Perform all previously sent commands
    class Flush;

    // Read DebugCommand from input stream
    static std::shared_ptr<DebugCommand> readFrom(InputStream& stream);

    // Write DebugCommand to output stream
    virtual void writeTo(OutputStream& stream) const = 0;

    // Get string representation of DebugCommand
    virtual std::string toString() const = 0;
};

// Add debug data to current tick
class DebugCommand::Add : public DebugCommand {
public:
    static const int TAG = 0;

    // Data to add
    std::shared_ptr<debugging::DebugData> debugData;

    Add(std::shared_ptr<debugging::DebugData> debugData);

    // Read Add from input stream
    static Add readFrom(InputStream& stream);

    // Write Add to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Add
    std::string toString() const;
};

// Clear current tick's debug data
class DebugCommand::Clear : public DebugCommand {
public:
    static const int TAG = 1;


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
class DebugCommand::SetAutoFlush : public DebugCommand {
public:
    static const int TAG = 2;

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
class DebugCommand::Flush : public DebugCommand {
public:
    static const int TAG = 3;


    Flush();

    // Read Flush from input stream
    static Flush readFrom(InputStream& stream);

    // Write Flush to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Flush
    std::string toString() const;

    bool operator ==(const Flush& other) const;
};

}

#endif