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
func (sf Sound) Write() {
	typeIndex := sf.TypeIndex
	flow.WriteInt32(typeIndex)
	unitId := sf.UnitId
	flow.WriteInt32(unitId)
	position := sf.Position
	position.Write()
}

// Get string representation of Sound
func (sf Sound) String() string {
	strRes := "{ "
	strRes += "TypeIndex: "
	typeIndex := sf.TypeIndex
	strRes += fmt.Sprint(typeIndex)
	strRes += ", "
	strRes += "UnitId: "
	unitId := sf.UnitId
	strRes += fmt.Sprint(unitId)
	strRes += ", "
	strRes += "Position: "
	position := sf.Position
	strRes += position.String()
	strRes += " }"
	return strRes
}
