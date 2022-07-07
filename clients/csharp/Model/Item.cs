namespace AiCup22.Model
{
    /// <summary>
    /// Lootable item
    /// </summary>
    public abstract class Item
    {
        /// <summary> Write Item to writer </summary>
        public abstract void WriteTo(System.IO.BinaryWriter writer);

        /// <summary> Read Item from reader </summary>
        public static Item ReadFrom(System.IO.BinaryReader reader)
        {
            switch (reader.ReadInt32())
            {
                case Weapon.TAG:
                    return Weapon.ReadFrom(reader);
                case ShieldPotions.TAG:
                    return ShieldPotions.ReadFrom(reader);
                case Ammo.TAG:
                    return Ammo.ReadFrom(reader);
                default:
                    throw new System.Exception("Unexpected tag value");
            }
        }

        /// <summary>
        /// Weapon
        /// </summary>
        public class Weapon : Item
        {
            public const int TAG = 0;
        
            /// <summary>
            /// Weapon type index (starting with 0)
            /// </summary>
            public int TypeIndex { get; set; }
        
            public Weapon() { }
        
            public Weapon(int typeIndex)
            {
                this.TypeIndex = typeIndex;
            }
        
            /// <summary> Read Weapon from reader </summary>
            public static new Weapon ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Weapon();
                result.TypeIndex = reader.ReadInt32();
                return result;
            }
        
            /// <summary> Write Weapon to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                writer.Write(TypeIndex);
            }
        
            /// <summary> Get string representation of Weapon </summary>
            public override string ToString() {
                string stringResult = "Weapon { ";
                stringResult += "TypeIndex: ";
                stringResult += TypeIndex.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Shield potions
        /// </summary>
        public class ShieldPotions : Item
        {
            public const int TAG = 1;
        
            /// <summary>
            /// Amount of potions
            /// </summary>
            public int Amount { get; set; }
        
            public ShieldPotions() { }
        
            public ShieldPotions(int amount)
            {
                this.Amount = amount;
            }
        
            /// <summary> Read ShieldPotions from reader </summary>
            public static new ShieldPotions ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new ShieldPotions();
                result.Amount = reader.ReadInt32();
                return result;
            }
        
            /// <summary> Write ShieldPotions to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                writer.Write(Amount);
            }
        
            /// <summary> Get string representation of ShieldPotions </summary>
            public override string ToString() {
                string stringResult = "ShieldPotions { ";
                stringResult += "Amount: ";
                stringResult += Amount.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Ammo
        /// </summary>
        public class Ammo : Item
        {
            public const int TAG = 2;
        
            /// <summary>
            /// Weapon type index (starting with 0)
            /// </summary>
            public int WeaponTypeIndex { get; set; }
            /// <summary>
            /// Amount of ammo
            /// </summary>
            public int Amount { get; set; }
        
            public Ammo() { }
        
            public Ammo(int weaponTypeIndex, int amount)
            {
                this.WeaponTypeIndex = weaponTypeIndex;
                this.Amount = amount;
            }
        
            /// <summary> Read Ammo from reader </summary>
            public static new Ammo ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Ammo();
                result.WeaponTypeIndex = reader.ReadInt32();
                result.Amount = reader.ReadInt32();
                return result;
            }
        
            /// <summary> Write Ammo to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                writer.Write(WeaponTypeIndex);
                writer.Write(Amount);
            }
        
            /// <summary> Get string representation of Ammo </summary>
            public override string ToString() {
                string stringResult = "Ammo { ";
                stringResult += "WeaponTypeIndex: ";
                stringResult += WeaponTypeIndex.ToString();
                stringResult += ", ";
                stringResult += "Amount: ";
                stringResult += Amount.ToString();
                stringResult += " }";
                return stringResult;
            }
        }
    }
}