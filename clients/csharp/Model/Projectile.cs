namespace AiCup22.Model
{
    /// <summary>
    /// Weapon projectile
    /// </summary>
    public struct Projectile
    {
        /// <summary>
        /// Unique id
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Index of the weapon this projectile was shot from (starts with 0)
        /// </summary>
        public int WeaponTypeIndex { get; set; }
        /// <summary>
        /// Id of unit who made the shot
        /// </summary>
        public int ShooterId { get; set; }
        /// <summary>
        /// Id of player (team), whose unit made the shot
        /// </summary>
        public int ShooterPlayerId { get; set; }
        /// <summary>
        /// Current position
        /// </summary>
        public AiCup22.Model.Vec2 Position { get; set; }
        /// <summary>
        /// Projectile's velocity
        /// </summary>
        public AiCup22.Model.Vec2 Velocity { get; set; }
        /// <summary>
        /// Left time of projectile's life
        /// </summary>
        public double LifeTime { get; set; }
    
        public Projectile(int id, int weaponTypeIndex, int shooterId, int shooterPlayerId, AiCup22.Model.Vec2 position, AiCup22.Model.Vec2 velocity, double lifeTime)
        {
            this.Id = id;
            this.WeaponTypeIndex = weaponTypeIndex;
            this.ShooterId = shooterId;
            this.ShooterPlayerId = shooterPlayerId;
            this.Position = position;
            this.Velocity = velocity;
            this.LifeTime = lifeTime;
        }
    
        /// <summary> Read Projectile from reader </summary>
        public static Projectile ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new Projectile();
            result.Id = reader.ReadInt32();
            result.WeaponTypeIndex = reader.ReadInt32();
            result.ShooterId = reader.ReadInt32();
            result.ShooterPlayerId = reader.ReadInt32();
            result.Position = AiCup22.Model.Vec2.ReadFrom(reader);
            result.Velocity = AiCup22.Model.Vec2.ReadFrom(reader);
            result.LifeTime = reader.ReadDouble();
            return result;
        }
    
        /// <summary> Write Projectile to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            writer.Write(Id);
            writer.Write(WeaponTypeIndex);
            writer.Write(ShooterId);
            writer.Write(ShooterPlayerId);
            Position.WriteTo(writer);
            Velocity.WriteTo(writer);
            writer.Write(LifeTime);
        }
    
        /// <summary> Get string representation of Projectile </summary>
        public override string ToString() {
            string stringResult = "Projectile { ";
            stringResult += "Id: ";
            stringResult += Id.ToString();
            stringResult += ", ";
            stringResult += "WeaponTypeIndex: ";
            stringResult += WeaponTypeIndex.ToString();
            stringResult += ", ";
            stringResult += "ShooterId: ";
            stringResult += ShooterId.ToString();
            stringResult += ", ";
            stringResult += "ShooterPlayerId: ";
            stringResult += ShooterPlayerId.ToString();
            stringResult += ", ";
            stringResult += "Position: ";
            stringResult += Position.ToString();
            stringResult += ", ";
            stringResult += "Velocity: ";
            stringResult += Velocity.ToString();
            stringResult += ", ";
            stringResult += "LifeTime: ";
            stringResult += LifeTime.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}