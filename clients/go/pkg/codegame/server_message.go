package codegame

import (
	"fmt"

	"aicup22/pkg/model"
	"aicup22/pkg/stream"
)

var (
	flow *stream.Stream
)

func init() {
	flow = stream.Flow()
}

// Message sent from server
type ServerMessage interface {
	// Write ServerMessage to writer
	Write()

	// Get string representation of ServerMessage
	String() string
}

// Read ServerMessage from reader
func ReadServerMessage() ServerMessage {
	switch stream.Flow().ReadInt32() {
	case 0:
		return ReadServerMessageUpdateConstants()
	case 1:
		return ReadServerMessageGetOrder()
	case 2:
		return ReadServerMessageFinish()
	case 3:
		return ReadServerMessageDebugUpdate()
	}
	panic("Unexpected tag value")
}

// Update constants
type ServerMessageUpdateConstants struct {
	// New constants
	Constants model.Constants
}

func NewServerMessageUpdateConstants(constants model.Constants) ServerMessageUpdateConstants {
	return ServerMessageUpdateConstants{
		Constants: constants,
	}
}

// Read UpdateConstants from reader
func ReadServerMessageUpdateConstants() ServerMessageUpdateConstants {
	constants := model.ReadConstants()
	return ServerMessageUpdateConstants{
		Constants: constants,
	}
}

// Write UpdateConstants to writer
func (serverMessageUpdateConstants ServerMessageUpdateConstants) Write() {
	flow.WriteInt32(0)
	constants := serverMessageUpdateConstants.Constants
	constants.Write()
}

// Get string representation of UpdateConstants
func (serverMessageUpdateConstants ServerMessageUpdateConstants) String() string {
	stringResult := "{ "
	stringResult += "Constants: "
	constants := serverMessageUpdateConstants.Constants
	stringResult += constants.String()
	stringResult += " }"
	return stringResult
}

// Get order for next tick
type ServerMessageGetOrder struct {
	// Player's view
	PlayerView model.Game
	// Whether app is running with debug interface available
	DebugAvailable bool
}

func NewServerMessageGetOrder(playerView model.Game, debugAvailable bool) ServerMessageGetOrder {
	return ServerMessageGetOrder{
		PlayerView:     playerView,
		DebugAvailable: debugAvailable,
	}
}

// Read GetOrder from reader
func ReadServerMessageGetOrder() ServerMessageGetOrder {
	playerView := model.ReadGame()
	debugAvailable := flow.ReadBool()
	return ServerMessageGetOrder{
		PlayerView:     playerView,
		DebugAvailable: debugAvailable,
	}
}

// Write GetOrder to writer
func (serverMessageGetOrder ServerMessageGetOrder) Write() {
	flow.WriteInt32(1)
	playerView := serverMessageGetOrder.PlayerView
	playerView.Write()
	debugAvailable := serverMessageGetOrder.DebugAvailable
	flow.WriteBool(debugAvailable)
}

// Get string representation of GetOrder
func (serverMessageGetOrder ServerMessageGetOrder) String() string {
	stringResult := "{ "
	stringResult += "PlayerView: "
	playerView := serverMessageGetOrder.PlayerView
	stringResult += playerView.String()
	stringResult += ", "
	stringResult += "DebugAvailable: "
	debugAvailable := serverMessageGetOrder.DebugAvailable
	stringResult += fmt.Sprint(debugAvailable)
	stringResult += " }"
	return stringResult
}

// Signifies end of the game
type ServerMessageFinish struct {
}

func NewServerMessageFinish() ServerMessageFinish {
	return ServerMessageFinish{}
}

// Read Finish from reader
func ReadServerMessageFinish() ServerMessageFinish {
	return ServerMessageFinish{}
}

// Write Finish to writer
func (serverMessageFinish ServerMessageFinish) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(2)
}

// Get string representation of Finish
func (serverMessageFinish ServerMessageFinish) String() string {
	stringResult := "{ "
	stringResult += " }"
	return stringResult
}

// Debug update
type ServerMessageDebugUpdate struct {
	// Displayed tick
	DisplayedTick int32
}

func NewServerMessageDebugUpdate(displayedTick int32) ServerMessageDebugUpdate {
	return ServerMessageDebugUpdate{
		DisplayedTick: displayedTick,
	}
}

// Read DebugUpdate from reader
func ReadServerMessageDebugUpdate() ServerMessageDebugUpdate {
	displayedTick := flow.ReadInt32()
	return ServerMessageDebugUpdate{
		DisplayedTick: displayedTick,
	}
}

// Write DebugUpdate to writer
func (serverMessageDebugUpdate ServerMessageDebugUpdate) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(3)
	displayedTick := serverMessageDebugUpdate.DisplayedTick
	flow.WriteInt32(displayedTick)
}

// Get string representation of DebugUpdate
func (serverMessageDebugUpdate ServerMessageDebugUpdate) String() string {
	stringResult := "{ "
	stringResult += "DisplayedTick: "
	displayedTick := serverMessageDebugUpdate.DisplayedTick
	stringResult += fmt.Sprint(displayedTick)
	stringResult += " }"
	return stringResult
}
