#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Pick up loot
type ActionOrderPickup = {
    /// Loot id
    Loot: int;
} with

    /// Write Pickup to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 0
        writer.Write this.Loot
        ()

    /// Read Pickup from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Loot = reader.ReadInt32()
    }

/// Use shield potion
type ActionOrderUseShieldPotion = struct end with

    /// Write UseShieldPotion to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 1
        ()

    /// Read UseShieldPotion from reader
    static member readFrom(reader: System.IO.BinaryReader) = new ActionOrderUseShieldPotion()

/// Drop shield potions on the ground
type ActionOrderDropShieldPotions = {
    /// Amount of potions
    Amount: int;
} with

    /// Write DropShieldPotions to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 2
        writer.Write this.Amount
        ()

    /// Read DropShieldPotions from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Amount = reader.ReadInt32()
    }

/// Drop current weapon
type ActionOrderDropWeapon = struct end with

    /// Write DropWeapon to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 3
        ()

    /// Read DropWeapon from reader
    static member readFrom(reader: System.IO.BinaryReader) = new ActionOrderDropWeapon()

/// Drop ammo
type ActionOrderDropAmmo = {
    /// Weapon type index (starting with 0)
    WeaponTypeIndex: int;
    /// Amount of ammo
    Amount: int;
} with

    /// Write DropAmmo to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 4
        writer.Write this.WeaponTypeIndex
        writer.Write this.Amount
        ()

    /// Read DropAmmo from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        WeaponTypeIndex = reader.ReadInt32()
        Amount = reader.ReadInt32()
    }

/// Start/continue aiming
type ActionOrderAim = {
    /// Shoot (only possible in full aim)
    Shoot: bool;
} with

    /// Write Aim to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 5
        writer.Write this.Shoot
        ()

    /// Read Aim from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Shoot = reader.ReadBoolean()
    }

/// Order to perform an action for unit
type ActionOrder =
    /// Pick up loot
    | Pickup of ActionOrderPickup
    /// Use shield potion
    | UseShieldPotion of ActionOrderUseShieldPotion
    /// Drop shield potions on the ground
    | DropShieldPotions of ActionOrderDropShieldPotions
    /// Drop current weapon
    | DropWeapon of ActionOrderDropWeapon
    /// Drop ammo
    | DropAmmo of ActionOrderDropAmmo
    /// Start/continue aiming
    | Aim of ActionOrderAim
    with

    /// Write ActionOrder to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        match this with
            | Pickup value -> value.writeTo writer
            | UseShieldPotion value -> value.writeTo writer
            | DropShieldPotions value -> value.writeTo writer
            | DropWeapon value -> value.writeTo writer
            | DropAmmo value -> value.writeTo writer
            | Aim value -> value.writeTo writer

    /// Read ActionOrder from reader
    static member readFrom(reader: System.IO.BinaryReader) =
        match reader.ReadInt32() with
            | 0 -> Pickup (ActionOrderPickup.readFrom reader)
            | 1 -> UseShieldPotion (ActionOrderUseShieldPotion.readFrom reader)
            | 2 -> DropShieldPotions (ActionOrderDropShieldPotions.readFrom reader)
            | 3 -> DropWeapon (ActionOrderDropWeapon.readFrom reader)
            | 4 -> DropAmmo (ActionOrderDropAmmo.readFrom reader)
            | 5 -> Aim (ActionOrderAim.readFrom reader)
            | x -> failwith (sprintf "Unexpected tag %d" x)