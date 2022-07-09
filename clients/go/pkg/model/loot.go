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
func (sf Loot) Write() {
	id := sf.Id
	flow.WriteInt32(id)
	position := sf.Position
	position.Write()
	item := sf.Item
	item.Write()
}

// Get string representation of Loot
func (sf Loot) String() string {
	strRes := "{ "
	strRes += "Id: "
	id := sf.Id
	strRes += fmt.Sprint(id)
	strRes += ", "
	strRes += "Position: "
	position := sf.Position
	strRes += position.String()
	strRes += ", "
	strRes += "Item: "
	item := sf.Item
	strRes += item.String()
	strRes += " }"
	return strRes
}
