package model

import (
	"fmt"
	"io"

	. "aicup22/stream"
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

func NewSound(typeIndex int32, unitId int32, position Vec2) Sound {
	return Sound{
		TypeIndex: typeIndex,
		UnitId:    unitId,
		Position:  position,
	}
}

// Read Sound from reader
func ReadSound(reader io.Reader) Sound {
	var typeIndex int32
	typeIndex = ReadInt32(reader)
	var unitId int32
	unitId = ReadInt32(reader)
	var position Vec2
	position = ReadVec2(reader)
	return Sound{
		TypeIndex: typeIndex,
		UnitId:    unitId,
		Position:  position,
	}
}

// Write Sound to writer
func (sound Sound) Write(writer io.Writer) {
	typeIndex := sound.TypeIndex
	WriteInt32(writer, typeIndex)
	unitId := sound.UnitId
	WriteInt32(writer, unitId)
	position := sound.Position
	position.Write(writer)
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
