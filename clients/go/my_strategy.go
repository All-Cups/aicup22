package main

import (
    . "ai_cup_22/model"
    . "ai_cup_22/debugginginterface"
)

type MyStrategy struct{}

func NewMyStrategy(constants Constants) *MyStrategy {
    return &MyStrategy{}
}

func (strategy MyStrategy) getOrder(game Game, debugInterface *DebugInterface) Order {
    return Order {
               UnitOrders: make(map[int32]UnitOrder),
           }
}

func (strategy MyStrategy) debugUpdate(debugInterface DebugInterface) {}

func (strategy MyStrategy) finish() {}