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
func (sf Vec2) Write() {
	x := sf.X
	flow.WriteFloat64(x)
	y := sf.Y
	flow.WriteFloat64(y)
}

// Get string representation of Vec2
func (sf Vec2) String() string {
	strRes := "{ "
	strRes += "X: "
	x := sf.X
	strRes += fmt.Sprint(x)
	strRes += ", "
	strRes += "Y: "
	y := sf.Y
	strRes += fmt.Sprint(y)
	strRes += " }"
	return strRes
}
