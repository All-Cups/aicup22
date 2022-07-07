package debugging

import "fmt"
import "io"
import . "ai_cup_22/model"
import . "ai_cup_22/stream"

// Camera state
type Camera struct {
    // Center
    Center Vec2
    // Rotation
    Rotation float64
    // Attack angle
    Attack float64
    // Vertical field of view
    Fov float64
}

func NewCamera(center Vec2, rotation float64, attack float64, fov float64) Camera {
    return Camera {
        Center: center,
        Rotation: rotation,
        Attack: attack,
        Fov: fov,
    }
}

// Read Camera from reader
func ReadCamera(reader io.Reader) Camera {
    var center Vec2
    center = ReadVec2(reader)
    var rotation float64
    rotation = ReadFloat64(reader)
    var attack float64
    attack = ReadFloat64(reader)
    var fov float64
    fov = ReadFloat64(reader)
    return Camera {
        Center: center,
        Rotation: rotation,
        Attack: attack,
        Fov: fov,
    }
}

// Write Camera to writer
func (camera Camera) Write(writer io.Writer) {
    center := camera.Center
    center.Write(writer)
    rotation := camera.Rotation
    WriteFloat64(writer, rotation)
    attack := camera.Attack
    WriteFloat64(writer, attack)
    fov := camera.Fov
    WriteFloat64(writer, fov)
}

// Get string representation of Camera
func (camera Camera) String() string {
    stringResult := "{ "
    stringResult += "Center: "
    center := camera.Center
    stringResult += center.String()
    stringResult += ", "
    stringResult += "Rotation: "
    rotation := camera.Rotation
    stringResult += fmt.Sprint(rotation)
    stringResult += ", "
    stringResult += "Attack: "
    attack := camera.Attack
    stringResult += fmt.Sprint(attack)
    stringResult += ", "
    stringResult += "Fov: "
    fov := camera.Fov
    stringResult += fmt.Sprint(fov)
    stringResult += " }"
    return stringResult
}