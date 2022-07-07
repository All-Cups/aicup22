namespace AiCup22.Model
{
    /// <summary>
    /// 2 dimensional vector.
    /// </summary>
    public struct Vec2
    {
        /// <summary>
        /// `x` coordinate of the vector
        /// </summary>
        public double X { get; set; }
        /// <summary>
        /// `y` coordinate of the vector
        /// </summary>
        public double Y { get; set; }
    
        public Vec2(double x, double y)
        {
            this.X = x;
            this.Y = y;
        }
    
        /// <summary> Read Vec2 from reader </summary>
        public static Vec2 ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new Vec2();
            result.X = reader.ReadDouble();
            result.Y = reader.ReadDouble();
            return result;
        }
    
        /// <summary> Write Vec2 to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            writer.Write(X);
            writer.Write(Y);
        }
    
        /// <summary> Get string representation of Vec2 </summary>
        public override string ToString() {
            string stringResult = "Vec2 { ";
            stringResult += "X: ";
            stringResult += X.ToString();
            stringResult += ", ";
            stringResult += "Y: ";
            stringResult += Y.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}