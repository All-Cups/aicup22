namespace AiCup22.Debugging
{
    /// <summary>
    /// Point + color
    /// </summary>
    public struct ColoredVertex
    {
        /// <summary>
        /// Position
        /// </summary>
        public AiCup22.Model.Vec2 Position { get; set; }
        /// <summary>
        /// Color
        /// </summary>
        public AiCup22.Debugging.Color Color { get; set; }
    
        public ColoredVertex(AiCup22.Model.Vec2 position, AiCup22.Debugging.Color color)
        {
            this.Position = position;
            this.Color = color;
        }
    
        /// <summary> Read ColoredVertex from reader </summary>
        public static ColoredVertex ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new ColoredVertex();
            result.Position = AiCup22.Model.Vec2.ReadFrom(reader);
            result.Color = AiCup22.Debugging.Color.ReadFrom(reader);
            return result;
        }
    
        /// <summary> Write ColoredVertex to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            Position.WriteTo(writer);
            Color.WriteTo(writer);
        }
    
        /// <summary> Get string representation of ColoredVertex </summary>
        public override string ToString() {
            string stringResult = "ColoredVertex { ";
            stringResult += "Position: ";
            stringResult += Position.ToString();
            stringResult += ", ";
            stringResult += "Color: ";
            stringResult += Color.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}