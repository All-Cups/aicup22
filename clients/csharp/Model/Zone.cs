namespace AiCup22.Model
{
    /// <summary>
    /// Current state of the game zone
    /// </summary>
    public struct Zone
    {
        /// <summary>
        /// Current center
        /// </summary>
        public AiCup22.Model.Vec2 CurrentCenter { get; set; }
        /// <summary>
        /// Current radius
        /// </summary>
        public double CurrentRadius { get; set; }
        /// <summary>
        /// Next center
        /// </summary>
        public AiCup22.Model.Vec2 NextCenter { get; set; }
        /// <summary>
        /// Next radius
        /// </summary>
        public double NextRadius { get; set; }
    
        public Zone(AiCup22.Model.Vec2 currentCenter, double currentRadius, AiCup22.Model.Vec2 nextCenter, double nextRadius)
        {
            this.CurrentCenter = currentCenter;
            this.CurrentRadius = currentRadius;
            this.NextCenter = nextCenter;
            this.NextRadius = nextRadius;
        }
    
        /// <summary> Read Zone from reader </summary>
        public static Zone ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new Zone();
            result.CurrentCenter = AiCup22.Model.Vec2.ReadFrom(reader);
            result.CurrentRadius = reader.ReadDouble();
            result.NextCenter = AiCup22.Model.Vec2.ReadFrom(reader);
            result.NextRadius = reader.ReadDouble();
            return result;
        }
    
        /// <summary> Write Zone to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            CurrentCenter.WriteTo(writer);
            writer.Write(CurrentRadius);
            NextCenter.WriteTo(writer);
            writer.Write(NextRadius);
        }
    
        /// <summary> Get string representation of Zone </summary>
        public override string ToString() {
            string stringResult = "Zone { ";
            stringResult += "CurrentCenter: ";
            stringResult += CurrentCenter.ToString();
            stringResult += ", ";
            stringResult += "CurrentRadius: ";
            stringResult += CurrentRadius.ToString();
            stringResult += ", ";
            stringResult += "NextCenter: ";
            stringResult += NextCenter.ToString();
            stringResult += ", ";
            stringResult += "NextRadius: ";
            stringResult += NextRadius.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}