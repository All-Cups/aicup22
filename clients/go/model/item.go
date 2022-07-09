package model

import (
	"fmt"
	"io"

	. "aicup22/stream"
)

// Lootable item
type Item interface {
	// Write Item to writer
	Write(writer io.Writer)

	// Get string representation of Item
	String() string
}

// Read Item from reader
func ReadItem(reader io.Reader) Item {
	switch ReadInt32(reader) {
	case 0:
		return ReadItemWeapon(reader)
	case 1:
		return ReadItemShieldPotions(reader)
	case 2:
		return ReadItemAmmo(reader)
	}
	panic("Unexpected tag value")
}

// Weapon
type ItemWeapon struct {
	// Weapon type index (starting with 0)
	TypeIndex int32
}

func NewItemWeapon(typeIndex int32) ItemWeapon {
	return ItemWeapon{
		TypeIndex: typeIndex,
	}
}

// Read Weapon from reader
func ReadItemWeapon(reader io.Reader) ItemWeapon {
	var typeIndex int32
	typeIndex = ReadInt32(reader)
	return ItemWeapon{
		TypeIndex: typeIndex,
	}
}

// Write Weapon to writer
func (itemWeapon ItemWeapon) Write(writer io.Writer) {
	WriteInt32(writer, 0)
	typeIndex := itemWeapon.TypeIndex
	WriteInt32(writer, typeIndex)
}

// Get string representation of Weapon
func (itemWeapon ItemWeapon) String() string {
	stringResult := "{ "
	stringResult += "TypeIndex: "
	typeIndex := itemWeapon.TypeIndex
	stringResult += fmt.Sprint(typeIndex)
	stringResult += " }"
	return stringResult
}

// Shield potions
type ItemShieldPotions struct {
	// Amount of potions
	Amount int32
}

func NewItemShieldPotions(amount int32) ItemShieldPotions {
	return ItemShieldPotions{
		Amount: amount,
	}
}

// Read ShieldPotions from reader
func ReadItemShieldPotions(reader io.Reader) ItemShieldPotions {
	var amount int32
	amount = ReadInt32(reader)
	return ItemShieldPotions{
		Amount: amount,
	}
}

// Write ShieldPotions to writer
func (itemShieldPotions ItemShieldPotions) Write(writer io.Writer) {
	WriteInt32(writer, 1)
	amount := itemShieldPotions.Amount
	WriteInt32(writer, amount)
}

// Get string representation of ShieldPotions
func (itemShieldPotions ItemShieldPotions) String() string {
	stringResult := "{ "
	stringResult += "Amount: "
	amount := itemShieldPotions.Amount
	stringResult += fmt.Sprint(amount)
	stringResult += " }"
	return stringResult
}

// Ammo
type ItemAmmo struct {
	// Weapon type index (starting with 0)
	WeaponTypeIndex int32
	// Amount of ammo
	Amount int32
}

func NewItemAmmo(weaponTypeIndex int32, amount int32) ItemAmmo {
	return ItemAmmo{
		WeaponTypeIndex: weaponTypeIndex,
		Amount:          amount,
	}
}

// Read Ammo from reader
func ReadItemAmmo(reader io.Reader) ItemAmmo {
	var weaponTypeIndex int32
	weaponTypeIndex = ReadInt32(reader)
	var amount int32
	amount = ReadInt32(reader)
	return ItemAmmo{
		WeaponTypeIndex: weaponTypeIndex,
		Amount:          amount,
	}
}

// Write Ammo to writer
func (itemAmmo ItemAmmo) Write(writer io.Writer) {
	WriteInt32(writer, 2)
	weaponTypeIndex := itemAmmo.WeaponTypeIndex
	WriteInt32(writer, weaponTypeIndex)
	amount := itemAmmo.Amount
	WriteInt32(writer, amount)
}

// Get string representation of Ammo
func (itemAmmo ItemAmmo) String() string {
	stringResult := "{ "
	stringResult += "WeaponTypeIndex: "
	weaponTypeIndex := itemAmmo.WeaponTypeIndex
	stringResult += fmt.Sprint(weaponTypeIndex)
	stringResult += ", "
	stringResult += "Amount: "
	amount := itemAmmo.Amount
	stringResult += fmt.Sprint(amount)
	stringResult += " }"
	return stringResult
}
