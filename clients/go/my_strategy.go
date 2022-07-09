package main

import (
    . "ai_cup_22/model"
    "ai_cup_22/types"
)

type MyStrategy struct{}

func NewMyStrategy(constants Constants) *MyStrategy {
    return &MyStrategy{}
}

func (strategy MyStrategy) getOrder(game Game, debugInterface *types.DebugInterface) Order {
    return Order {
               UnitOrders: make(map[int32]UnitOrder),
           }
}

func (strategy MyStrategy) debugUpdate(displayedTick int32, debugInterface types.DebugInterface) {}

func (strategy MyStrategy) finish() {}