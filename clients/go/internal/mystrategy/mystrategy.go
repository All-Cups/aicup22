package mystrategy

import (
	"aicup22/pkg/model"
	"aicup22/pkg/types"
)

type MyStrategy struct{}

func NewMyStrategy(constants model.Constants) *MyStrategy {
	return &MyStrategy{}
}

func (strategy MyStrategy) GetOrder(game model.Game, debugInterface *types.DebugInterface) model.Order {
	return model.Order{
		UnitOrders: make(map[int32]model.UnitOrder),
	}
}

func (strategy MyStrategy) DebugUpdate(displayedTick int32, debugInterface types.DebugInterface) {}

func (strategy MyStrategy) Finish() {}
