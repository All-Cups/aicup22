package model

import (
	"io"

	"aicup22/pkg/stream"
)

// Order for specific unit
type UnitOrder struct {
	// Target moving velocity
	TargetVelocity Vec2
	// Target view direction (vector length doesn't matter)
	TargetDirection Vec2
	// Order to perform an action, or None
	Action *ActionOrder
}

func NewUnitOrder(targetVelocity, targetDirection Vec2, action *ActionOrder) UnitOrder {
	return UnitOrder{
		TargetVelocity:  targetVelocity,
		TargetDirection: targetDirection,
		Action:          action,
	}
}

// Read UnitOrder from reader
func ReadUnitOrder(reader io.Reader) UnitOrder {
	targetVelocity := ReadVec2(reader)
	targetDirection := ReadVec2(reader)
	var action *ActionOrder
	if stream.Flow().ReadBool() {
		actionValue := ReadActionOrder(reader)
		action = &actionValue
	} else {
		action = nil
	}
	return UnitOrder{
		TargetVelocity:  targetVelocity,
		TargetDirection: targetDirection,
		Action:          action,
	}
}

// Write UnitOrder to writer
func (unitOrder UnitOrder) Write(writer io.Writer) {
	targetVelocity := unitOrder.TargetVelocity
	targetVelocity.Write(writer)
	targetDirection := unitOrder.TargetDirection
	targetDirection.Write(writer)
	action := unitOrder.Action
	if action == nil {
		stream.WriteBool(writer, false)
	} else {
		stream.WriteBool(writer, true)
		actionValue := *action
		actionValue.Write(writer)
	}
}

// Get string representation of UnitOrder
func (unitOrder UnitOrder) String() string {
	stringResult := "{ "
	stringResult += "TargetVelocity: "
	targetVelocity := unitOrder.TargetVelocity
	stringResult += targetVelocity.String()
	stringResult += ", "
	stringResult += "TargetDirection: "
	targetDirection := unitOrder.TargetDirection
	stringResult += targetDirection.String()
	stringResult += ", "
	stringResult += "Action: "
	action := unitOrder.Action
	if action == nil {
		stringResult += "nil"
	} else {
		actionValue := *action
		stringResult += actionValue.String()
	}
	stringResult += " }"
	return stringResult
}
