package debugging

import (
	"fmt"
	"io"

	"aicup22/pkg/stream"
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
func ReadColor(reader io.Reader) Color {
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
func (color Color) Write(writer io.Writer) {
	r := color.R
	stream.WriteFloat64(writer, r)
	g := color.G
	stream.WriteFloat64(writer, g)
	b := color.B
	stream.WriteFloat64(writer, b)
	a := color.A
	stream.WriteFloat64(writer, a)
}

// Get string representation of Color
func (color Color) String() string {
	stringResult := "{ "
	stringResult += "R: "
	r := color.R
	stringResult += fmt.Sprint(r)
	stringResult += ", "
	stringResult += "G: "
	g := color.G
	stringResult += fmt.Sprint(g)
	stringResult += ", "
	stringResult += "B: "
	b := color.B
	stringResult += fmt.Sprint(b)
	stringResult += ", "
	stringResult += "A: "
	a := color.A
	stringResult += fmt.Sprint(a)
	stringResult += " }"
	return stringResult
}
