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
func (sf Order) Write() {
	unitOrders := sf.UnitOrders
	flow.WriteInt32(int32(len(unitOrders)))
	for unitOrdersKey, unitOrdersValue := range unitOrders {
		flow.WriteInt32(unitOrdersKey)
		unitOrdersValue.Write()
	}
}

// Get string representation of Order
func (sf Order) String() string {
	strRes := "{ "
	strRes += "UnitOrders: "
	unitOrders := sf.UnitOrders
	strRes += "map[ "
	unitOrdersIndex := 0
	for unitOrdersKey, unitOrdersValue := range unitOrders {
		if unitOrdersIndex != 0 {
			strRes += ", "
		}
		strRes += fmt.Sprint(unitOrdersKey)
		strRes += ": "
		strRes += unitOrdersValue.String()
		unitOrdersIndex++
	}
	strRes += " ]"
	strRes += " }"
	return strRes
}
