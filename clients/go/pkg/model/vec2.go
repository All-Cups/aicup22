package model

import (
	"fmt"
	// "aicup22/pkg/stream"
)

// 2 dimensional vector.
type Vec2 struct {
	// `x` coordinate of the vector
	X float64
	// `y` coordinate of the vector
	Y float64
}

func NewVec2(x, y float64) Vec2 {
	return Vec2{
		X: x,
		Y: y,
	}
}

// Read Vec2 from reader
func ReadVec2() Vec2 {
	x := flow.ReadFloat64()
	y := flow.ReadFloat64()
	return Vec2{
		X: x,
		Y: y,
	}
}

// Write Vec2 to writer
func (vec2 Vec2) Write() {
	x := vec2.X
	flow.WriteFloat64(x)
	y := vec2.Y
	flow.WriteFloat64(y)
}

// Get string representation of Vec2
func (vec2 Vec2) String() string {
	stringResult := "{ "
	stringResult += "X: "
	x := vec2.X
	stringResult += fmt.Sprint(x)
	stringResult += ", "
	stringResult += "Y: "
	y := vec2.Y
	stringResult += fmt.Sprint(y)
	stringResult += " }"
	return stringResult
}
