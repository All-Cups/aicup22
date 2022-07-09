package debugging

import (
	"io"

	"aicup22/model"
)

// Point + color
type ColoredVertex struct {
	// Position
	Position model.Vec2
	// Color
	Color Color
}

func NewColoredVertex(position model.Vec2, color Color) ColoredVertex {
	return ColoredVertex{
		Position: position,
		Color:    color,
	}
}

// Read ColoredVertex from reader
func ReadColoredVertex(reader io.Reader) ColoredVertex {
	position := model.ReadVec2(reader)
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
