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
func (sf Zone) Write() {
	currentCenter := sf.CurrentCenter
	currentCenter.Write()
	currentRadius := sf.CurrentRadius
	flow.WriteFloat64(currentRadius)
	nextCenter := sf.NextCenter
	nextCenter.Write()
	nextRadius := sf.NextRadius
	flow.WriteFloat64(nextRadius)
}

// Get string representation of Zone
func (sf Zone) String() string {
	strRes := "{ "
	strRes += "CurrentCenter: "
	currentCenter := sf.CurrentCenter
	strRes += currentCenter.String()
	strRes += ", "
	strRes += "CurrentRadius: "
	currentRadius := sf.CurrentRadius
	strRes += fmt.Sprint(currentRadius)
	strRes += ", "
	strRes += "NextCenter: "
	nextCenter := sf.NextCenter
	strRes += nextCenter.String()
	strRes += ", "
	strRes += "NextRadius: "
	nextRadius := sf.NextRadius
	strRes += fmt.Sprint(nextRadius)
	strRes += " }"
	return strRes
}
