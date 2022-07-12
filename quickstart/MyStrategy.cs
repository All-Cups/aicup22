using AiCup22.Model;
using System.Collections.Generic;

namespace AiCup22
{
    public class MyStrategy
    {
        public MyStrategy(AiCup22.Model.Constants constants) {}
        public AiCup22.Model.Order GetOrder(AiCup22.Model.Game game, DebugInterface debugInterface)
        {
            Order order = new Order();
            IDictionary<int, UnitOrder> orders = new Dictionary<int, UnitOrder>();
            ActionOrder aim = new ActionOrder.Aim(true);
           
            foreach(Unit unit in game.Units)
            {
                if (unit.PlayerId != game.MyId)
                {
                    continue;
                }
                orders.Add(unit.Id, new UnitOrder(
                new Vec2(-unit.Position.X, -unit.Position.Y),
                new Vec2(-unit.Position.Y, unit.Position.X),
                new ActionOrder.Aim(true)));
            }

            return new Order(orders);
        }
        public void DebugUpdate(int displayedTick, DebugInterface debugInterface) {}
        public void Finish() {}
    }
}
