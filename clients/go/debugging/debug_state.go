package debugging

import "fmt"
import "io"
import . "ai_cup_22/model"
import . "ai_cup_22/stream"

// Renderer's state
type DebugState struct {
    // Pressed keys
    PressedKeys []string
    // Cursor's position in game coordinates
    CursorWorldPosition Vec2
    // Id of unit which is followed by the camera, or None
    LockedUnit *int32
    // Current camera state
    Camera Camera
}

func NewDebugState(pressedKeys []string, cursorWorldPosition Vec2, lockedUnit *int32, camera Camera) DebugState {
    return DebugState {
        PressedKeys: pressedKeys,
        CursorWorldPosition: cursorWorldPosition,
        LockedUnit: lockedUnit,
        Camera: camera,
    }
}

// Read DebugState from reader
func ReadDebugState(reader io.Reader) DebugState {
    var pressedKeys []string
    pressedKeys = make([]string, ReadInt32(reader))
    for pressedKeysIndex := range pressedKeys {
        var pressedKeysElement string
        pressedKeysElement = ReadString(reader)
        pressedKeys[pressedKeysIndex] = pressedKeysElement
    }
    var cursorWorldPosition Vec2
    cursorWorldPosition = ReadVec2(reader)
    var lockedUnit *int32
    if ReadBool(reader) {
        var lockedUnitValue int32
        lockedUnitValue = ReadInt32(reader)
        lockedUnit = &lockedUnitValue
    } else {
        lockedUnit = nil
    }
    var camera Camera
    camera = ReadCamera(reader)
    return DebugState {
        PressedKeys: pressedKeys,
        CursorWorldPosition: cursorWorldPosition,
        LockedUnit: lockedUnit,
        Camera: camera,
    }
}

// Write DebugState to writer
func (debugState DebugState) Write(writer io.Writer) {
    pressedKeys := debugState.PressedKeys
    WriteInt32(writer, int32(len(pressedKeys)))
    for _, pressedKeysElement := range pressedKeys {
        WriteString(writer, pressedKeysElement)
    }
    cursorWorldPosition := debugState.CursorWorldPosition
    cursorWorldPosition.Write(writer)
    lockedUnit := debugState.LockedUnit
    if lockedUnit == nil {
        WriteBool(writer, false)
    } else {
        WriteBool(writer, true)
        lockedUnitValue := *lockedUnit
        WriteInt32(writer, lockedUnitValue)
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