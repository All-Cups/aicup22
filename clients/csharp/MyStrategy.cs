namespace AiCup22
{
    public class MyStrategy
    {
        public MyStrategy(AiCup22.Model.Constants constants) {}
        public AiCup22.Model.Order GetOrder(AiCup22.Model.Game game, DebugInterface debugInterface)
        {
            return new AiCup22.Model.Order(new System.Collections.Generic.Dictionary<int, AiCup22.Model.UnitOrder>());
        }
        public void DebugUpdate(DebugInterface debugInterface) {}
        public void Finish() {}
    }
}