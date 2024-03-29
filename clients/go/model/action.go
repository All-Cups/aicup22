package model

import "fmt"
import "io"
import . "ai_cup_22/stream"

// Action unit is currently performing
type Action struct {
    // Tick when the action will be finished
    FinishTick int32
    // Type of the action
    ActionType ActionType
}

func NewAction(finishTick int32, actionType ActionType) Action {
    return Action {
        FinishTick: finishTick,
        ActionType: actionType,
    }
}

// Read Action from reader
func ReadAction(reader io.Reader) Action {
    var finishTick int32
    finishTick = ReadInt32(reader)
    var actionType ActionType
    actionType = ReadActionType(reader)
    return Action {
        FinishTick: finishTick,
        ActionType: actionType,
    }
}

// Write Action to writer
func (action Action) Write(writer io.Writer) {
    finishTick := action.FinishTick
    WriteInt32(writer, finishTick)
    actionType := action.ActionType
    WriteInt32(writer, int32(actionType))
}

// Get string representation of Action
func (action Action) String() string {
    stringResult := "{ "
    stringResult += "FinishTick: "
    finishTick := action.FinishTick
    stringResult += fmt.Sprint(finishTick)
    stringResult += ", "
    stringResult += "ActionType: "
    actionType := action.ActionType
    stringResult += ActionTypeToString(actionType)
    stringResult += " }"
    return stringResult
}