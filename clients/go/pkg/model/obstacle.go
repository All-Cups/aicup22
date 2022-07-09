package model

import (
	"fmt"
	// "aicup22/pkg/stream"
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
func ReadObstacle() Obstacle {
	id := flow.ReadInt32()
	position := ReadVec2()
	radius := flow.ReadFloat64()
	canSeeThrough := flow.ReadBool()
	canShootThrough := flow.ReadBool()
	return Obstacle{
		Id:              id,
		Position:        position,
		Radius:          radius,
		CanSeeThrough:   canSeeThrough,
		CanShootThrough: canShootThrough,
	}
}

// Write Obstacle to writer
func (sf Obstacle) Write() {
	id := sf.Id
	flow.WriteInt32(id)
	position := sf.Position
	position.Write()
	radius := sf.Radius
	flow.WriteFloat64(radius)
	canSeeThrough := sf.CanSeeThrough
	flow.WriteBool(canSeeThrough)
	canShootThrough := sf.CanShootThrough
	flow.WriteBool(canShootThrough)
}

// Get string representation of Obstacle
func (sf Obstacle) String() string {
	strRes := "{ "
	strRes += "Id: "
	id := sf.Id
	strRes += fmt.Sprint(id)
	strRes += ", "
	strRes += "Position: "
	position := sf.Position
	strRes += position.String()
	strRes += ", "
	strRes += "Radius: "
	radius := sf.Radius
	strRes += fmt.Sprint(radius)
	strRes += ", "
	strRes += "CanSeeThrough: "
	canSeeThrough := sf.CanSeeThrough
	strRes += fmt.Sprint(canSeeThrough)
	strRes += ", "
	strRes += "CanShootThrough: "
	canShootThrough := sf.CanShootThrough
	strRes += fmt.Sprint(canShootThrough)
	strRes += " }"
	return strRes
}
