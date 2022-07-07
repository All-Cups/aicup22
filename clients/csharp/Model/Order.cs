namespace AiCup22.Model
{
    /// <summary>
    /// Player's (team's) orders
    /// </summary>
    public struct Order
    {
        /// <summary>
        /// Orders for each of your units
        /// </summary>
        public System.Collections.Generic.IDictionary<int, AiCup22.Model.UnitOrder> UnitOrders { get; set; }
    
        public Order(System.Collections.Generic.IDictionary<int, AiCup22.Model.UnitOrder> unitOrders)
        {
            this.UnitOrders = unitOrders;
        }
    
        /// <summary> Read Order from reader </summary>
        public static Order ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new Order();
            int unitOrdersSize = reader.ReadInt32();
            result.UnitOrders = new System.Collections.Generic.Dictionary<int, AiCup22.Model.UnitOrder>(unitOrdersSize);
            for (int unitOrdersIndex = 0; unitOrdersIndex < unitOrdersSize; unitOrdersIndex++)
            {
                int unitOrdersKey;
                AiCup22.Model.UnitOrder unitOrdersValue;
                unitOrdersKey = reader.ReadInt32();
                unitOrdersValue = AiCup22.Model.UnitOrder.ReadFrom(reader);
                result.UnitOrders.Add(unitOrdersKey, unitOrdersValue);
            }
            return result;
        }
    
        /// <summary> Write Order to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            writer.Write(UnitOrders.Count);
            foreach (var unitOrdersEntry in UnitOrders)
            {
                var unitOrdersKey = unitOrdersEntry.Key;
                var unitOrdersValue = unitOrdersEntry.Value;
                writer.Write(unitOrdersKey);
                unitOrdersValue.WriteTo(writer);
            }
        }
    
        /// <summary> Get string representation of Order </summary>
        public override string ToString() {
            string stringResult = "Order { ";
            stringResult += "UnitOrders: ";
            stringResult += "{ ";
            int unitOrdersIndex = 0;
            foreach (var unitOrdersEntry in UnitOrders)
            {
                if (unitOrdersIndex != 0) {
                    stringResult += ", ";
                }
                var unitOrdersKey = unitOrdersEntry.Key;
                stringResult += unitOrdersKey.ToString();
                stringResult += ": ";
                var unitOrdersValue = unitOrdersEntry.Value;
                stringResult += unitOrdersValue.ToString();
                unitOrdersIndex++;
            }
            stringResult += " }";
            stringResult += " }";
            return stringResult;
        }
    }
}