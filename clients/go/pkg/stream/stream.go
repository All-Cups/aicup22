package stream

import (
	"encoding/binary"
	"fmt"
	"io"
)

// Stream -- абстракция входящег ои исходящего потока
type Stream struct {
	reader io.Reader
	writer io.Writer
}

var (
	flow *Stream // Глобальный объект потока
)

// Flow -- возвращает объект потока
func Flow() *Stream {
	return flow
}

// NewStream -- возвращает новый поток
func NewStream(reader io.Reader, writer io.Writer) (*Stream, error) {
	if flow != nil {
		return flow, nil
	}
	{ // Предусловия
		if reader == nil {
			return nil, fmt.Errorf("NewStream(): reader is nil")
		}
		if writer == nil {
			return nil, fmt.Errorf("NewStream(): writer is nil")
		}
	}
	flow = &Stream{
		reader: reader,
		writer: writer,
	}
	return flow, nil
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

func ReadInt64(reader io.Reader) int64 {
	var value *int64
	err := binary.Read(reader, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
	return *value
}

func ReadFloat32(reader io.Reader) float32 {
	var value *float32
	err := binary.Read(reader, binary.LittleEndian, value)
	if err != nil {
		// FIXME: так делать нельзя
		panic(err)
	}
	return *value
}

func ReadFloat64(reader io.Reader) float64 {
	var value *float64
	err := binary.Read(reader, binary.LittleEndian, value)
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
