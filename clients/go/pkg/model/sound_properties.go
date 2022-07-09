package model

import (
	"fmt"
	// "aicup22/pkg/stream"
)

// Sound properties
type SoundProperties struct {
	// Name
	Name string
	// Distance from which the sound can be heard
	Distance float64
	// Offset modifier
	Offset float64
}

func NewSoundProperties(name string, distance, offset float64) SoundProperties {
	return SoundProperties{
		Name:     name,
		Distance: distance,
		Offset:   offset,
	}
}

// Read SoundProperties from reader
func ReadSoundProperties() SoundProperties {
	name := flow.ReadString()
	distance := flow.ReadFloat64()
	offset := flow.ReadFloat64()
	return SoundProperties{
		Name:     name,
		Distance: distance,
		Offset:   offset,
	}
}

// Write SoundProperties to writer
func (soundProperties SoundProperties) Write() {
	name := soundProperties.Name
	flow.WriteString(name)
	distance := soundProperties.Distance
	flow.WriteFloat64(distance)
	offset := soundProperties.Offset
	flow.WriteFloat64(offset)
}

// Get string representation of SoundProperties
func (soundProperties SoundProperties) String() string {
	stringResult := "{ "
	stringResult += "Name: "
	name := soundProperties.Name
	stringResult += "\"" + name + "\""
	stringResult += ", "
	stringResult += "Distance: "
	distance := soundProperties.Distance
	stringResult += fmt.Sprint(distance)
	stringResult += ", "
	stringResult += "Offset: "
	offset := soundProperties.Offset
	stringResult += fmt.Sprint(offset)
	stringResult += " }"
	return stringResult
}
