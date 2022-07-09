package model

import (
	"fmt"
	"io"

	"aicup22/pkg/stream"
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
func ReadSoundProperties(reader io.Reader) SoundProperties {
	name := stream.ReadString(reader)
	distance := stream.ReadFloat64(reader)
	offset := stream.ReadFloat64(reader)
	return SoundProperties{
		Name:     name,
		Distance: distance,
		Offset:   offset,
	}
}

// Write SoundProperties to writer
func (soundProperties SoundProperties) Write(writer io.Writer) {
	name := soundProperties.Name
	stream.WriteString(writer, name)
	distance := soundProperties.Distance
	stream.WriteFloat64(writer, distance)
	offset := soundProperties.Offset
	stream.WriteFloat64(writer, offset)
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
