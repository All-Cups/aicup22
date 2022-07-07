namespace AiCup22.Model
{
    /// <summary>
    /// Sound properties
    /// </summary>
    public struct SoundProperties
    {
        /// <summary>
        /// Name
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// Distance from which the sound can be heard
        /// </summary>
        public double Distance { get; set; }
        /// <summary>
        /// Offset modifier
        /// </summary>
        public double Offset { get; set; }
    
        public SoundProperties(string name, double distance, double offset)
        {
            this.Name = name;
            this.Distance = distance;
            this.Offset = offset;
        }
    
        /// <summary> Read SoundProperties from reader </summary>
        public static SoundProperties ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new SoundProperties();
            result.Name = System.Text.Encoding.UTF8.GetString(reader.ReadBytes(reader.ReadInt32()));
            result.Distance = reader.ReadDouble();
            result.Offset = reader.ReadDouble();
            return result;
        }
    
        /// <summary> Write SoundProperties to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            var nameData = System.Text.Encoding.UTF8.GetBytes(Name);
            writer.Write(nameData.Length);
            writer.Write(nameData);
            writer.Write(Distance);
            writer.Write(Offset);
        }
    
        /// <summary> Get string representation of SoundProperties </summary>
        public override string ToString() {
            string stringResult = "SoundProperties { ";
            stringResult += "Name: ";
            stringResult += "\"" + Name + "\"";
            stringResult += ", ";
            stringResult += "Distance: ";
            stringResult += Distance.ToString();
            stringResult += ", ";
            stringResult += "Offset: ";
            stringResult += Offset.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}