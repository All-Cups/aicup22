package debugging

import "fmt"
import "io"
import . "ai_cup_22/stream"

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

func NewColor(r float64, g float64, b float64, a float64) Color {
    return Color {
        R: r,
        G: g,
        B: b,
        A: a,
    }
}

// Read Color from reader
func ReadColor(reader io.Reader) Color {
    var r float64
    r = ReadFloat64(reader)
    var g float64
    g = ReadFloat64(reader)
    var b float64
    b = ReadFloat64(reader)
    var a float64
    a = ReadFloat64(reader)
    return Color {
        R: r,
        G: g,
        B: b,
        A: a,
    }
}

// Write Color to writer
func (color Color) Write(writer io.Writer) {
    r := color.R
    WriteFloat64(writer, r)
    g := color.G
    WriteFloat64(writer, g)
    b := color.B
    WriteFloat64(writer, b)
    a := color.A
    WriteFloat64(writer, a)
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