package debugging

import (
	"fmt"
)

// RGBA Color
type Color struct {
	// Red component
	R float64
	// Green component
	G float64
	// Blue component
	B float64
	// Alpha (opacity) component
	A float64
}

func NewColor(r, g, b, a float64) Color {
	return Color{
		R: r,
		G: g,
		B: b,
		A: a,
	}
}

// Read Color from reader
func ReadColor() Color {
	r := flow.ReadFloat64()
	g := flow.ReadFloat64()
	b := flow.ReadFloat64()
	a := flow.ReadFloat64()
	return Color{
		R: r,
		G: g,
		B: b,
		A: a,
	}
}

// Write Color to writer
func (sf Color) Write() {
	r := sf.R
	flow.WriteFloat64(r)
	g := sf.G
	flow.WriteFloat64(g)
	b := sf.B
	flow.WriteFloat64(b)
	a := sf.A
	flow.WriteFloat64(a)
}

// Get string representation of Color
func (sf Color) String() string {
	strRes := "{ "
	strRes += "R: "
	r := sf.R
	strRes += fmt.Sprint(r)
	strRes += ", "
	strRes += "G: "
	g := sf.G
	strRes += fmt.Sprint(g)
	strRes += ", "
	strRes += "B: "
	b := sf.B
	strRes += fmt.Sprint(b)
	strRes += ", "
	strRes += "A: "
	a := sf.A
	strRes += fmt.Sprint(a)
	strRes += " }"
	return strRes
}
