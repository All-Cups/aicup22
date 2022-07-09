package main

import (
	"bufio"
	"fmt"
	"net"
	"os"
	"strconv"

	"aicup22/internal/mystrategy"
	"aicup22/pkg/codegame"
	"aicup22/pkg/model"
	"aicup22/pkg/stream"
	"aicup22/pkg/types"
)

type Runner struct {
	conn   net.Conn
	reader *bufio.Reader
	writer *bufio.Writer
	flow   *stream.Stream
}

func NewRunner(host string, port uint16, token string) Runner {
	conn, err := net.Dial("tcp", host+":"+strconv.Itoa(int(port)))
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
	flow, err := stream.NewStream(conn)
	if err != nil {
		panic(fmt.Errorf("NewRunner(): in create flow, err=\n\t%w", err))
	}
	// FIXME: магичесие константы
	stream.WriteString(flow.Writer(), token)
	stream.WriteInt32(flow.Writer(), 1)
	stream.WriteInt32(flow.Writer(), 1)
	stream.WriteInt32(flow.Writer(), 0)
	err = flow.Writer().Flush()
	if err != nil {
		panic(err)
	}

	return Runner{
		conn:   conn,
		reader: flow.Reader(),
		writer: flow.Writer(),
		flow:   flow,
	}
}

func (runner Runner) Run() {
	var myStrategy *mystrategy.MyStrategy = nil
	debugInterface := types.DebugInterface{
		Reader: runner.reader,
		Writer: runner.writer,
	}
loop:
	for {
		switch message := codegame.ReadServerMessage(runner.reader).(type) {
		case codegame.ServerMessageUpdateConstants:
			myStrategy = mystrategy.NewMyStrategy(message.Constants)
		case codegame.ServerMessageGetOrder:
			var order model.Order
			if message.DebugAvailable {
				order = myStrategy.GetOrder(message.PlayerView, &debugInterface)
			} else {
				order = myStrategy.GetOrder(message.PlayerView, nil)
			}
			codegame.ClientMessageOrderMessage{
				Order: order,
			}.Write(runner.writer)
			err := runner.writer.Flush()
			if err != nil {
				panic(err)
			}
		case codegame.ServerMessageFinish:
			myStrategy.Finish()
			break loop
		case codegame.ServerMessageDebugUpdate:
			myStrategy.DebugUpdate(message.DisplayedTick, debugInterface)
			codegame.ClientMessageDebugUpdateDone{}.Write(runner.writer)
			err := runner.writer.Flush()
			if err != nil {
				// FIXME: так делать нельзя
				panic(err)
			}
		default:
			// FIXME: так делать нельзя
			panic("Unexpected server message")
		}
	}
}

func main() {
	var host string
	if len(os.Args) < 2 {
		host = "localhost"
	} else {
		host = os.Args[1]
	}
	var port uint16
	if len(os.Args) < 3 {
		port = 31001
	} else {
		portInt, err := strconv.Atoi(os.Args[2])
		port = uint16(portInt)
		if err != nil {
			panic(err)
		}
	}
	var token string
	if len(os.Args) < 4 {
		token = "0000000000000000"
	} else {
		token = os.Args[3]
	}

	runner := NewRunner(host, port, token)
	runner.Run()
}
