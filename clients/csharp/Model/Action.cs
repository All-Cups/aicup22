namespace AiCup22.Model
{
    /// <summary>
    /// Action unit is currently performing
    /// </summary>
    public struct Action
    {
        /// <summary>
        /// Tick when the action will be finished
        /// </summary>
        public int FinishTick { get; set; }
        /// <summary>
        /// Type of the action
        /// </summary>
        public AiCup22.Model.ActionType ActionType { get; set; }
    
        public Action(int finishTick, AiCup22.Model.ActionType actionType)
        {
            this.FinishTick = finishTick;
            this.ActionType = actionType;
        }
    
        /// <summary> Read Action from reader </summary>
        public static Action ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new Action();
            result.FinishTick = reader.ReadInt32();
            result.ActionType = ActionTypeHelper.ReadFrom(reader);
            return result;
        }
    
        /// <summary> Write Action to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            writer.Write(FinishTick);
            writer.Write((int) (ActionType));
        }
    
        /// <summary> Get string representation of Action </summary>
        public override string ToString() {
            string stringResult = "Action { ";
            stringResult += "FinishTick: ";
            stringResult += FinishTick.ToString();
            stringResult += ", ";
            stringResult += "ActionType: ";
            stringResult += ActionType.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}