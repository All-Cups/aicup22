package model

import (
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
func ReadUnitOrder() UnitOrder {
	targetVelocity := ReadVec2()
	targetDirection := ReadVec2()
	var action *ActionOrder
	if stream.Flow().ReadBool() {
		actionValue := ReadActionOrder()
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
func (sf UnitOrder) Write() {
	targetVelocity := sf.TargetVelocity
	targetVelocity.Write()
	targetDirection := sf.TargetDirection
	targetDirection.Write()
	action := sf.Action
	if action == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		actionValue := *action
		actionValue.Write()
	}
}

// Get string representation of UnitOrder
func (sf UnitOrder) String() string {
	strRes := "{ "
	strRes += "TargetVelocity: "
	targetVelocity := sf.TargetVelocity
	strRes += targetVelocity.String()
	strRes += ", "
	strRes += "TargetDirection: "
	targetDirection := sf.TargetDirection
	strRes += targetDirection.String()
	strRes += ", "
	strRes += "Action: "
	action := sf.Action
	if action == nil {
		strRes += "nil"
	} else {
		actionValue := *action
		strRes += actionValue.String()
	}
	strRes += " }"
	return strRes
}
