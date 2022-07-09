package codegame

import (
	"fmt"
	"io"

	"aicup22/model"

	"aicup22/stream"
)

// Message sent from server
type ServerMessage interface {
	// Write ServerMessage to writer
	Write(writer io.Writer)

	// Get string representation of ServerMessage
	String() string
}

// Read ServerMessage from reader
func ReadServerMessage(reader io.Reader) ServerMessage {
	switch stream.ReadInt32(reader) {
	case 0:
		return ReadServerMessageUpdateConstants(reader)
	case 1:
		return ReadServerMessageGetOrder(reader)
	case 2:
		return ReadServerMessageFinish(reader)
	case 3:
		return ReadServerMessageDebugUpdate(reader)
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
func ReadServerMessageUpdateConstants(reader io.Reader) ServerMessageUpdateConstants {
	constants := model.ReadConstants(reader)
	return ServerMessageUpdateConstants{
		Constants: constants,
	}
}

// Write UpdateConstants to writer
func (serverMessageUpdateConstants ServerMessageUpdateConstants) Write(writer io.Writer) {
	stream.WriteInt32(writer, 0)
	constants := serverMessageUpdateConstants.Constants
	constants.Write(writer)
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
func ReadServerMessageGetOrder(reader io.Reader) ServerMessageGetOrder {
	playerView := model.ReadGame(reader)
	debugAvailable := stream.ReadBool(reader)
	return ServerMessageGetOrder{
		PlayerView:     playerView,
		DebugAvailable: debugAvailable,
	}
}

// Write GetOrder to writer
func (serverMessageGetOrder ServerMessageGetOrder) Write(writer io.Writer) {
	stream.WriteInt32(writer, 1)
	playerView := serverMessageGetOrder.PlayerView
	playerView.Write(writer)
	debugAvailable := serverMessageGetOrder.DebugAvailable
	stream.WriteBool(writer, debugAvailable)
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
func ReadServerMessageFinish(reader io.Reader) ServerMessageFinish {
	return ServerMessageFinish{}
}

// Write Finish to writer
func (serverMessageFinish ServerMessageFinish) Write(writer io.Writer) {
	stream.WriteInt32(writer, 2)
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
func ReadServerMessageDebugUpdate(reader io.Reader) ServerMessageDebugUpdate {
	displayedTick := stream.ReadInt32(reader)
	return ServerMessageDebugUpdate{
		DisplayedTick: displayedTick,
	}
}

// Write DebugUpdate to writer
func (serverMessageDebugUpdate ServerMessageDebugUpdate) Write(writer io.Writer) {
	stream.WriteInt32(writer, 3)
	displayedTick := serverMessageDebugUpdate.DisplayedTick
	stream.WriteInt32(writer, displayedTick)
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
