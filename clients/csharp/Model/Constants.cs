namespace AiCup22.Model
{
    /// <summary>
    /// Non changing game state
    /// </summary>
    public struct Constants
    {
        /// <summary>
        /// Number of ticks per game second
        /// </summary>
        public double TicksPerSecond { get; set; }
        /// <summary>
        /// Starting number of units in each team
        /// </summary>
        public int TeamSize { get; set; }
        /// <summary>
        /// Initial zone radius
        /// </summary>
        public double InitialZoneRadius { get; set; }
        /// <summary>
        /// Speed of zone radius
        /// </summary>
        public double ZoneSpeed { get; set; }
        /// <summary>
        /// Damage dealt to units outside of the zone per second
        /// </summary>
        public double ZoneDamagePerSecond { get; set; }
        /// <summary>
        /// Unit spawning time
        /// </summary>
        public double SpawnTime { get; set; }
        /// <summary>
        /// Damage dealt to units trying to spawn in incorrect position per second
        /// </summary>
        public double SpawnCollisionDamagePerSecond { get; set; }
        /// <summary>
        /// Time required to perform looting actions (in seconds)
        /// </summary>
        public double LootingTime { get; set; }
        /// <summary>
        /// Number of bot players (teams)
        /// </summary>
        public int BotPlayers { get; set; }
        /// <summary>
        /// Units' radius
        /// </summary>
        public double UnitRadius { get; set; }
        /// <summary>
        /// Max units' health
        /// </summary>
        public double UnitHealth { get; set; }
        /// <summary>
        /// Health automatically restored per second
        /// </summary>
        public double HealthRegenerationPerSecond { get; set; }
        /// <summary>
        /// Time until automatic health regeneration since last health damage (in seconds)
        /// </summary>
        public double HealthRegenerationDelay { get; set; }
        /// <summary>
        /// Max value of unit's shield
        /// </summary>
        public double MaxShield { get; set; }
        /// <summary>
        /// Initial value of unit's shield
        /// </summary>
        public double SpawnShield { get; set; }
        /// <summary>
        /// Initial number of extra lives for units
        /// </summary>
        public int ExtraLives { get; set; }
        /// <summary>
        /// Zone radius after which respawning is disabled
        /// </summary>
        public double LastRespawnZoneRadius { get; set; }
        /// <summary>
        /// Units' field of view without aiming (in degrees)
        /// </summary>
        public double FieldOfView { get; set; }
        /// <summary>
        /// Units' view distance
        /// </summary>
        public double ViewDistance { get; set; }
        /// <summary>
        /// Whether units' view is blocked by obstacles
        /// </summary>
        public bool ViewBlocking { get; set; }
        /// <summary>
        /// Unit rotation speed without aiming (degrees per second)
        /// </summary>
        public double RotationSpeed { get; set; }
        /// <summary>
        /// Units' movement speed while spawning
        /// </summary>
        public double SpawnMovementSpeed { get; set; }
        /// <summary>
        /// Max unit speed when walking forward
        /// </summary>
        public double MaxUnitForwardSpeed { get; set; }
        /// <summary>
        /// Max unit speed when walking backward
        /// </summary>
        public double MaxUnitBackwardSpeed { get; set; }
        /// <summary>
        /// Max unit acceleration
        /// </summary>
        public double UnitAcceleration { get; set; }
        /// <summary>
        /// Whether a unit can damage units of the same team
        /// </summary>
        public bool FriendlyFire { get; set; }
        /// <summary>
        /// Score given for killing enemy unit
        /// </summary>
        public double KillScore { get; set; }
        /// <summary>
        /// Score multiplier for damaging enemy units
        /// </summary>
        public double DamageScoreMultiplier { get; set; }
        /// <summary>
        /// Score given for every team killed before you
        /// </summary>
        public double ScorePerPlace { get; set; }
        /// <summary>
        /// List of properties of every weapon type
        /// </summary>
        public AiCup22.Model.WeaponProperties[] Weapons { get; set; }
        /// <summary>
        /// Starting weapon with which units spawn, or None
        /// </summary>
        public int? StartingWeapon { get; set; }
        /// <summary>
        /// Ammo for starting weapon given when unit spawns
        /// </summary>
        public int StartingWeaponAmmo { get; set; }
        /// <summary>
        /// Max number of shield potions in unit's inventory
        /// </summary>
        public int MaxShieldPotionsInInventory { get; set; }
        /// <summary>
        /// Amount of shield restored using one potion
        /// </summary>
        public double ShieldPerPotion { get; set; }
        /// <summary>
        /// Time required to perform action of using shield potion
        /// </summary>
        public double ShieldPotionUseTime { get; set; }
        /// <summary>
        /// List of properties of every sound type
        /// </summary>
        public AiCup22.Model.SoundProperties[] Sounds { get; set; }
        /// <summary>
        /// Sound type index when moving (starting with 0), or None
        /// </summary>
        public int? StepsSoundTypeIndex { get; set; }
        /// <summary>
        /// Distance when steps sound will be 100% probability
        /// </summary>
        public double StepsSoundTravelDistance { get; set; }
        /// <summary>
        /// List of obstacles on the map
        /// </summary>
        public AiCup22.Model.Obstacle[] Obstacles { get; set; }
    
        public Constants(double ticksPerSecond, int teamSize, double initialZoneRadius, double zoneSpeed, double zoneDamagePerSecond, double spawnTime, double spawnCollisionDamagePerSecond, double lootingTime, int botPlayers, double unitRadius, double unitHealth, double healthRegenerationPerSecond, double healthRegenerationDelay, double maxShield, double spawnShield, int extraLives, double lastRespawnZoneRadius, double fieldOfView, double viewDistance, bool viewBlocking, double rotationSpeed, double spawnMovementSpeed, double maxUnitForwardSpeed, double maxUnitBackwardSpeed, double unitAcceleration, bool friendlyFire, double killScore, double damageScoreMultiplier, double scorePerPlace, AiCup22.Model.WeaponProperties[] weapons, int? startingWeapon, int startingWeaponAmmo, int maxShieldPotionsInInventory, double shieldPerPotion, double shieldPotionUseTime, AiCup22.Model.SoundProperties[] sounds, int? stepsSoundTypeIndex, double stepsSoundTravelDistance, AiCup22.Model.Obstacle[] obstacles)
        {
            this.TicksPerSecond = ticksPerSecond;
            this.TeamSize = teamSize;
            this.InitialZoneRadius = initialZoneRadius;
            this.ZoneSpeed = zoneSpeed;
            this.ZoneDamagePerSecond = zoneDamagePerSecond;
            this.SpawnTime = spawnTime;
            this.SpawnCollisionDamagePerSecond = spawnCollisionDamagePerSecond;
            this.LootingTime = lootingTime;
            this.BotPlayers = botPlayers;
            this.UnitRadius = unitRadius;
            this.UnitHealth = unitHealth;
            this.HealthRegenerationPerSecond = healthRegenerationPerSecond;
            this.HealthRegenerationDelay = healthRegenerationDelay;
            this.MaxShield = maxShield;
            this.SpawnShield = spawnShield;
            this.ExtraLives = extraLives;
            this.LastRespawnZoneRadius = lastRespawnZoneRadius;
            this.FieldOfView = fieldOfView;
            this.ViewDistance = viewDistance;
            this.ViewBlocking = viewBlocking;
            this.RotationSpeed = rotationSpeed;
            this.SpawnMovementSpeed = spawnMovementSpeed;
            this.MaxUnitForwardSpeed = maxUnitForwardSpeed;
            this.MaxUnitBackwardSpeed = maxUnitBackwardSpeed;
            this.UnitAcceleration = unitAcceleration;
            this.FriendlyFire = friendlyFire;
            this.KillScore = killScore;
            this.DamageScoreMultiplier = damageScoreMultiplier;
            this.ScorePerPlace = scorePerPlace;
            this.Weapons = weapons;
            this.StartingWeapon = startingWeapon;
            this.StartingWeaponAmmo = startingWeaponAmmo;
            this.MaxShieldPotionsInInventory = maxShieldPotionsInInventory;
            this.ShieldPerPotion = shieldPerPotion;
            this.ShieldPotionUseTime = shieldPotionUseTime;
            this.Sounds = sounds;
            this.StepsSoundTypeIndex = stepsSoundTypeIndex;
            this.StepsSoundTravelDistance = stepsSoundTravelDistance;
            this.Obstacles = obstacles;
        }
    
        /// <summary> Read Constants from reader </summary>
        public static Constants ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new Constants();
            result.TicksPerSecond = reader.ReadDouble();
            result.TeamSize = reader.ReadInt32();
            result.InitialZoneRadius = reader.ReadDouble();
            result.ZoneSpeed = reader.ReadDouble();
            result.ZoneDamagePerSecond = reader.ReadDouble();
            result.SpawnTime = reader.ReadDouble();
            result.SpawnCollisionDamagePerSecond = reader.ReadDouble();
            result.LootingTime = reader.ReadDouble();
            result.BotPlayers = reader.ReadInt32();
            result.UnitRadius = reader.ReadDouble();
            result.UnitHealth = reader.ReadDouble();
            result.HealthRegenerationPerSecond = reader.ReadDouble();
            result.HealthRegenerationDelay = reader.ReadDouble();
            result.MaxShield = reader.ReadDouble();
            result.SpawnShield = reader.ReadDouble();
            result.ExtraLives = reader.ReadInt32();
            result.LastRespawnZoneRadius = reader.ReadDouble();
            result.FieldOfView = reader.ReadDouble();
            result.ViewDistance = reader.ReadDouble();
            result.ViewBlocking = reader.ReadBoolean();
            result.RotationSpeed = reader.ReadDouble();
            result.SpawnMovementSpeed = reader.ReadDouble();
            result.MaxUnitForwardSpeed = reader.ReadDouble();
            result.MaxUnitBackwardSpeed = reader.ReadDouble();
            result.UnitAcceleration = reader.ReadDouble();
            result.FriendlyFire = reader.ReadBoolean();
            result.KillScore = reader.ReadDouble();
            result.DamageScoreMultiplier = reader.ReadDouble();
            result.ScorePerPlace = reader.ReadDouble();
            result.Weapons = new AiCup22.Model.WeaponProperties[reader.ReadInt32()];
            for (int weaponsIndex = 0; weaponsIndex < result.Weapons.Length; weaponsIndex++)
            {
                result.Weapons[weaponsIndex] = AiCup22.Model.WeaponProperties.ReadFrom(reader);
            }
            if (reader.ReadBoolean())
            {
                result.StartingWeapon = reader.ReadInt32();
            } else
            {
                result.StartingWeapon = null;
            }
            result.StartingWeaponAmmo = reader.ReadInt32();
            result.MaxShieldPotionsInInventory = reader.ReadInt32();
            result.ShieldPerPotion = reader.ReadDouble();
            result.ShieldPotionUseTime = reader.ReadDouble();
            result.Sounds = new AiCup22.Model.SoundProperties[reader.ReadInt32()];
            for (int soundsIndex = 0; soundsIndex < result.Sounds.Length; soundsIndex++)
            {
                result.Sounds[soundsIndex] = AiCup22.Model.SoundProperties.ReadFrom(reader);
            }
            if (reader.ReadBoolean())
            {
                result.StepsSoundTypeIndex = reader.ReadInt32();
            } else
            {
                result.StepsSoundTypeIndex = null;
            }
            result.StepsSoundTravelDistance = reader.ReadDouble();
            result.Obstacles = new AiCup22.Model.Obstacle[reader.ReadInt32()];
            for (int obstaclesIndex = 0; obstaclesIndex < result.Obstacles.Length; obstaclesIndex++)
            {
                result.Obstacles[obstaclesIndex] = AiCup22.Model.Obstacle.ReadFrom(reader);
            }
            return result;
        }
    
        /// <summary> Write Constants to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            writer.Write(TicksPerSecond);
            writer.Write(TeamSize);
            writer.Write(InitialZoneRadius);
            writer.Write(ZoneSpeed);
            writer.Write(ZoneDamagePerSecond);
            writer.Write(SpawnTime);
            writer.Write(SpawnCollisionDamagePerSecond);
            writer.Write(LootingTime);
            writer.Write(BotPlayers);
            writer.Write(UnitRadius);
            writer.Write(UnitHealth);
            writer.Write(HealthRegenerationPerSecond);
            writer.Write(HealthRegenerationDelay);
            writer.Write(MaxShield);
            writer.Write(SpawnShield);
            writer.Write(ExtraLives);
            writer.Write(LastRespawnZoneRadius);
            writer.Write(FieldOfView);
            writer.Write(ViewDistance);
            writer.Write(ViewBlocking);
            writer.Write(RotationSpeed);
            writer.Write(SpawnMovementSpeed);
            writer.Write(MaxUnitForwardSpeed);
            writer.Write(MaxUnitBackwardSpeed);
            writer.Write(UnitAcceleration);
            writer.Write(FriendlyFire);
            writer.Write(KillScore);
            writer.Write(DamageScoreMultiplier);
            writer.Write(ScorePerPlace);
            writer.Write(Weapons.Length);
            foreach (var weaponsElement in Weapons)
            {
                weaponsElement.WriteTo(writer);
            }
            if (!StartingWeapon.HasValue)
            {
                writer.Write(false);
            } else
            {
                writer.Write(true);
                writer.Write(StartingWeapon.Value);
            }
            writer.Write(StartingWeaponAmmo);
            writer.Write(MaxShieldPotionsInInventory);
            writer.Write(ShieldPerPotion);
            writer.Write(ShieldPotionUseTime);
            writer.Write(Sounds.Length);
            foreach (var soundsElement in Sounds)
            {
                soundsElement.WriteTo(writer);
            }
            if (!StepsSoundTypeIndex.HasValue)
            {
                writer.Write(false);
            } else
            {
                writer.Write(true);
                writer.Write(StepsSoundTypeIndex.Value);
            }
            writer.Write(StepsSoundTravelDistance);
            writer.Write(Obstacles.Length);
            foreach (var obstaclesElement in Obstacles)
            {
                obstaclesElement.WriteTo(writer);
            }
        }
    
        /// <summary> Get string representation of Constants </summary>
        public override string ToString() {
            string stringResult = "Constants { ";
            stringResult += "TicksPerSecond: ";
            stringResult += TicksPerSecond.ToString();
            stringResult += ", ";
            stringResult += "TeamSize: ";
            stringResult += TeamSize.ToString();
            stringResult += ", ";
            stringResult += "InitialZoneRadius: ";
            stringResult += InitialZoneRadius.ToString();
            stringResult += ", ";
            stringResult += "ZoneSpeed: ";
            stringResult += ZoneSpeed.ToString();
            stringResult += ", ";
            stringResult += "ZoneDamagePerSecond: ";
            stringResult += ZoneDamagePerSecond.ToString();
            stringResult += ", ";
            stringResult += "SpawnTime: ";
            stringResult += SpawnTime.ToString();
            stringResult += ", ";
            stringResult += "SpawnCollisionDamagePerSecond: ";
            stringResult += SpawnCollisionDamagePerSecond.ToString();
            stringResult += ", ";
            stringResult += "LootingTime: ";
            stringResult += LootingTime.ToString();
            stringResult += ", ";
            stringResult += "BotPlayers: ";
            stringResult += BotPlayers.ToString();
            stringResult += ", ";
            stringResult += "UnitRadius: ";
            stringResult += UnitRadius.ToString();
            stringResult += ", ";
            stringResult += "UnitHealth: ";
            stringResult += UnitHealth.ToString();
            stringResult += ", ";
            stringResult += "HealthRegenerationPerSecond: ";
            stringResult += HealthRegenerationPerSecond.ToString();
            stringResult += ", ";
            stringResult += "HealthRegenerationDelay: ";
            stringResult += HealthRegenerationDelay.ToString();
            stringResult += ", ";
            stringResult += "MaxShield: ";
            stringResult += MaxShield.ToString();
            stringResult += ", ";
            stringResult += "SpawnShield: ";
            stringResult += SpawnShield.ToString();
            stringResult += ", ";
            stringResult += "ExtraLives: ";
            stringResult += ExtraLives.ToString();
            stringResult += ", ";
            stringResult += "LastRespawnZoneRadius: ";
            stringResult += LastRespawnZoneRadius.ToString();
            stringResult += ", ";
            stringResult += "FieldOfView: ";
            stringResult += FieldOfView.ToString();
            stringResult += ", ";
            stringResult += "ViewDistance: ";
            stringResult += ViewDistance.ToString();
            stringResult += ", ";
            stringResult += "ViewBlocking: ";
            stringResult += ViewBlocking.ToString();
            stringResult += ", ";
            stringResult += "RotationSpeed: ";
            stringResult += RotationSpeed.ToString();
            stringResult += ", ";
            stringResult += "SpawnMovementSpeed: ";
            stringResult += SpawnMovementSpeed.ToString();
            stringResult += ", ";
            stringResult += "MaxUnitForwardSpeed: ";
            stringResult += MaxUnitForwardSpeed.ToString();
            stringResult += ", ";
            stringResult += "MaxUnitBackwardSpeed: ";
            stringResult += MaxUnitBackwardSpeed.ToString();
            stringResult += ", ";
            stringResult += "UnitAcceleration: ";
            stringResult += UnitAcceleration.ToString();
            stringResult += ", ";
            stringResult += "FriendlyFire: ";
            stringResult += FriendlyFire.ToString();
            stringResult += ", ";
            stringResult += "KillScore: ";
            stringResult += KillScore.ToString();
            stringResult += ", ";
            stringResult += "DamageScoreMultiplier: ";
            stringResult += DamageScoreMultiplier.ToString();
            stringResult += ", ";
            stringResult += "ScorePerPlace: ";
            stringResult += ScorePerPlace.ToString();
            stringResult += ", ";
            stringResult += "Weapons: ";
            stringResult += "[ ";
            int weaponsIndex = 0;
            foreach (var weaponsElement in Weapons)
            {
                if (weaponsIndex != 0) {
                    stringResult += ", ";
                }
                stringResult += weaponsElement.ToString();
                weaponsIndex++;
            }
            stringResult += " ]";
            stringResult += ", ";
            stringResult += "StartingWeapon: ";
            if (!StartingWeapon.HasValue)
            {
                stringResult += "null";
            } else
            {
                stringResult += StartingWeapon.Value.ToString();
            }
            stringResult += ", ";
            stringResult += "StartingWeaponAmmo: ";
            stringResult += StartingWeaponAmmo.ToString();
            stringResult += ", ";
            stringResult += "MaxShieldPotionsInInventory: ";
            stringResult += MaxShieldPotionsInInventory.ToString();
            stringResult += ", ";
            stringResult += "ShieldPerPotion: ";
            stringResult += ShieldPerPotion.ToString();
            stringResult += ", ";
            stringResult += "ShieldPotionUseTime: ";
            stringResult += ShieldPotionUseTime.ToString();
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
            stringResult += ", ";
            stringResult += "StepsSoundTypeIndex: ";
            if (!StepsSoundTypeIndex.HasValue)
            {
                stringResult += "null";
            } else
            {
                stringResult += StepsSoundTypeIndex.Value.ToString();
            }
            stringResult += ", ";
            stringResult += "StepsSoundTravelDistance: ";
            stringResult += StepsSoundTravelDistance.ToString();
            stringResult += ", ";
            stringResult += "Obstacles: ";
            stringResult += "[ ";
            int obstaclesIndex = 0;
            foreach (var obstaclesElement in Obstacles)
            {
                if (obstaclesIndex != 0) {
                    stringResult += ", ";
                }
                stringResult += obstaclesElement.ToString();
                obstaclesIndex++;
            }
            stringResult += " ]";
            stringResult += " }";
            return stringResult;
        }
    }
}