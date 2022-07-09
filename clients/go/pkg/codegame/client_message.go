package codegame

import (
	"aicup22/pkg/debugging"
	"aicup22/pkg/model"
	"aicup22/pkg/stream"
)

// Message sent from client
type ClientMessage interface {
	// Write ClientMessage to writer
	Write()

	// Get string representation of ClientMessage
	String() string
}

// Read ClientMessage from reader
func ReadClientMessage() ClientMessage {
	switch stream.Flow().ReadInt32() {
	case 0:
		return ReadClientMessageDebugMessage()
	case 1:
		return ReadClientMessageOrderMessage()
	case 2:
		return ReadClientMessageDebugUpdateDone()
	case 3:
		return ReadClientMessageRequestDebugState()
	}
	// FIXME: НИКОГДА не используйте панику в инфраструктурном коде
	panic("Unexpected tag value")
}

// Ask app to perform new debug command
type ClientMessageDebugMessage struct {
	// Command to perform
	Command debugging.DebugCommand
}

func NewClientMessageDebugMessage(command debugging.DebugCommand) ClientMessageDebugMessage {
	return ClientMessageDebugMessage{
		Command: command,
	}
}

// Read DebugMessage from reader
func ReadClientMessageDebugMessage() ClientMessageDebugMessage {
	command := debugging.ReadDebugCommand()
	return ClientMessageDebugMessage{
		Command: command,
	}
}

// Write DebugMessage to writer
func (clientMessageDebugMessage ClientMessageDebugMessage) Write() {
	flow.WriteInt32(0)
	command := clientMessageDebugMessage.Command
	command.Write()
}

// Get string representation of DebugMessage
func (clientMessageDebugMessage ClientMessageDebugMessage) String() string {
	stringResult := "{ "
	stringResult += "Command: "
	command := clientMessageDebugMessage.Command
	stringResult += command.String()
	stringResult += " }"
	return stringResult
}

// Reply for ServerMessage::GetOrder
type ClientMessageOrderMessage struct {
	// Player's order
	Order model.Order
}

func NewClientMessageOrderMessage(order model.Order) ClientMessageOrderMessage {
	return ClientMessageOrderMessage{
		Order: order,
	}
}

// Read OrderMessage from reader
func ReadClientMessageOrderMessage() ClientMessageOrderMessage {
	order := model.ReadOrder()
	return ClientMessageOrderMessage{
		Order: order,
	}
}

// Write OrderMessage to writer
func (clientMessageOrderMessage ClientMessageOrderMessage) Write() {
	flow.WriteInt32(1)
	order := clientMessageOrderMessage.Order
	order.Write()
}

// Get string representation of OrderMessage
func (clientMessageOrderMessage ClientMessageOrderMessage) String() string {
	stringResult := "{ "
	stringResult += "Order: "
	order := clientMessageOrderMessage.Order
	stringResult += order.String()
	stringResult += " }"
	return stringResult
}

// Signifies finish of the debug update
type ClientMessageDebugUpdateDone struct {
}

func NewClientMessageDebugUpdateDone() ClientMessageDebugUpdateDone {
	return ClientMessageDebugUpdateDone{}
}

// Read DebugUpdateDone from reader
func ReadClientMessageDebugUpdateDone() ClientMessageDebugUpdateDone {
	return ClientMessageDebugUpdateDone{}
}

// Write DebugUpdateDone to writer
func (clientMessageDebugUpdateDone ClientMessageDebugUpdateDone) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(2)
}

// Get string representation of DebugUpdateDone
func (clientMessageDebugUpdateDone ClientMessageDebugUpdateDone) String() string {
	stringResult := "{ "
	stringResult += " }"
	return stringResult
}

// Request debug state from the app
type ClientMessageRequestDebugState struct {
}

func NewClientMessageRequestDebugState() ClientMessageRequestDebugState {
	return ClientMessageRequestDebugState{}
}

// Read RequestDebugState from reader
func ReadClientMessageRequestDebugState() ClientMessageRequestDebugState {
	return ClientMessageRequestDebugState{}
}

// Write RequestDebugState to writer
func (clientMessageRequestDebugState ClientMessageRequestDebugState) Write() {
	flow.WriteInt32(3)
}

// Get string representation of RequestDebugState
func (clientMessageRequestDebugState ClientMessageRequestDebugState) String() string {
	stringResult := "{ "
	stringResult += " }"
	return stringResult
}
