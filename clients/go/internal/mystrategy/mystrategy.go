package mystrategy

import (
	"aicup22/pkg/debugout"
	"aicup22/pkg/model"
)

type MyStrategy struct{}

func NewMyStrategy(constants model.Constants) *MyStrategy {
	return &MyStrategy{}
}

func (strategy MyStrategy) GetOrder(game model.Game, debugInterface *debugout.DebugOut) model.Order {
	return model.Order{
		UnitOrders: make(map[int32]model.UnitOrder),
	}
}

func (strategy MyStrategy) DebugUpdate(displayedTick int32, debugInterface debugout.DebugOut) {}

func (strategy MyStrategy) Finish() {}
