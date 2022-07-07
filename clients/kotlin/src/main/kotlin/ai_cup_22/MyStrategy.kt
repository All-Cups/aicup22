class MyStrategy(constants: ai_cup_22.model.Constants) {
    fun getOrder(game: ai_cup_22.model.Game, debugInterface: DebugInterface?): ai_cup_22.model.Order {
        return ai_cup_22.model.Order(mutableMapOf())
    }
    fun debugUpdate(debugInterface: DebugInterface?) {}
    fun finish() {}
}