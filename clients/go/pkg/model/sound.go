package model

import (
	"fmt"

	"aicup22/pkg/stream"
)

// Sound heard by one of your units
type Sound struct {
	// Sound type index (starting with 0)
	TypeIndex int32
	// Id of unit that heard this sound
	UnitId int32
	// Position where sound was heard (different from sound source position)
	Position Vec2
}

func NewSound(typeIndex, unitId int32, position Vec2) Sound {
	return Sound{
		TypeIndex: typeIndex,
		UnitId:    unitId,
		Position:  position,
	}
}

// Read Sound from reader
func ReadSound() Sound {
	typeIndex := flow.ReadInt32()
	unitId := stream.Flow().ReadInt32()
	position := ReadVec2()
	return Sound{
		TypeIndex: typeIndex,
		UnitId:    unitId,
		Position:  position,
	}
}

// Write Sound to writer
func (sound Sound) Write() {
	typeIndex := sound.TypeIndex
	flow.WriteInt32(typeIndex)
	unitId := sound.UnitId
	flow.WriteInt32(unitId)
	position := sound.Position
	position.Write()
}

// Get string representation of Sound
func (sound Sound) String() string {
	stringResult := "{ "
	stringResult += "TypeIndex: "
	typeIndex := sound.TypeIndex
	stringResult += fmt.Sprint(typeIndex)
	stringResult += ", "
	stringResult += "UnitId: "
	unitId := sound.UnitId
	stringResult += fmt.Sprint(unitId)
	stringResult += ", "
	stringResult += "Position: "
	position := sound.Position
	stringResult += position.String()
	stringResult += " }"
	return stringResult
}
