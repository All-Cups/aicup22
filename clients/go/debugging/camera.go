package debugging

import (
	"fmt"
	"io"

	"aicup22/model"
	"aicup22/stream"
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

func NewCamera(center model.Vec2, rotation, attack, fov float64) Camera {
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
	rotation := stream.ReadFloat64(reader)
	attack := stream.ReadFloat64(reader)
	fov := stream.ReadFloat64(reader)
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
