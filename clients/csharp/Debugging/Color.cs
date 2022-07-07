namespace AiCup22.Debugging
{
    /// <summary>
    /// RGBA Color
    /// </summary>
    public struct Color
    {
        /// <summary>
        /// Red component
        /// </summary>
        public double R { get; set; }
        /// <summary>
        /// Green component
        /// </summary>
        public double G { get; set; }
        /// <summary>
        /// Blue component
        /// </summary>
        public double B { get; set; }
        /// <summary>
        /// Alpha (opacity) component
        /// </summary>
        public double A { get; set; }
    
        public Color(double r, double g, double b, double a)
        {
            this.R = r;
            this.G = g;
            this.B = b;
            this.A = a;
        }
    
        /// <summary> Read Color from reader </summary>
        public static Color ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new Color();
            result.R = reader.ReadDouble();
            result.G = reader.ReadDouble();
            result.B = reader.ReadDouble();
            result.A = reader.ReadDouble();
            return result;
        }
    
        /// <summary> Write Color to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            writer.Write(R);
            writer.Write(G);
            writer.Write(B);
            writer.Write(A);
        }
    
        /// <summary> Get string representation of Color </summary>
        public override string ToString() {
            string stringResult = "Color { ";
            stringResult += "R: ";
            stringResult += R.ToString();
            stringResult += ", ";
            stringResult += "G: ";
            stringResult += G.ToString();
            stringResult += ", ";
            stringResult += "B: ";
            stringResult += B.ToString();
            stringResult += ", ";
            stringResult += "A: ";
            stringResult += A.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}