class MyStrategy(constants: ai_cup_22.model.Constants) {
  def getOrder(game: ai_cup_22.model.Game, debugInterface: Option[DebugInterface]): ai_cup_22.model.Order =
    ai_cup_22.model.Order(Map.empty)
  def debugUpdate(debugInterface: DebugInterface): scala.Unit = ()
  def finish(): scala.Unit = ()
}