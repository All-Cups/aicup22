namespace AiCup22

type MyStrategy(constants: Model.Constants) =
    member this.getOrder(game: Model.Game, debugInterface: option<DebugInterface>): Model.Order =
        {
            UnitOrders = Map.empty
        }

    member this.debugUpdate(displayedTick: int, debugInterface: DebugInterface) = ()

    member this.finish() = ()