namespace AiCup22.Model
{
    /// <summary>
    /// Order for specific unit
    /// </summary>
    public struct UnitOrder
    {
        /// <summary>
        /// Target moving velocity
        /// </summary>
        public AiCup22.Model.Vec2 TargetVelocity { get; set; }
        /// <summary>
        /// Target view direction (vector length doesn't matter)
        /// </summary>
        public AiCup22.Model.Vec2 TargetDirection { get; set; }
        /// <summary>
        /// Order to perform an action, or None
        /// </summary>
        public AiCup22.Model.ActionOrder Action { get; set; }
    
        public UnitOrder(AiCup22.Model.Vec2 targetVelocity, AiCup22.Model.Vec2 targetDirection, AiCup22.Model.ActionOrder action)
        {
            this.TargetVelocity = targetVelocity;
            this.TargetDirection = targetDirection;
            this.Action = action;
        }
    
        /// <summary> Read UnitOrder from reader </summary>
        public static UnitOrder ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new UnitOrder();
            result.TargetVelocity = AiCup22.Model.Vec2.ReadFrom(reader);
            result.TargetDirection = AiCup22.Model.Vec2.ReadFrom(reader);
            if (reader.ReadBoolean())
            {
                result.Action = AiCup22.Model.ActionOrder.ReadFrom(reader);
            } else
            {
                result.Action = null;
            }
            return result;
        }
    
        /// <summary> Write UnitOrder to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            TargetVelocity.WriteTo(writer);
            TargetDirection.WriteTo(writer);
            if (Action == null)
            {
                writer.Write(false);
            } else
            {
                writer.Write(true);
                Action.WriteTo(writer);
            }
        }
    
        /// <summary> Get string representation of UnitOrder </summary>
        public override string ToString() {
            string stringResult = "UnitOrder { ";
            stringResult += "TargetVelocity: ";
            stringResult += TargetVelocity.ToString();
            stringResult += ", ";
            stringResult += "TargetDirection: ";
            stringResult += TargetDirection.ToString();
            stringResult += ", ";
            stringResult += "Action: ";
            if (Action == null)
            {
                stringResult += "null";
            } else
            {
                stringResult += Action.ToString();
            }
            stringResult += " }";
            return stringResult;
        }
    }
}