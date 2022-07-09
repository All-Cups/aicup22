package debugging

import (
	"fmt"

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
func ReadDebugState() DebugState {
	pressedKeys := make([]string, stream.Flow().ReadInt32())
	for pressedKeysIndex := range pressedKeys {
		pressedKeysElement := stream.Flow().ReadString()
		pressedKeys[pressedKeysIndex] = pressedKeysElement
	}
	cursorWorldPosition := model.ReadVec2()
	var lockedUnit *int32
	if stream.Flow().ReadBool() {
		lockedUnitValue := stream.Flow().ReadInt32()
		lockedUnit = &lockedUnitValue
	} else {
		lockedUnit = nil
	}
	camera := ReadCamera()
	return DebugState{
		PressedKeys:         pressedKeys,
		CursorWorldPosition: cursorWorldPosition,
		LockedUnit:          lockedUnit,
		Camera:              camera,
	}
}

// Write DebugState to writer
func (debugState DebugState) Write() {
	pressedKeys := debugState.PressedKeys
	flow.WriteInt32(int32(len(pressedKeys)))
	for _, pressedKeysElement := range pressedKeys {
		flow.WriteString(pressedKeysElement)
	}
	cursorWorldPosition := debugState.CursorWorldPosition
	cursorWorldPosition.Write()
	lockedUnit := debugState.LockedUnit
	if lockedUnit == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		lockedUnitValue := *lockedUnit
		flow.WriteInt32(lockedUnitValue)
	}
	camera := debugState.Camera
	camera.Write()
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
