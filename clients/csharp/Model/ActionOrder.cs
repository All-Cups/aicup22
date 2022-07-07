namespace AiCup22.Model
{
    /// <summary>
    /// Order to perform an action for unit
    /// </summary>
    public abstract class ActionOrder
    {
        /// <summary> Write ActionOrder to writer </summary>
        public abstract void WriteTo(System.IO.BinaryWriter writer);

        /// <summary> Read ActionOrder from reader </summary>
        public static ActionOrder ReadFrom(System.IO.BinaryReader reader)
        {
            switch (reader.ReadInt32())
            {
                case Pickup.TAG:
                    return Pickup.ReadFrom(reader);
                case UseShieldPotion.TAG:
                    return UseShieldPotion.ReadFrom(reader);
                case DropShieldPotions.TAG:
                    return DropShieldPotions.ReadFrom(reader);
                case DropWeapon.TAG:
                    return DropWeapon.ReadFrom(reader);
                case DropAmmo.TAG:
                    return DropAmmo.ReadFrom(reader);
                case Aim.TAG:
                    return Aim.ReadFrom(reader);
                default:
                    throw new System.Exception("Unexpected tag value");
            }
        }

        /// <summary>
        /// Pick up loot
        /// </summary>
        public class Pickup : ActionOrder
        {
            public const int TAG = 0;
        
            /// <summary>
            /// Loot id
            /// </summary>
            public int Loot { get; set; }
        
            public Pickup() { }
        
            public Pickup(int loot)
            {
                this.Loot = loot;
            }
        
            /// <summary> Read Pickup from reader </summary>
            public static new Pickup ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Pickup();
                result.Loot = reader.ReadInt32();
                return result;
            }
        
            /// <summary> Write Pickup to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                writer.Write(Loot);
            }
        
            /// <summary> Get string representation of Pickup </summary>
            public override string ToString() {
                string stringResult = "Pickup { ";
                stringResult += "Loot: ";
                stringResult += Loot.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Use shield potion
        /// </summary>
        public class UseShieldPotion : ActionOrder
        {
            public const int TAG = 1;
        
        
            public UseShieldPotion() { }
        
            /// <summary> Read UseShieldPotion from reader </summary>
            public static new UseShieldPotion ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new UseShieldPotion();
                return result;
            }
        
            /// <summary> Write UseShieldPotion to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
            }
        
            /// <summary> Get string representation of UseShieldPotion </summary>
            public override string ToString() {
                string stringResult = "UseShieldPotion { ";
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Drop shield potions on the ground
        /// </summary>
        public class DropShieldPotions : ActionOrder
        {
            public const int TAG = 2;
        
            /// <summary>
            /// Amount of potions
            /// </summary>
            public int Amount { get; set; }
        
            public DropShieldPotions() { }
        
            public DropShieldPotions(int amount)
            {
                this.Amount = amount;
            }
        
            /// <summary> Read DropShieldPotions from reader </summary>
            public static new DropShieldPotions ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new DropShieldPotions();
                result.Amount = reader.ReadInt32();
                return result;
            }
        
            /// <summary> Write DropShieldPotions to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                writer.Write(Amount);
            }
        
            /// <summary> Get string representation of DropShieldPotions </summary>
            public override string ToString() {
                string stringResult = "DropShieldPotions { ";
                stringResult += "Amount: ";
                stringResult += Amount.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Drop current weapon
        /// </summary>
        public class DropWeapon : ActionOrder
        {
            public const int TAG = 3;
        
        
            public DropWeapon() { }
        
            /// <summary> Read DropWeapon from reader </summary>
            public static new DropWeapon ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new DropWeapon();
                return result;
            }
        
            /// <summary> Write DropWeapon to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
            }
        
            /// <summary> Get string representation of DropWeapon </summary>
            public override string ToString() {
                string stringResult = "DropWeapon { ";
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Drop ammo
        /// </summary>
        public class DropAmmo : ActionOrder
        {
            public const int TAG = 4;
        
            /// <summary>
            /// Weapon type index (starting with 0)
            /// </summary>
            public int WeaponTypeIndex { get; set; }
            /// <summary>
            /// Amount of ammo
            /// </summary>
            public int Amount { get; set; }
        
            public DropAmmo() { }
        
            public DropAmmo(int weaponTypeIndex, int amount)
            {
                this.WeaponTypeIndex = weaponTypeIndex;
                this.Amount = amount;
            }
        
            /// <summary> Read DropAmmo from reader </summary>
            public static new DropAmmo ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new DropAmmo();
                result.WeaponTypeIndex = reader.ReadInt32();
                result.Amount = reader.ReadInt32();
                return result;
            }
        
            /// <summary> Write DropAmmo to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                writer.Write(WeaponTypeIndex);
                writer.Write(Amount);
            }
        
            /// <summary> Get string representation of DropAmmo </summary>
            public override string ToString() {
                string stringResult = "DropAmmo { ";
                stringResult += "WeaponTypeIndex: ";
                stringResult += WeaponTypeIndex.ToString();
                stringResult += ", ";
                stringResult += "Amount: ";
                stringResult += Amount.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Start/continue aiming
        /// </summary>
        public class Aim : ActionOrder
        {
            public const int TAG = 5;
        
            /// <summary>
            /// Shoot (only possible in full aim)
            /// </summary>
            public bool Shoot { get; set; }
        
            public Aim() { }
        
            public Aim(bool shoot)
            {
                this.Shoot = shoot;
            }
        
            /// <summary> Read Aim from reader </summary>
            public static new Aim ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Aim();
                result.Shoot = reader.ReadBoolean();
                return result;
            }
        
            /// <summary> Write Aim to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                writer.Write(Shoot);
            }
        
            /// <summary> Get string representation of Aim </summary>
            public override string ToString() {
                string stringResult = "Aim { ";
                stringResult += "Shoot: ";
                stringResult += Shoot.ToString();
                stringResult += " }";
                return stringResult;
            }
        }
    }
}