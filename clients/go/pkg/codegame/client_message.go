package codegame

import (
	"aicup22/pkg/debugging"
	"aicup22/pkg/model"
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
	switch flow.ReadInt32() {
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
	return ClientMessageDebugMessage{
		Command: debugging.ReadDebugCommand(),
	}
}

// Write DebugMessage to writer
func (sf ClientMessageDebugMessage) Write() {
	flow.WriteInt32(0)
	sf.Command.Write()
}

// Get string representation of DebugMessage
func (sf ClientMessageDebugMessage) String() string {
	return "{Command:" + sf.Command.String() + "}"
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
	return ClientMessageOrderMessage{
		Order: model.ReadOrder(),
	}
}

// Write OrderMessage to writer
func (sf ClientMessageOrderMessage) Write() {
	flow.WriteInt32(1)
	sf.Order.Write()
}

// Get string representation of OrderMessage
func (sf ClientMessageOrderMessage) String() string {
	return "{Order:" + sf.Order.String() + "}"
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
func (sf ClientMessageDebugUpdateDone) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(2)
}

// Get string representation of DebugUpdateDone
func (sf ClientMessageDebugUpdateDone) String() string {
	return "{}"
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
func (sf ClientMessageRequestDebugState) Write() {
	flow.WriteInt32(3)
}

// Get string representation of RequestDebugState
func (sf ClientMessageRequestDebugState) String() string {
	return "{}"
}
