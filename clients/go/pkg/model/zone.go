package model

import (
	"fmt"
	// "aicup22/pkg/stream"
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
func ReadZone() Zone {
	currentCenter := ReadVec2()
	currentRadius := flow.ReadFloat64()
	nextCenter := ReadVec2()
	nextRadius := flow.ReadFloat64()
	return Zone{
		CurrentCenter: currentCenter,
		CurrentRadius: currentRadius,
		NextCenter:    nextCenter,
		NextRadius:    nextRadius,
	}
}

// Write Zone to writer
func (zone Zone) Write() {
	currentCenter := zone.CurrentCenter
	currentCenter.Write()
	currentRadius := zone.CurrentRadius
	flow.WriteFloat64(currentRadius)
	nextCenter := zone.NextCenter
	nextCenter.Write()
	nextRadius := zone.NextRadius
	flow.WriteFloat64(nextRadius)
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
