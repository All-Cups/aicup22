package model

import (
	"fmt"
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
func ReadOrder() Order {
	unitOrdersSize := flow.ReadInt32()
	unitOrders := make(map[int32]UnitOrder)
	for unitOrdersIndex := int32(0); unitOrdersIndex < unitOrdersSize; unitOrdersIndex++ {
		unitOrdersKey := flow.ReadInt32()
		unitOrdersValue := ReadUnitOrder()
		unitOrders[unitOrdersKey] = unitOrdersValue
	}
	return Order{
		UnitOrders: unitOrders,
	}
}

// Write Order to writer
func (order Order) Write() {
	unitOrders := order.UnitOrders
	flow.WriteInt32(int32(len(unitOrders)))
	for unitOrdersKey, unitOrdersValue := range unitOrders {
		flow.WriteInt32(unitOrdersKey)
		unitOrdersValue.Write()
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
