package debugging

import (
	"fmt"

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
func ReadCamera() Camera {
	center := model.ReadVec2()
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
func (sf Camera) Write() {
	center := sf.Center
	center.Write()
	rotation := sf.Rotation
	flow.WriteFloat64(rotation)
	attack := sf.Attack
	flow.WriteFloat64(attack)
	fov := sf.Fov
	flow.WriteFloat64(fov)
}

// Get string representation of Camera
func (sf Camera) String() string {
	strRes := "{ "
	strRes += "Center: "
	center := sf.Center
	strRes += center.String()
	strRes += ", "
	strRes += "Rotation: "
	rotation := sf.Rotation
	strRes += fmt.Sprint(rotation)
	strRes += ", "
	strRes += "Attack: "
	attack := sf.Attack
	strRes += fmt.Sprint(attack)
	strRes += ", "
	strRes += "Fov: "
	fov := sf.Fov
	strRes += fmt.Sprint(fov)
	strRes += " }"
	return strRes
}
