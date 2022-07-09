package debugging

import (
	"fmt"
	"io"

	"aicup22/pkg/model"
	"aicup22/pkg/stream"
)

// Camera state
type Camera struct {
	// Center
	Center model.Vec2
	// Rotation
	Rotation float64
	// Attack angle
	Attack float64
	// Vertical field of view
	Fov float64
}

var (
	flow *stream.Stream
)

func NewCamera(center model.Vec2, rotation, attack, fov float64) Camera {
	flow = stream.Flow()
	return Camera{
		Center:   center,
		Rotation: rotation,
		Attack:   attack,
		Fov:      fov,
	}
}

// Read Camera from reader
func ReadCamera(reader io.Reader) Camera {
	center := model.ReadVec2(reader)
	rotation := flow.ReadFloat64()
	attack := flow.ReadFloat64()
	fov := flow.ReadFloat64()
	return Camera{
		Center:   center,
		Rotation: rotation,
		Attack:   attack,
		Fov:      fov,
	}
}

// Write Camera to writer
func (camera Camera) Write(writer io.Writer) {
	center := camera.Center
	center.Write(writer)
	rotation := camera.Rotation
	stream.WriteFloat64(writer, rotation)
	attack := camera.Attack
	stream.WriteFloat64(writer, attack)
	fov := camera.Fov
	stream.WriteFloat64(writer, fov)
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
