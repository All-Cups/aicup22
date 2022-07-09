package model

import (
	"fmt"
	"io"

	"aicup22/pkg/stream"
)

// Current state of the game zone
type Zone struct {
	// Current center
	CurrentCenter Vec2
	// Current radius
	CurrentRadius float64
	// Next center
	NextCenter Vec2
	// Next radius
	NextRadius float64
}

func NewZone(currentCenter Vec2, currentRadius float64, nextCenter Vec2, nextRadius float64) Zone {
	return Zone{
		CurrentCenter: currentCenter,
		CurrentRadius: currentRadius,
		NextCenter:    nextCenter,
		NextRadius:    nextRadius,
	}
}

// Read Zone from reader
func ReadZone(reader io.Reader) Zone {
	currentCenter := ReadVec2(reader)
	currentRadius := stream.ReadFloat64(reader)
	nextCenter := ReadVec2(reader)
	nextRadius := stream.ReadFloat64(reader)
	return Zone{
		CurrentCenter: currentCenter,
		CurrentRadius: currentRadius,
		NextCenter:    nextCenter,
		NextRadius:    nextRadius,
	}
}

// Write Zone to writer
func (zone Zone) Write(writer io.Writer) {
	currentCenter := zone.CurrentCenter
	currentCenter.Write(writer)
	currentRadius := zone.CurrentRadius
	stream.WriteFloat64(writer, currentRadius)
	nextCenter := zone.NextCenter
	nextCenter.Write(writer)
	nextRadius := zone.NextRadius
	stream.WriteFloat64(writer, nextRadius)
}

// Get string representation of Zone
func (zone Zone) String() string {
	stringResult := "{ "
	stringResult += "CurrentCenter: "
	currentCenter := zone.CurrentCenter
	stringResult += currentCenter.String()
	stringResult += ", "
	stringResult += "CurrentRadius: "
	currentRadius := zone.CurrentRadius
	stringResult += fmt.Sprint(currentRadius)
	stringResult += ", "
	stringResult += "NextCenter: "
	nextCenter := zone.NextCenter
	stringResult += nextCenter.String()
	stringResult += ", "
	stringResult += "NextRadius: "
	nextRadius := zone.NextRadius
	stringResult += fmt.Sprint(nextRadius)
	stringResult += " }"
	return stringResult
}
