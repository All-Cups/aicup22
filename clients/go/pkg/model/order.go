package model

import (
	"fmt"
	"io"

	"aicup22/pkg/stream"
)

// Player's (team's) orders
type Order struct {
	// Orders for each of your units
	UnitOrders map[int32]UnitOrder
}

func NewOrder(unitOrders map[int32]UnitOrder) Order {
	return Order{
		UnitOrders: unitOrders,
	}
}

// Read Order from reader
func ReadOrder(reader io.Reader) Order {
	unitOrdersSize := stream.Flow().ReadInt32()
	unitOrders := make(map[int32]UnitOrder)
	for unitOrdersIndex := int32(0); unitOrdersIndex < unitOrdersSize; unitOrdersIndex++ {
		unitOrdersKey := stream.Flow().ReadInt32()
		unitOrdersValue := ReadUnitOrder(reader)
		unitOrders[unitOrdersKey] = unitOrdersValue
	}
	return Order{
		UnitOrders: unitOrders,
	}
}

// Write Order to writer
func (order Order) Write(writer io.Writer) {
	unitOrders := order.UnitOrders
	stream.WriteInt32(writer, int32(len(unitOrders)))
	for unitOrdersKey, unitOrdersValue := range unitOrders {
		stream.WriteInt32(writer, unitOrdersKey)
		unitOrdersValue.Write(writer)
	}
}

// Get string representation of Order
func (order Order) String() string {
	stringResult := "{ "
	stringResult += "UnitOrders: "
	unitOrders := order.UnitOrders
	stringResult += "map[ "
	unitOrdersIndex := 0
	for unitOrdersKey, unitOrdersValue := range unitOrders {
		if unitOrdersIndex != 0 {
			stringResult += ", "
		}
		stringResult += fmt.Sprint(unitOrdersKey)
		stringResult += ": "
		stringResult += unitOrdersValue.String()
		unitOrdersIndex++
	}
	stringResult += " ]"
	stringResult += " }"
	return stringResult
}
