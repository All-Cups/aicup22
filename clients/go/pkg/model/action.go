package model

import (
	"fmt"
)

// Action unit is currently performing
type Action struct {
	// Tick when the action will be finished
	FinishTick int32
	// Type of the action
	ActionType ActionType
}

func NewAction(finishTick int32, actionType ActionType) Action {
	return Action{
		FinishTick: finishTick,
		ActionType: actionType,
	}
}

// Read Action from reader
func ReadAction() Action {
	finishTick := flow.ReadInt32()
	actionType := ReadActionType()
	return Action{
		FinishTick: finishTick,
		ActionType: actionType,
	}
}

// Write Action to writer
func (sf Action) Write() {
	finishTick := sf.FinishTick
	flow.WriteInt32(finishTick)
	actionType := sf.ActionType
	flow.WriteInt32(int32(actionType))
}

// Get string representation of Action
func (sf Action) String() string {
	stringResult := "{ "
	stringResult += "FinishTick: "
	finishTick := sf.FinishTick
	stringResult += fmt.Sprint(finishTick)
	stringResult += ", "
	stringResult += "ActionType: "
	actionType := sf.ActionType
	stringResult += ActionTypeToString(actionType)
	stringResult += " }"
	return stringResult
}
