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
func (sf ColoredVertex) Write() {
	sf.Position.Write()
	sf.Color.Write()
}

// Get string representation of ColoredVertex
func (sf ColoredVertex) String() string {
	strRes := "{Position:" + sf.Position.String() + ","
	strRes += "Color:" + sf.Color.String() + "}"
	return strRes
}
