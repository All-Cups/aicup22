package debugging

import (
	"fmt"
	"io"

	"aicup22/pkg/model"
	"aicup22/pkg/stream"
)

// Renderer's state
type DebugState struct {
	// Pressed keys
	PressedKeys []string
	// Cursor's position in game coordinates
	CursorWorldPosition model.Vec2
	// Id of unit which is followed by the camera, or None
	LockedUnit *int32
	// Current camera state
	Camera Camera
}

func NewDebugState(pressedKeys []string, cursorWorldPosition model.Vec2, lockedUnit *int32, camera Camera) DebugState {
	return DebugState{
		PressedKeys:         pressedKeys,
		CursorWorldPosition: cursorWorldPosition,
		LockedUnit:          lockedUnit,
		Camera:              camera,
	}
}

// Read DebugState from reader
func ReadDebugState(reader io.Reader) DebugState {
	pressedKeys := make([]string, stream.ReadInt32(reader))
	for pressedKeysIndex := range pressedKeys {
		pressedKeysElement := stream.ReadString(reader)
		pressedKeys[pressedKeysIndex] = pressedKeysElement
	}
	cursorWorldPosition := model.ReadVec2(reader)
	var lockedUnit *int32
	if stream.ReadBool(reader) {
		lockedUnitValue := stream.ReadInt32(reader)
		lockedUnit = &lockedUnitValue
	} else {
		lockedUnit = nil
	}
	camera := ReadCamera(reader)
	return DebugState{
		PressedKeys:         pressedKeys,
		CursorWorldPosition: cursorWorldPosition,
		LockedUnit:          lockedUnit,
		Camera:              camera,
	}
}

// Write DebugState to writer
func (debugState DebugState) Write(writer io.Writer) {
	pressedKeys := debugState.PressedKeys
	stream.WriteInt32(writer, int32(len(pressedKeys)))
	for _, pressedKeysElement := range pressedKeys {
		stream.WriteString(writer, pressedKeysElement)
	}
	cursorWorldPosition := debugState.CursorWorldPosition
	cursorWorldPosition.Write(writer)
	lockedUnit := debugState.LockedUnit
	if lockedUnit == nil {
		stream.WriteBool(writer, false)
	} else {
		stream.WriteBool(writer, true)
		lockedUnitValue := *lockedUnit
		stream.WriteInt32(writer, lockedUnitValue)
	}
	camera := debugState.Camera
	camera.Write(writer)
}

// Get string representation of DebugState
func (debugState DebugState) String() string {
	stringResult := "{ "
	stringResult += "PressedKeys: "
	pressedKeys := debugState.PressedKeys
	stringResult += "[ "
	for pressedKeysIndex, pressedKeysElement := range pressedKeys {
		if pressedKeysIndex != 0 {
			stringResult += ", "
		}
		stringResult += "\"" + pressedKeysElement + "\""
	}
	stringResult += " ]"
	stringResult += ", "
	stringResult += "CursorWorldPosition: "
	cursorWorldPosition := debugState.CursorWorldPosition
	stringResult += cursorWorldPosition.String()
	stringResult += ", "
	stringResult += "LockedUnit: "
	lockedUnit := debugState.LockedUnit
	if lockedUnit == nil {
		stringResult += "nil"
	} else {
		lockedUnitValue := *lockedUnit
		stringResult += fmt.Sprint(lockedUnitValue)
	}
	stringResult += ", "
	stringResult += "Camera: "
	camera := debugState.Camera
	stringResult += camera.String()
	stringResult += " }"
	return stringResult
}
