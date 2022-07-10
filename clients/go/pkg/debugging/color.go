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
	return Color{
		R: flow.ReadFloat64(),
		G: flow.ReadFloat64(),
		B: flow.ReadFloat64(),
		A: flow.ReadFloat64(),
	}
}

// Write Color to writer
func (sf Color) Write() {
	flow.WriteFloat64(sf.R)
	flow.WriteFloat64(sf.G)
	flow.WriteFloat64(sf.B)
	flow.WriteFloat64(sf.A)
}

// Get string representation of Color
func (sf Color) String() string {
	strRes := "{R:" + fmt.Sprint(sf.R) + ","
	strRes += "G:" + fmt.Sprint(sf.G) + ","
	strRes += "B:" + fmt.Sprint(sf.B) + ","
	strRes += "A:" + strRes + fmt.Sprint(sf.A) + "}"
	return strRes
}
