namespace AiCup22.Model
{
    /// <summary>
    /// Type of action a unit is currently performing
    /// </summary>
    public enum ActionType
    {
        /// <summary>
        /// Picking up or dropping loot
        /// </summary>
        Looting = 0,
        /// <summary>
        /// Using a shield potion
        /// </summary>
        UseShieldPotion = 1,
    }

    public static class ActionTypeHelper {
        /// <summary> Read ActionType from reader </summary>
        public static ActionType ReadFrom(System.IO.BinaryReader reader) {
            switch (reader.ReadInt32())
            {
                case 0:
                    return ActionType.Looting;
                case 1:
                    return ActionType.UseShieldPotion;
                default:
                    throw new System.Exception("Unexpected tag value");
            }
        }
    }
}