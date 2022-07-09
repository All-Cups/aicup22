package stream

import (
	"bufio"
	"encoding/binary"
	"fmt"
	"io"
	"net"
)

// Stream -- абстракция входящег ои исходящего потока
type Stream struct {
	reader *bufio.Reader
	writer *bufio.Writer
}

var (
	flow *Stream // Глобальный объект потока
)

// Flow -- возвращает объект потока
func Flow() *Stream {
	return flow
}

// NewStream -- возвращает новый поток
func NewStream(conn net.Conn) (*Stream, error) {
	if flow != nil {
		return flow, nil
	}
	if conn == nil {
		return nil, fmt.Errorf("NewStream(): conn is nil")
	}
	flow = &Stream{
		reader: bufio.NewReader(conn),
		writer: bufio.NewWriter(conn),
	}
	return flow, nil
}

// Writer -- возвращает хранимый объект врайтера
func (sf *Stream) Writer() *bufio.Writer {
	return sf.writer
}

// Reader -- возвращает хранимый объект ридера
func (sf *Stream) Reader() *bufio.Reader {
	return sf.reader
}

func (sf *Stream) ReadBool() bool {
	var value *bool
	err := binary.Read(sf.reader, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
	return *value
}

func (sf *Stream) ReadInt32() int32 {
	var value *int32
	err := binary.Read(sf.reader, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
	return *value
}

func (sf *Stream) ReadInt64() int64 {
	var value *int64
	err := binary.Read(sf.reader, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
	return *value
}

func (sf *Stream) ReadFloat32() float32 {
	var value *float32
	err := binary.Read(sf.reader, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
	return *value
}

func (sf *Stream) ReadFloat64() float64 {
	var value *float64
	err := binary.Read(sf.reader, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
	return *value
}

func (sf *Stream) ReadString() string {
	bytes := make([]byte, sf.ReadInt32())
	_, err := io.ReadFull(sf.reader, bytes)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
	return string(bytes)
}

func WriteBool(writer io.Writer, value bool) {
	err := binary.Write(writer, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
}

func WriteInt32(writer io.Writer, value int32) {
	err := binary.Write(writer, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
}

func WriteInt64(writer io.Writer, value int64) {
	err := binary.Write(writer, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
}

func WriteFloat32(writer io.Writer, value float32) {
	err := binary.Write(writer, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
}

func WriteFloat64(writer io.Writer, value float64) {
	err := binary.Write(writer, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
}

func WriteString(writer io.Writer, value string) {
	bytes := []byte(value)
	WriteInt32(writer, int32(len(bytes)))
	_, err := writer.Write(bytes)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
}
