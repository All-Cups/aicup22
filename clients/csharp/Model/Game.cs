namespace AiCup22.Model
{
    /// <summary>
    /// Current game's state
    /// </summary>
    public struct Game
    {
        /// <summary>
        /// Your player's id
        /// </summary>
        public int MyId { get; set; }
        /// <summary>
        /// List of players (teams)
        /// </summary>
        public AiCup22.Model.Player[] Players { get; set; }
        /// <summary>
        /// Current tick
        /// </summary>
        public int CurrentTick { get; set; }
        /// <summary>
        /// List of units visible by your team
        /// </summary>
        public AiCup22.Model.Unit[] Units { get; set; }
        /// <summary>
        /// List of loot visible by your team
        /// </summary>
        public AiCup22.Model.Loot[] Loot { get; set; }
        /// <summary>
        /// List of projectiles visible by your team
        /// </summary>
        public AiCup22.Model.Projectile[] Projectiles { get; set; }
        /// <summary>
        /// Current state of game zone
        /// </summary>
        public AiCup22.Model.Zone Zone { get; set; }
        /// <summary>
        /// List of sounds heard by your team during last tick
        /// </summary>
        public AiCup22.Model.Sound[] Sounds { get; set; }
    
        public Game(int myId, AiCup22.Model.Player[] players, int currentTick, AiCup22.Model.Unit[] units, AiCup22.Model.Loot[] loot, AiCup22.Model.Projectile[] projectiles, AiCup22.Model.Zone zone, AiCup22.Model.Sound[] sounds)
        {
            this.MyId = myId;
            this.Players = players;
            this.CurrentTick = currentTick;
            this.Units = units;
            this.Loot = loot;
            this.Projectiles = projectiles;
            this.Zone = zone;
            this.Sounds = sounds;
        }
    
        /// <summary> Read Game from reader </summary>
        public static Game ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new Game();
            result.MyId = reader.ReadInt32();
            result.Players = new AiCup22.Model.Player[reader.ReadInt32()];
            for (int playersIndex = 0; playersIndex < result.Players.Length; playersIndex++)
            {
                result.Players[playersIndex] = AiCup22.Model.Player.ReadFrom(reader);
            }
            result.CurrentTick = reader.ReadInt32();
            result.Units = new AiCup22.Model.Unit[reader.ReadInt32()];
            for (int unitsIndex = 0; unitsIndex < result.Units.Length; unitsIndex++)
            {
                result.Units[unitsIndex] = AiCup22.Model.Unit.ReadFrom(reader);
            }
            result.Loot = new AiCup22.Model.Loot[reader.ReadInt32()];
            for (int lootIndex = 0; lootIndex < result.Loot.Length; lootIndex++)
            {
                result.Loot[lootIndex] = AiCup22.Model.Loot.ReadFrom(reader);
            }
            result.Projectiles = new AiCup22.Model.Projectile[reader.ReadInt32()];
            for (int projectilesIndex = 0; projectilesIndex < result.Projectiles.Length; projectilesIndex++)
            {
                result.Projectiles[projectilesIndex] = AiCup22.Model.Projectile.ReadFrom(reader);
            }
            result.Zone = AiCup22.Model.Zone.ReadFrom(reader);
            result.Sounds = new AiCup22.Model.Sound[reader.ReadInt32()];
            for (int soundsIndex = 0; soundsIndex < result.Sounds.Length; soundsIndex++)
            {
                result.Sounds[soundsIndex] = AiCup22.Model.Sound.ReadFrom(reader);
            }
            return result;
        }
    
        /// <summary> Write Game to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            writer.Write(MyId);
            writer.Write(Players.Length);
            foreach (var playersElement in Players)
            {
                playersElement.WriteTo(writer);
            }
            writer.Write(CurrentTick);
            writer.Write(Units.Length);
            foreach (var unitsElement in Units)
            {
                unitsElement.WriteTo(writer);
            }
            writer.Write(Loot.Length);
            foreach (var lootElement in Loot)
            {
                lootElement.WriteTo(writer);
            }
            writer.Write(Projectiles.Length);
            foreach (var projectilesElement in Projectiles)
            {
                projectilesElement.WriteTo(writer);
            }
            Zone.WriteTo(writer);
            writer.Write(Sounds.Length);
            foreach (var soundsElement in Sounds)
            {
                soundsElement.WriteTo(writer);
            }
        }
    
        /// <summary> Get string representation of Game </summary>
        public override string ToString() {
            string stringResult = "Game { ";
            stringResult += "MyId: ";
            stringResult += MyId.ToString();
            stringResult += ", ";
            stringResult += "Players: ";
            stringResult += "[ ";
            int playersIndex = 0;
            foreach (var playersElement in Players)
            {
                if (playersIndex != 0) {
                    stringResult += ", ";
                }
                stringResult += playersElement.ToString();
                playersIndex++;
            }
            stringResult += " ]";
            stringResult += ", ";
            stringResult += "CurrentTick: ";
            stringResult += CurrentTick.ToString();
            stringResult += ", ";
            stringResult += "Units: ";
            stringResult += "[ ";
            int unitsIndex = 0;
            foreach (var unitsElement in Units)
            {
                if (unitsIndex != 0) {
                    stringResult += ", ";
                }
                stringResult += unitsElement.ToString();
                unitsIndex++;
            }
            stringResult += " ]";
            stringResult += ", ";
            stringResult += "Loot: ";
            stringResult += "[ ";
            int lootIndex = 0;
            foreach (var lootElement in Loot)
            {
                if (lootIndex != 0) {
                    stringResult += ", ";
                }
                stringResult += lootElement.ToString();
                lootIndex++;
            }
            stringResult += " ]";
            stringResult += ", ";
            stringResult += "Projectiles: ";
            stringResult += "[ ";
            int projectilesIndex = 0;
            foreach (var projectilesElement in Projectiles)
            {
                if (projectilesIndex != 0) {
                    stringResult += ", ";
                }
                stringResult += projectilesElement.ToString();
                projectilesIndex++;
            }
            stringResult += " ]";
            stringResult += ", ";
            stringResult += "Zone: ";
            stringResult += Zone.ToString();
            stringResult += ", ";
            stringResult += "Sounds: ";
            stringResult += "[ ";
            int soundsIndex = 0;
            foreach (var soundsElement in Sounds)
            {
                if (soundsIndex != 0) {
                    stringResult += ", ";
                }
                stringResult += soundsElement.ToString();
                soundsIndex++;
            }
            stringResult += " ]";
            stringResult += " }";
            return stringResult;
        }
    }
}