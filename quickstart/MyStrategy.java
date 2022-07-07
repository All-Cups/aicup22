package ai_cup_22;

import ai_cup_22.model.*;

public class MyStrategy {
    public MyStrategy(Constants constants) {}
    public Order getOrder(Game game, DebugInterface debugInterface) {
        java.util.HashMap<Integer, UnitOrder> orders = new java.util.HashMap<>();
        for (Unit unit : game.getUnits()) {
            if (unit.getPlayerId() != game.getMyId()) {
                continue;
            }
            orders.put(unit.getId(), new UnitOrder(
                new Vec2(-unit.getPosition().getX(), -unit.getPosition().getY()),
                new Vec2(-unit.getDirection().getY(), unit.getDirection().getX()),
                new ActionOrder.Aim(true)));
        }
        return new Order(orders);
    }
    public void debugUpdate(DebugInterface debugInterface) {}
    public void finish() {}
}