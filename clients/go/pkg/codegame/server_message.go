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
	switch flow.ReadInt32() {
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
	return ServerMessageUpdateConstants{
		Constants: model.ReadConstants(),
	}
}

// Write UpdateConstants to writer
func (sf ServerMessageUpdateConstants) Write() {
	flow.WriteInt32(0)
	sf.Constants.Write()
}

// Get string representation of UpdateConstants
func (sf ServerMessageUpdateConstants) String() string {
	return "{Constants:" + sf.Constants.String() + "}"
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
func (sf ServerMessageGetOrder) Write() {
	flow.WriteInt32(1)
	sf.PlayerView.Write()
	flow.WriteBool(sf.DebugAvailable)
}

// Get string representation of GetOrder
func (sf ServerMessageGetOrder) String() string {
	stringResult := "{PlayerView:" + sf.PlayerView.String() + ","
	stringResult += "DebugAvailable:" + fmt.Sprint(sf.DebugAvailable) + "}"
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
func (sf ServerMessageFinish) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(2)
}

// Get string representation of Finish
func (sf ServerMessageFinish) String() string {
	return "{}"
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
func (sf ServerMessageDebugUpdate) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(3)
	flow.WriteInt32(sf.DisplayedTick)
}

// Get string representation of DebugUpdate
func (sf ServerMessageDebugUpdate) String() string {
	return "{DisplayedTick:" + fmt.Sprint(sf.DisplayedTick) + "}"
}
