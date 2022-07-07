namespace AiCup22.Model
{
    /// <summary>
    /// Weapon properties
    /// </summary>
    public struct WeaponProperties
    {
        /// <summary>
        /// Name
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// Shooting speed (number of shots per second)
        /// </summary>
        public double RoundsPerSecond { get; set; }
        /// <summary>
        /// Accuracy (spread angle) of a shot (in degrees)
        /// </summary>
        public double Spread { get; set; }
        /// <summary>
        /// Aiming time
        /// </summary>
        public double AimTime { get; set; }
        /// <summary>
        /// Field of view in full aim (in degrees)
        /// </summary>
        public double AimFieldOfView { get; set; }
        /// <summary>
        /// Rotation speed in full aim (degrees per second)
        /// </summary>
        public double AimRotationSpeed { get; set; }
        /// <summary>
        /// Movement speed modifier in full aim
        /// </summary>
        public double AimMovementSpeedModifier { get; set; }
        /// <summary>
        /// Speed of projectiles
        /// </summary>
        public double ProjectileSpeed { get; set; }
        /// <summary>
        /// Damage of a projectile
        /// </summary>
        public double ProjectileDamage { get; set; }
        /// <summary>
        /// Projectiles' life time
        /// </summary>
        public double ProjectileLifeTime { get; set; }
        /// <summary>
        /// Index of the sound when shooting (starting with 0), or None
        /// </summary>
        public int? ShotSoundTypeIndex { get; set; }
        /// <summary>
        /// Index of the sound when hitting something (starting with 0), or None
        /// </summary>
        public int? ProjectileHitSoundTypeIndex { get; set; }
        /// <summary>
        /// Max amount of ammo unit can hold in their inventory
        /// </summary>
        public int MaxInventoryAmmo { get; set; }
    
        public WeaponProperties(string name, double roundsPerSecond, double spread, double aimTime, double aimFieldOfView, double aimRotationSpeed, double aimMovementSpeedModifier, double projectileSpeed, double projectileDamage, double projectileLifeTime, int? shotSoundTypeIndex, int? projectileHitSoundTypeIndex, int maxInventoryAmmo)
        {
            this.Name = name;
            this.RoundsPerSecond = roundsPerSecond;
            this.Spread = spread;
            this.AimTime = aimTime;
            this.AimFieldOfView = aimFieldOfView;
            this.AimRotationSpeed = aimRotationSpeed;
            this.AimMovementSpeedModifier = aimMovementSpeedModifier;
            this.ProjectileSpeed = projectileSpeed;
            this.ProjectileDamage = projectileDamage;
            this.ProjectileLifeTime = projectileLifeTime;
            this.ShotSoundTypeIndex = shotSoundTypeIndex;
            this.ProjectileHitSoundTypeIndex = projectileHitSoundTypeIndex;
            this.MaxInventoryAmmo = maxInventoryAmmo;
        }
    
        /// <summary> Read WeaponProperties from reader </summary>
        public static WeaponProperties ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new WeaponProperties();
            result.Name = System.Text.Encoding.UTF8.GetString(reader.ReadBytes(reader.ReadInt32()));
            result.RoundsPerSecond = reader.ReadDouble();
            result.Spread = reader.ReadDouble();
            result.AimTime = reader.ReadDouble();
            result.AimFieldOfView = reader.ReadDouble();
            result.AimRotationSpeed = reader.ReadDouble();
            result.AimMovementSpeedModifier = reader.ReadDouble();
            result.ProjectileSpeed = reader.ReadDouble();
            result.ProjectileDamage = reader.ReadDouble();
            result.ProjectileLifeTime = reader.ReadDouble();
            if (reader.ReadBoolean())
            {
                result.ShotSoundTypeIndex = reader.ReadInt32();
            } else
            {
                result.ShotSoundTypeIndex = null;
            }
            if (reader.ReadBoolean())
            {
                result.ProjectileHitSoundTypeIndex = reader.ReadInt32();
            } else
            {
                result.ProjectileHitSoundTypeIndex = null;
            }
            result.MaxInventoryAmmo = reader.ReadInt32();
            return result;
        }
    
        /// <summary> Write WeaponProperties to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            var nameData = System.Text.Encoding.UTF8.GetBytes(Name);
            writer.Write(nameData.Length);
            writer.Write(nameData);
            writer.Write(RoundsPerSecond);
            writer.Write(Spread);
            writer.Write(AimTime);
            writer.Write(AimFieldOfView);
            writer.Write(AimRotationSpeed);
            writer.Write(AimMovementSpeedModifier);
            writer.Write(ProjectileSpeed);
            writer.Write(ProjectileDamage);
            writer.Write(ProjectileLifeTime);
            if (!ShotSoundTypeIndex.HasValue)
            {
                writer.Write(false);
            } else
            {
                writer.Write(true);
                writer.Write(ShotSoundTypeIndex.Value);
            }
            if (!ProjectileHitSoundTypeIndex.HasValue)
            {
                writer.Write(false);
            } else
            {
                writer.Write(true);
                writer.Write(ProjectileHitSoundTypeIndex.Value);
            }
            writer.Write(MaxInventoryAmmo);
        }
    
        /// <summary> Get string representation of WeaponProperties </summary>
        public override string ToString() {
            string stringResult = "WeaponProperties { ";
            stringResult += "Name: ";
            stringResult += "\"" + Name + "\"";
            stringResult += ", ";
            stringResult += "RoundsPerSecond: ";
            stringResult += RoundsPerSecond.ToString();
            stringResult += ", ";
            stringResult += "Spread: ";
            stringResult += Spread.ToString();
            stringResult += ", ";
            stringResult += "AimTime: ";
            stringResult += AimTime.ToString();
            stringResult += ", ";
            stringResult += "AimFieldOfView: ";
            stringResult += AimFieldOfView.ToString();
            stringResult += ", ";
            stringResult += "AimRotationSpeed: ";
            stringResult += AimRotationSpeed.ToString();
            stringResult += ", ";
            stringResult += "AimMovementSpeedModifier: ";
            stringResult += AimMovementSpeedModifier.ToString();
            stringResult += ", ";
            stringResult += "ProjectileSpeed: ";
            stringResult += ProjectileSpeed.ToString();
            stringResult += ", ";
            stringResult += "ProjectileDamage: ";
            stringResult += ProjectileDamage.ToString();
            stringResult += ", ";
            stringResult += "ProjectileLifeTime: ";
            stringResult += ProjectileLifeTime.ToString();
            stringResult += ", ";
            stringResult += "ShotSoundTypeIndex: ";
            if (!ShotSoundTypeIndex.HasValue)
            {
                stringResult += "null";
            } else
            {
                stringResult += ShotSoundTypeIndex.Value.ToString();
            }
            stringResult += ", ";
            stringResult += "ProjectileHitSoundTypeIndex: ";
            if (!ProjectileHitSoundTypeIndex.HasValue)
            {
                stringResult += "null";
            } else
            {
                stringResult += ProjectileHitSoundTypeIndex.Value.ToString();
            }
            stringResult += ", ";
            stringResult += "MaxInventoryAmmo: ";
            stringResult += MaxInventoryAmmo.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}