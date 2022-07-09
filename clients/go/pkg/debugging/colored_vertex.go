package debugging

import (
	"aicup22/pkg/model"
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
func ReadColoredVertex() ColoredVertex {
	position := model.ReadVec2()
	color := ReadColor()
	return ColoredVertex{
		Position: position,
		Color:    color,
	}
}

// Write ColoredVertex to writer
func (coloredVertex ColoredVertex) Write() {
	position := coloredVertex.Position
	position.Write()
	color := coloredVertex.Color
	color.Write()
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
