package model

import (
	"fmt"

	"aicup22/pkg/stream"
)

// Loot lying on the ground
type Loot struct {
	// Unique id
	Id int32
	// Position
	Position Vec2
	// Item
	Item Item
}

func NewLoot(id int32, position Vec2, item Item) Loot {
	return Loot{
		Id:       id,
		Position: position,
		Item:     item,
	}
}

// Read Loot from reader
func ReadLoot() Loot {
	id := stream.Flow().ReadInt32()
	position := ReadVec2()
	item := ReadItem()
	return Loot{
		Id:       id,
		Position: position,
		Item:     item,
	}
}

// Write Loot to writer
func (loot Loot) Write() {
	id := loot.Id
	flow.WriteInt32(id)
	position := loot.Position
	position.Write()
	item := loot.Item
	item.Write()
}

// Get string representation of Loot
func (loot Loot) String() string {
	stringResult := "{ "
	stringResult += "Id: "
	id := loot.Id
	stringResult += fmt.Sprint(id)
	stringResult += ", "
	stringResult += "Position: "
	position := loot.Position
	stringResult += position.String()
	stringResult += ", "
	stringResult += "Item: "
	item := loot.Item
	stringResult += item.String()
	stringResult += " }"
	return stringResult
}
