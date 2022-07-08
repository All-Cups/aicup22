package ai_cup_22;

public class MyStrategy {
    public MyStrategy(ai_cup_22.model.Constants constants) {}
    public ai_cup_22.model.Order getOrder(ai_cup_22.model.Game game, DebugInterface debugInterface) {
        return new ai_cup_22.model.Order(new java.util.HashMap<>());
    }
    public void debugUpdate(int displayedTick, DebugInterface debugInterface) {}
    public void finish() {}
}