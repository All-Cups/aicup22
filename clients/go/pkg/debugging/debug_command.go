package debugging

import (
	"fmt"
)

// Debug commands that can be sent while debugging with the app
type DebugCommand interface {
	// Write DebugCommand to writer
	Write()

	// Get string representation of DebugCommand
	String() string
}

// Read DebugCommand from reader
func ReadDebugCommand() DebugCommand {
	// FIXME: магические константы
	switch flow.ReadInt32() {
	case 0:
		return ReadDebugCommandAdd()
	case 1:
		return ReadDebugCommandClear()
	case 2:
		return ReadDebugCommandSetAutoFlush()
	case 3:
		return ReadDebugCommandFlush()
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
func ReadDebugCommandAdd() DebugCommandAdd {
	debugData := ReadDebugData()
	return DebugCommandAdd{
		DebugData: debugData,
	}
}

// Write Add to writer
func (sf DebugCommandAdd) Write() {
	flow.WriteInt32(0)
	debugData := sf.DebugData
	debugData.Write()
}

// Get string representation of Add
func (sf DebugCommandAdd) String() string {
	strRes := "{ "
	strRes += "DebugData: "
	debugData := sf.DebugData
	strRes += debugData.String()
	strRes += " }"
	return strRes
}

// Clear current tick's debug data
type DebugCommandClear struct {
}

func NewDebugCommandClear() DebugCommandClear {
	return DebugCommandClear{}
}

// Read Clear from reader
func ReadDebugCommandClear() DebugCommandClear {
	return DebugCommandClear{}
}

// Write Clear to writer
func (sf DebugCommandClear) Write() {
	flow.WriteInt32(1)
}

// Get string representation of Clear
func (sf DebugCommandClear) String() string {
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
func ReadDebugCommandSetAutoFlush() DebugCommandSetAutoFlush {
	enable := flow.ReadBool()
	return DebugCommandSetAutoFlush{
		Enable: enable,
	}
}

// Write SetAutoFlush to writer
func (sf DebugCommandSetAutoFlush) Write() {
	flow.WriteInt32(2)
	enable := sf.Enable
	flow.WriteBool(enable)
}

// Get string representation of SetAutoFlush
func (sf DebugCommandSetAutoFlush) String() string {
	strRes := "{ "
	strRes += "Enable: "
	enable := sf.Enable
	strRes += fmt.Sprint(enable)
	strRes += " }"
	return strRes
}

// Perform all previously sent commands
type DebugCommandFlush struct {
}

func NewDebugCommandFlush() DebugCommandFlush {
	return DebugCommandFlush{}
}

// Read Flush from reader
func ReadDebugCommandFlush() DebugCommandFlush {
	return DebugCommandFlush{}
}

// Write Flush to writer
func (sf DebugCommandFlush) Write() {
	flow.WriteInt32(3)
}

// Get string representation of Flush
func (sf DebugCommandFlush) String() string {
	stringResult := "{ "
	stringResult += " }"
	return stringResult
}
