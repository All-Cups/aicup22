package model

import "fmt"
import "io"
import . "ai_cup_22/stream"

// 2 dimensional vector.
type Vec2 struct {
    // `x` coordinate of the vector
    X float64
    // `y` coordinate of the vector
    Y float64
}

func NewVec2(x float64, y float64) Vec2 {
    return Vec2 {
        X: x,
        Y: y,
    }
}

// Read Vec2 from reader
func ReadVec2(reader io.Reader) Vec2 {
    var x float64
    x = ReadFloat64(reader)
    var y float64
    y = ReadFloat64(reader)
    return Vec2 {
        X: x,
        Y: y,
    }
}

// Write Vec2 to writer
func (vec2 Vec2) Write(writer io.Writer) {
    x := vec2.X
    WriteFloat64(writer, x)
    y := vec2.Y
    WriteFloat64(writer, y)
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