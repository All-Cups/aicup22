#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Weapon
type ItemWeapon = {
    /// Weapon type index (starting with 0)
    TypeIndex: int;
} with

    /// Write Weapon to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 0
        writer.Write this.TypeIndex
        ()

    /// Read Weapon from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        TypeIndex = reader.ReadInt32()
    }

/// Shield potions
type ItemShieldPotions = {
    /// Amount of potions
    Amount: int;
} with

    /// Write ShieldPotions to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 1
        writer.Write this.Amount
        ()

    /// Read ShieldPotions from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Amount = reader.ReadInt32()
    }

/// Ammo
type ItemAmmo = {
    /// Weapon type index (starting with 0)
    WeaponTypeIndex: int;
    /// Amount of ammo
    Amount: int;
} with

    /// Write Ammo to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 2
        writer.Write this.WeaponTypeIndex
        writer.Write this.Amount
        ()

    /// Read Ammo from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        WeaponTypeIndex = reader.ReadInt32()
        Amount = reader.ReadInt32()
    }

/// Lootable item
type Item =
    /// Weapon
    | Weapon of ItemWeapon
    /// Shield potions
    | ShieldPotions of ItemShieldPotions
    /// Ammo
    | Ammo of ItemAmmo
    with

    /// Write Item to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        match this with
            | Weapon value -> value.writeTo writer
            | ShieldPotions value -> value.writeTo writer
            | Ammo value -> value.writeTo writer

    /// Read Item from reader
    static member readFrom(reader: System.IO.BinaryReader) =
        match reader.ReadInt32() with
            | 0 -> Weapon (ItemWeapon.readFrom reader)
            | 1 -> ShieldPotions (ItemShieldPotions.readFrom reader)
            | 2 -> Ammo (ItemAmmo.readFrom reader)
            | x -> failwith (sprintf "Unexpected tag %d" x)