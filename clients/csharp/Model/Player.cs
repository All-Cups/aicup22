namespace AiCup22.Model
{
    /// <summary>
    /// Game's participant (team of units)
    /// </summary>
    public struct Player
    {
        /// <summary>
        /// Unique id
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Number of kills
        /// </summary>
        public int Kills { get; set; }
        /// <summary>
        /// Total damage dealt to enemies
        /// </summary>
        public double Damage { get; set; }
        /// <summary>
        /// Survival place (number of survivor teams currently/at the moment of death)
        /// </summary>
        public int Place { get; set; }
        /// <summary>
        /// Team score
        /// </summary>
        public double Score { get; set; }
    
        public Player(int id, int kills, double damage, int place, double score)
        {
            this.Id = id;
            this.Kills = kills;
            this.Damage = damage;
            this.Place = place;
            this.Score = score;
        }
    
        /// <summary> Read Player from reader </summary>
        public static Player ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new Player();
            result.Id = reader.ReadInt32();
            result.Kills = reader.ReadInt32();
            result.Damage = reader.ReadDouble();
            result.Place = reader.ReadInt32();
            result.Score = reader.ReadDouble();
            return result;
        }
    
        /// <summary> Write Player to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            writer.Write(Id);
            writer.Write(Kills);
            writer.Write(Damage);
            writer.Write(Place);
            writer.Write(Score);
        }
    
        /// <summary> Get string representation of Player </summary>
        public override string ToString() {
            string stringResult = "Player { ";
            stringResult += "Id: ";
            stringResult += Id.ToString();
            stringResult += ", ";
            stringResult += "Kills: ";
            stringResult += Kills.ToString();
            stringResult += ", ";
            stringResult += "Damage: ";
            stringResult += Damage.ToString();
            stringResult += ", ";
            stringResult += "Place: ";
            stringResult += Place.ToString();
            stringResult += ", ";
            stringResult += "Score: ";
            stringResult += Score.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}