package model

import (
	"fmt"
	"io"

	"aicup22/pkg/stream"
)

// An obstacle on the map
type Obstacle struct {
	// Unique id
	Id int32
	// Center position
	Position Vec2
	// Obstacle's radius
	Radius float64
	// Whether units can see through this obstacle, or it blocks the view
	CanSeeThrough bool
	// Whether projectiles can go through this obstacle
	CanShootThrough bool
}

func NewObstacle(id int32, position Vec2, radius float64, canSeeThrough, canShootThrough bool) Obstacle {
	return Obstacle{
		Id:              id,
		Position:        position,
		Radius:          radius,
		CanSeeThrough:   canSeeThrough,
		CanShootThrough: canShootThrough,
	}
}

// Read Obstacle from reader
func ReadObstacle(reader io.Reader) Obstacle {
	id := stream.Flow().ReadInt32()
	position := ReadVec2(reader)
	radius := flow.ReadFloat64()
	canSeeThrough := flow.ReadBool()
	canShootThrough := stream.Flow().ReadBool()
	return Obstacle{
		Id:              id,
		Position:        position,
		Radius:          radius,
		CanSeeThrough:   canSeeThrough,
		CanShootThrough: canShootThrough,
	}
}

// Write Obstacle to writer
func (obstacle Obstacle) Write(writer io.Writer) {
	id := obstacle.Id
	stream.WriteInt32(writer, id)
	position := obstacle.Position
	position.Write(writer)
	radius := obstacle.Radius
	stream.WriteFloat64(writer, radius)
	canSeeThrough := obstacle.CanSeeThrough
	stream.WriteBool(writer, canSeeThrough)
	canShootThrough := obstacle.CanShootThrough
	stream.WriteBool(writer, canShootThrough)
}

// Get string representation of Obstacle
func (obstacle Obstacle) String() string {
	stringResult := "{ "
	stringResult += "Id: "
	id := obstacle.Id
	stringResult += fmt.Sprint(id)
	stringResult += ", "
	stringResult += "Position: "
	position := obstacle.Position
	stringResult += position.String()
	stringResult += ", "
	stringResult += "Radius: "
	radius := obstacle.Radius
	stringResult += fmt.Sprint(radius)
	stringResult += ", "
	stringResult += "CanSeeThrough: "
	canSeeThrough := obstacle.CanSeeThrough
	stringResult += fmt.Sprint(canSeeThrough)
	stringResult += ", "
	stringResult += "CanShootThrough: "
	canShootThrough := obstacle.CanShootThrough
	stringResult += fmt.Sprint(canShootThrough)
	stringResult += " }"
	return stringResult
}
