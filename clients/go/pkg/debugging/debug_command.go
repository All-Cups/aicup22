package debugging

import (
	"fmt"
	"io"

	"aicup22/pkg/stream"
)

// Debug commands that can be sent while debugging with the app
type DebugCommand interface {
	// Write DebugCommand to writer
	Write(writer io.Writer)

	// Get string representation of DebugCommand
	String() string
}

// Read DebugCommand from reader
func ReadDebugCommand(reader io.Reader) DebugCommand {
	switch stream.ReadInt32(reader) {
	case 0:
		return ReadDebugCommandAdd(reader)
	case 1:
		return ReadDebugCommandClear(reader)
	case 2:
		return ReadDebugCommandSetAutoFlush(reader)
	case 3:
		return ReadDebugCommandFlush(reader)
	}
	panic("Unexpected tag value")
}

// Add debug data to current tick
type DebugCommandAdd struct {
	// Data to add
	DebugData DebugData
}

func NewDebugCommandAdd(debugData DebugData) DebugCommandAdd {
	return DebugCommandAdd{
		DebugData: debugData,
	}
}

// Read Add from reader
func ReadDebugCommandAdd(reader io.Reader) DebugCommandAdd {
	debugData := ReadDebugData(reader)
	return DebugCommandAdd{
		DebugData: debugData,
	}
}

// Write Add to writer
func (debugCommandAdd DebugCommandAdd) Write(writer io.Writer) {
	stream.WriteInt32(writer, 0)
	debugData := debugCommandAdd.DebugData
	debugData.Write(writer)
}

// Get string representation of Add
func (debugCommandAdd DebugCommandAdd) String() string {
	stringResult := "{ "
	stringResult += "DebugData: "
	debugData := debugCommandAdd.DebugData
	stringResult += debugData.String()
	stringResult += " }"
	return stringResult
}

// Clear current tick's debug data
type DebugCommandClear struct {
}

func NewDebugCommandClear() DebugCommandClear {
	return DebugCommandClear{}
}

// Read Clear from reader
func ReadDebugCommandClear(reader io.Reader) DebugCommandClear {
	return DebugCommandClear{}
}

// Write Clear to writer
func (debugCommandClear DebugCommandClear) Write(writer io.Writer) {
	stream.WriteInt32(writer, 1)
}

// Get string representation of Clear
func (debugCommandClear DebugCommandClear) String() string {
	stringResult := "{ "
	stringResult += " }"
	return stringResult
}

// Enable/disable auto performing of commands
type DebugCommandSetAutoFlush struct {
	// Enable/disable autoflush
	Enable bool
}

func NewDebugCommandSetAutoFlush(enable bool) DebugCommandSetAutoFlush {
	return DebugCommandSetAutoFlush{
		Enable: enable,
	}
}

// Read SetAutoFlush from reader
func ReadDebugCommandSetAutoFlush(reader io.Reader) DebugCommandSetAutoFlush {
	enable := stream.ReadBool(reader)
	return DebugCommandSetAutoFlush{
		Enable: enable,
	}
}

// Write SetAutoFlush to writer
func (debugCommandSetAutoFlush DebugCommandSetAutoFlush) Write(writer io.Writer) {
	stream.WriteInt32(writer, 2)
	enable := debugCommandSetAutoFlush.Enable
	stream.WriteBool(writer, enable)
}

// Get string representation of SetAutoFlush
func (debugCommandSetAutoFlush DebugCommandSetAutoFlush) String() string {
	stringResult := "{ "
	stringResult += "Enable: "
	enable := debugCommandSetAutoFlush.Enable
	stringResult += fmt.Sprint(enable)
	stringResult += " }"
	return stringResult
}

// Perform all previously sent commands
type DebugCommandFlush struct {
}

func NewDebugCommandFlush() DebugCommandFlush {
	return DebugCommandFlush{}
}

// Read Flush from reader
func ReadDebugCommandFlush(reader io.Reader) DebugCommandFlush {
	return DebugCommandFlush{}
}

// Write Flush to writer
func (debugCommandFlush DebugCommandFlush) Write(writer io.Writer) {
	stream.WriteInt32(writer, 3)
}

// Get string representation of Flush
func (debugCommandFlush DebugCommandFlush) String() string {
	stringResult := "{ "
	stringResult += " }"
	return stringResult
}
