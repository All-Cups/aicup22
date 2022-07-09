package debugging

import (
	. "aicup22/model"
	"io"
)

// Point + color
type ColoredVertex struct {
	// Position
	Position Vec2
	// Color
	Color Color
}

func NewColoredVertex(position Vec2, color Color) ColoredVertex {
	return ColoredVertex{
		Position: position,
		Color:    color,
	}
}

// Read ColoredVertex from reader
func ReadColoredVertex(reader io.Reader) ColoredVertex {
	position := ReadVec2(reader)
	color := ReadColor(reader)
	return ColoredVertex{
		Position: position,
		Color:    color,
	}
}

// Write ColoredVertex to writer
func (coloredVertex ColoredVertex) Write(writer io.Writer) {
	position := coloredVertex.Position
	position.Write(writer)
	color := coloredVertex.Color
	color.Write(writer)
}

// Get string representation of ColoredVertex
func (coloredVertex ColoredVertex) String() string {
	stringResult := "{ "
	stringResult += "Position: "
	position := coloredVertex.Position
	stringResult += position.String()
	stringResult += ", "
	stringResult += "Color: "
	color := coloredVertex.Color
	stringResult += color.String()
	stringResult += " }"
	return stringResult
}
