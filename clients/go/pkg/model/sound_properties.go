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
func (sf SoundProperties) Write() {
	name := sf.Name
	flow.WriteString(name)
	distance := sf.Distance
	flow.WriteFloat64(distance)
	offset := sf.Offset
	flow.WriteFloat64(offset)
}

// Get string representation of SoundProperties
func (sf SoundProperties) String() string {
	strRes := "{ "
	strRes += "Name: "
	name := sf.Name
	strRes += "\"" + name + "\""
	strRes += ", "
	strRes += "Distance: "
	distance := sf.Distance
	strRes += fmt.Sprint(distance)
	strRes += ", "
	strRes += "Offset: "
	offset := sf.Offset
	strRes += fmt.Sprint(offset)
	strRes += " }"
	return strRes
}
