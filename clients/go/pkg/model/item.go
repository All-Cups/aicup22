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
func (itemWeapon ItemWeapon) Write() {
	flow.WriteInt32(0)
	typeIndex := itemWeapon.TypeIndex
	flow.WriteInt32(typeIndex)
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
func ReadItemShieldPotions() ItemShieldPotions {
	amount := flow.ReadInt32()
	return ItemShieldPotions{
		Amount: amount,
	}
}

// Write ShieldPotions to writer
func (itemShieldPotions ItemShieldPotions) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(1)
	amount := itemShieldPotions.Amount
	flow.WriteInt32(amount)
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
func ReadItemAmmo() ItemAmmo {
	weaponTypeIndex := flow.ReadInt32()
	amount := flow.ReadInt32()
	return ItemAmmo{
		WeaponTypeIndex: weaponTypeIndex,
		Amount:          amount,
	}
}

// Write Ammo to writer
func (itemAmmo ItemAmmo) Write() {
	flow.WriteInt32(2)
	weaponTypeIndex := itemAmmo.WeaponTypeIndex
	flow.WriteInt32(weaponTypeIndex)
	amount := itemAmmo.Amount
	flow.WriteInt32(amount)
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
