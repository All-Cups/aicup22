package main

import (
    "bufio"
    "net"
    "os"
    . "ai_cup_22/codegame"
    . "ai_cup_22/model"
    . "ai_cup_22/stream"
    . "ai_cup_22/debugging_interface"
    "strconv"
)

type Runner struct {
    conn   net.Conn
    reader *bufio.Reader
    writer *bufio.Writer
}

func NewRunner(host string, port uint16, token string) Runner {
    conn, err := net.Dial("tcp", host+":"+strconv.Itoa(int(port)))
    if err != nil {
        panic(err)
    }
    writer := bufio.NewWriter(conn)
    WriteString(writer, token)
    WriteInt32(writer, 1)
    WriteInt32(writer, 0)
    WriteInt32(writer, 1)
    err = writer.Flush()
    if err != nil {
        panic(err)
    }
    return Runner{
        conn:   conn,
        reader: bufio.NewReader(conn),
        writer: writer,
    }
}

func (runner Runner) Run() {
    var myStrategy *MyStrategy = nil
    debugInterface := DebugInterface{
        Reader: runner.reader,
        Writer: runner.writer,
    }
loop:
    for {
        switch message := ReadServerMessage(runner.reader).(type) {
        case ServerMessageUpdateConstants:
            myStrategy = NewMyStrategy(message.Constants)
        case ServerMessageGetOrder:
            var order Order
            if message.DebugAvailable {
                order = myStrategy.getOrder(message.PlayerView, &debugInterface)
            } else {
                order = myStrategy.getOrder(message.PlayerView, nil)
            }
            ClientMessageOrderMessage{
                Order: order,
            }.Write(runner.writer)
            err := runner.writer.Flush()
            if err != nil {
                panic(err)
            }
        case ServerMessageFinish:
            myStrategy.finish()
            break loop
        case ServerMessageDebugUpdate:
            myStrategy.debugUpdate(debugInterface)
            ClientMessageDebugUpdateDone{}.Write(runner.writer)
            err := runner.writer.Flush()
            if err != nil {
                panic(err)
            }
        default:
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