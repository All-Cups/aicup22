namespace AiCup22.Model
{
    /// <summary>
    /// A unit
    /// </summary>
    public struct Unit
    {
        /// <summary>
        /// Unique id
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Id of the player (team) controlling the unit
        /// </summary>
        public int PlayerId { get; set; }
        /// <summary>
        /// Current health
        /// </summary>
        public double Health { get; set; }
        /// <summary>
        /// Current shield value
        /// </summary>
        public double Shield { get; set; }
        /// <summary>
        /// Left extra lives of this unit
        /// </summary>
        public int ExtraLives { get; set; }
        /// <summary>
        /// Current position of unit's center
        /// </summary>
        public AiCup22.Model.Vec2 Position { get; set; }
        /// <summary>
        /// Remaining time until unit will be spawned, or None
        /// </summary>
        public double? RemainingSpawnTime { get; set; }
        /// <summary>
        /// Current velocity
        /// </summary>
        public AiCup22.Model.Vec2 Velocity { get; set; }
        /// <summary>
        /// Current view direction (vector of length 1)
        /// </summary>
        public AiCup22.Model.Vec2 Direction { get; set; }
        /// <summary>
        /// Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
        /// </summary>
        public double Aim { get; set; }
        /// <summary>
        /// Current action unit is performing, or None
        /// </summary>
        public AiCup22.Model.Action? Action { get; set; }
        /// <summary>
        /// Tick when health regeneration will start (can be less than current game tick)
        /// </summary>
        public int HealthRegenerationStartTick { get; set; }
        /// <summary>
        /// Index of the weapon this unit is holding (starting with 0), or None
        /// </summary>
        public int? Weapon { get; set; }
        /// <summary>
        /// Next tick when unit can shoot again (can be less than current game tick)
        /// </summary>
        public int NextShotTick { get; set; }
        /// <summary>
        /// List of ammo in unit's inventory for every weapon type
        /// </summary>
        public int[] Ammo { get; set; }
        /// <summary>
        /// Number of shield potions in inventory
        /// </summary>
        public int ShieldPotions { get; set; }
    
        public Unit(int id, int playerId, double health, double shield, int extraLives, AiCup22.Model.Vec2 position, double? remainingSpawnTime, AiCup22.Model.Vec2 velocity, AiCup22.Model.Vec2 direction, double aim, AiCup22.Model.Action? action, int healthRegenerationStartTick, int? weapon, int nextShotTick, int[] ammo, int shieldPotions)
        {
            this.Id = id;
            this.PlayerId = playerId;
            this.Health = health;
            this.Shield = shield;
            this.ExtraLives = extraLives;
            this.Position = position;
            this.RemainingSpawnTime = remainingSpawnTime;
            this.Velocity = velocity;
            this.Direction = direction;
            this.Aim = aim;
            this.Action = action;
            this.HealthRegenerationStartTick = healthRegenerationStartTick;
            this.Weapon = weapon;
            this.NextShotTick = nextShotTick;
            this.Ammo = ammo;
            this.ShieldPotions = shieldPotions;
        }
    
        /// <summary> Read Unit from reader </summary>
        public static Unit ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new Unit();
            result.Id = reader.ReadInt32();
            result.PlayerId = reader.ReadInt32();
            result.Health = reader.ReadDouble();
            result.Shield = reader.ReadDouble();
            result.ExtraLives = reader.ReadInt32();
            result.Position = AiCup22.Model.Vec2.ReadFrom(reader);
            if (reader.ReadBoolean())
            {
                result.RemainingSpawnTime = reader.ReadDouble();
            } else
            {
                result.RemainingSpawnTime = null;
            }
            result.Velocity = AiCup22.Model.Vec2.ReadFrom(reader);
            result.Direction = AiCup22.Model.Vec2.ReadFrom(reader);
            result.Aim = reader.ReadDouble();
            if (reader.ReadBoolean())
            {
                result.Action = AiCup22.Model.Action.ReadFrom(reader);
            } else
            {
                result.Action = null;
            }
            result.HealthRegenerationStartTick = reader.ReadInt32();
            if (reader.ReadBoolean())
            {
                result.Weapon = reader.ReadInt32();
            } else
            {
                result.Weapon = null;
            }
            result.NextShotTick = reader.ReadInt32();
            result.Ammo = new int[reader.ReadInt32()];
            for (int ammoIndex = 0; ammoIndex < result.Ammo.Length; ammoIndex++)
            {
                result.Ammo[ammoIndex] = reader.ReadInt32();
            }
            result.ShieldPotions = reader.ReadInt32();
            return result;
        }
    
        /// <summary> Write Unit to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            writer.Write(Id);
            writer.Write(PlayerId);
            writer.Write(Health);
            writer.Write(Shield);
            writer.Write(ExtraLives);
            Position.WriteTo(writer);
            if (!RemainingSpawnTime.HasValue)
            {
                writer.Write(false);
            } else
            {
                writer.Write(true);
                writer.Write(RemainingSpawnTime.Value);
            }
            Velocity.WriteTo(writer);
            Direction.WriteTo(writer);
            writer.Write(Aim);
            if (!Action.HasValue)
            {
                writer.Write(false);
            } else
            {
                writer.Write(true);
                Action.Value.WriteTo(writer);
            }
            writer.Write(HealthRegenerationStartTick);
            if (!Weapon.HasValue)
            {
                writer.Write(false);
            } else
            {
                writer.Write(true);
                writer.Write(Weapon.Value);
            }
            writer.Write(NextShotTick);
            writer.Write(Ammo.Length);
            foreach (var ammoElement in Ammo)
            {
                writer.Write(ammoElement);
            }
            writer.Write(ShieldPotions);
        }
    
        /// <summary> Get string representation of Unit </summary>
        public override string ToString() {
            string stringResult = "Unit { ";
            stringResult += "Id: ";
            stringResult += Id.ToString();
            stringResult += ", ";
            stringResult += "PlayerId: ";
            stringResult += PlayerId.ToString();
            stringResult += ", ";
            stringResult += "Health: ";
            stringResult += Health.ToString();
            stringResult += ", ";
            stringResult += "Shield: ";
            stringResult += Shield.ToString();
            stringResult += ", ";
            stringResult += "ExtraLives: ";
            stringResult += ExtraLives.ToString();
            stringResult += ", ";
            stringResult += "Position: ";
            stringResult += Position.ToString();
            stringResult += ", ";
            stringResult += "RemainingSpawnTime: ";
            if (!RemainingSpawnTime.HasValue)
            {
                stringResult += "null";
            } else
            {
                stringResult += RemainingSpawnTime.Value.ToString();
            }
            stringResult += ", ";
            stringResult += "Velocity: ";
            stringResult += Velocity.ToString();
            stringResult += ", ";
            stringResult += "Direction: ";
            stringResult += Direction.ToString();
            stringResult += ", ";
            stringResult += "Aim: ";
            stringResult += Aim.ToString();
            stringResult += ", ";
            stringResult += "Action: ";
            if (!Action.HasValue)
            {
                stringResult += "null";
            } else
            {
                stringResult += Action.Value.ToString();
            }
            stringResult += ", ";
            stringResult += "HealthRegenerationStartTick: ";
            stringResult += HealthRegenerationStartTick.ToString();
            stringResult += ", ";
            stringResult += "Weapon: ";
            if (!Weapon.HasValue)
            {
                stringResult += "null";
            } else
            {
                stringResult += Weapon.Value.ToString();
            }
            stringResult += ", ";
            stringResult += "NextShotTick: ";
            stringResult += NextShotTick.ToString();
            stringResult += ", ";
            stringResult += "Ammo: ";
            stringResult += "[ ";
            int ammoIndex = 0;
            foreach (var ammoElement in Ammo)
            {
                if (ammoIndex != 0) {
                    stringResult += ", ";
                }
                stringResult += ammoElement.ToString();
                ammoIndex++;
            }
            stringResult += " ]";
            stringResult += ", ";
            stringResult += "ShieldPotions: ";
            stringResult += ShieldPotions.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}