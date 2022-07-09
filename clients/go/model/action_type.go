package model

import (
	"io"

	. "aicup22/stream"
)

// Type of action a unit is currently performing
type ActionType int32

const (
	// Picking up or dropping loot
	ActionTypeLooting ActionType = 0
	// Using a shield potion
	ActionTypeUseShieldPotion ActionType = 1
)

// Read ActionType from reader
func ReadActionType(reader io.Reader) ActionType {
	switch ReadInt32(reader) {
	case 0:
		return ActionTypeLooting
	case 1:
		return ActionTypeUseShieldPotion
	}
	panic("Unexpected tag value")
}

// Get string representation of ActionType
func ActionTypeToString(actionType ActionType) string {
	switch actionType {
	case ActionTypeLooting:
		return "Looting"
	case ActionTypeUseShieldPotion:
		return "UseShieldPotion"
	}
	panic("Impossible happened")
}
