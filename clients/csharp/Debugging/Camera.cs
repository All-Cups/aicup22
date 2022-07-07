namespace AiCup22.Debugging
{
    /// <summary>
    /// Camera state
    /// </summary>
    public struct Camera
    {
        /// <summary>
        /// Center
        /// </summary>
        public AiCup22.Model.Vec2 Center { get; set; }
        /// <summary>
        /// Rotation
        /// </summary>
        public double Rotation { get; set; }
        /// <summary>
        /// Attack angle
        /// </summary>
        public double Attack { get; set; }
        /// <summary>
        /// Vertical field of view
        /// </summary>
        public double Fov { get; set; }
    
        public Camera(AiCup22.Model.Vec2 center, double rotation, double attack, double fov)
        {
            this.Center = center;
            this.Rotation = rotation;
            this.Attack = attack;
            this.Fov = fov;
        }
    
        /// <summary> Read Camera from reader </summary>
        public static Camera ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new Camera();
            result.Center = AiCup22.Model.Vec2.ReadFrom(reader);
            result.Rotation = reader.ReadDouble();
            result.Attack = reader.ReadDouble();
            result.Fov = reader.ReadDouble();
            return result;
        }
    
        /// <summary> Write Camera to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            Center.WriteTo(writer);
            writer.Write(Rotation);
            writer.Write(Attack);
            writer.Write(Fov);
        }
    
        /// <summary> Get string representation of Camera </summary>
        public override string ToString() {
            string stringResult = "Camera { ";
            stringResult += "Center: ";
            stringResult += Center.ToString();
            stringResult += ", ";
            stringResult += "Rotation: ";
            stringResult += Rotation.ToString();
            stringResult += ", ";
            stringResult += "Attack: ";
            stringResult += Attack.ToString();
            stringResult += ", ";
            stringResult += "Fov: ";
            stringResult += Fov.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}