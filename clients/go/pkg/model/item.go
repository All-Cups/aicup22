package model

import (
	"fmt"
)

// Lootable item
type Item interface {
	// Write Item to writer
	Write()

	// Get string representation of Item
	String() string
}

// Read Item from reader
func ReadItem() Item {
	// FIXME: магические константы
	switch flow.ReadInt32() {
	case 0:
		return ReadItemWeapon()
	case 1:
		return ReadItemShieldPotions()
	case 2:
		return ReadItemAmmo()
	}
	// FIXME: панику убрать из кода!!
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
func ReadItemWeapon() ItemWeapon {
	typeIndex := flow.ReadInt32()
	return ItemWeapon{
		TypeIndex: typeIndex,
	}
}

// Write Weapon to writer
func (sf ItemWeapon) Write() {
	flow.WriteInt32(0)
	typeIndex := sf.TypeIndex
	flow.WriteInt32(typeIndex)
}

// Get string representation of Weapon
func (sf ItemWeapon) String() string {
	stringResult := "{ "
	stringResult += "TypeIndex: "
	typeIndex := sf.TypeIndex
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
func ReadItemShieldPotions() ItemShieldPotions {
	amount := flow.ReadInt32()
	return ItemShieldPotions{
		Amount: amount,
	}
}

// Write ShieldPotions to writer
func (sf ItemShieldPotions) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(1)
	amount := sf.Amount
	flow.WriteInt32(amount)
}

// Get string representation of ShieldPotions
func (sf ItemShieldPotions) String() string {
	stringResult := "{ "
	stringResult += "Amount: "
	amount := sf.Amount
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
func ReadItemAmmo() ItemAmmo {
	weaponTypeIndex := flow.ReadInt32()
	amount := flow.ReadInt32()
	return ItemAmmo{
		WeaponTypeIndex: weaponTypeIndex,
		Amount:          amount,
	}
}

// Write Ammo to writer
func (sf ItemAmmo) Write() {
	flow.WriteInt32(2)
	weaponTypeIndex := sf.WeaponTypeIndex
	flow.WriteInt32(weaponTypeIndex)
	amount := sf.Amount
	flow.WriteInt32(amount)
}

// Get string representation of Ammo
func (sf ItemAmmo) String() string {
	strRes := "{ "
	strRes += "WeaponTypeIndex: "
	weaponTypeIndex := sf.WeaponTypeIndex
	strRes += fmt.Sprint(weaponTypeIndex)
	strRes += ", "
	strRes += "Amount: "
	amount := sf.Amount
	strRes += fmt.Sprint(amount)
	strRes += " }"
	return strRes
}
