package model

import (
	"fmt"
)

// Order to perform an action for unit
type ActionOrder interface {
	// Write ActionOrder to writer
	Write()

	// Get string representation of ActionOrder
	String() string
}

// Read ActionOrder from reader
func ReadActionOrder() ActionOrder {
	// FIXME: сплошные магические константы
	switch flow.ReadInt32() {
	case 0:
		return ReadActionOrderPickup()
	case 1:
		return ReadActionOrderUseShieldPotion()
	case 2:
		return ReadActionOrderDropShieldPotions()
	case 3:
		return ReadActionOrderDropWeapon()
	case 4:
		return ReadActionOrderDropAmmo()
	case 5:
		return ReadActionOrderAim()
	}
	panic("Unexpected tag value")
}

// Pick up loot
type ActionOrderPickup struct {
	// Loot id
	Loot int32
}

func NewActionOrderPickup(loot int32) ActionOrderPickup {
	return ActionOrderPickup{
		Loot: loot,
	}
}

// Read Pickup from reader
func ReadActionOrderPickup() ActionOrderPickup {
	loot := flow.ReadInt32()
	return ActionOrderPickup{
		Loot: loot,
	}
}

// Write Pickup to writer
func (actionOrderPickup ActionOrderPickup) Write() {
	flow.WriteInt32(0)
	loot := actionOrderPickup.Loot
	flow.WriteInt32(loot)
}

// Get string representation of Pickup
func (actionOrderPickup ActionOrderPickup) String() string {
	stringResult := "{ "
	stringResult += "Loot: "
	loot := actionOrderPickup.Loot
	stringResult += fmt.Sprint(loot)
	stringResult += " }"
	return stringResult
}

// Use shield potion
type ActionOrderUseShieldPotion struct {
}

func NewActionOrderUseShieldPotion() ActionOrderUseShieldPotion {
	return ActionOrderUseShieldPotion{}
}

// Read UseShieldPotion from reader
func ReadActionOrderUseShieldPotion() ActionOrderUseShieldPotion {
	return ActionOrderUseShieldPotion{}
}

// Write UseShieldPotion to writer
func (actionOrderUseShieldPotion ActionOrderUseShieldPotion) Write() {
	flow.WriteInt32(1)
}

// Get string representation of UseShieldPotion
func (actionOrderUseShieldPotion ActionOrderUseShieldPotion) String() string {
	stringResult := "{ "
	stringResult += " }"
	return stringResult
}

// Drop shield potions on the ground
type ActionOrderDropShieldPotions struct {
	// Amount of potions
	Amount int32
}

func NewActionOrderDropShieldPotions(amount int32) ActionOrderDropShieldPotions {
	return ActionOrderDropShieldPotions{
		Amount: amount,
	}
}

// Read DropShieldPotions from reader
func ReadActionOrderDropShieldPotions() ActionOrderDropShieldPotions {
	amount := flow.ReadInt32()
	return ActionOrderDropShieldPotions{
		Amount: amount,
	}
}

// Write DropShieldPotions to writer
func (actionOrderDropShieldPotions ActionOrderDropShieldPotions) Write() {
	flow.WriteInt32(2)
	amount := actionOrderDropShieldPotions.Amount
	flow.WriteInt32(amount)
}

// Get string representation of DropShieldPotions
func (actionOrderDropShieldPotions ActionOrderDropShieldPotions) String() string {
	stringResult := "{ "
	stringResult += "Amount: "
	amount := actionOrderDropShieldPotions.Amount
	stringResult += fmt.Sprint(amount)
	stringResult += " }"
	return stringResult
}

// Drop current weapon
type ActionOrderDropWeapon struct {
}

func NewActionOrderDropWeapon() ActionOrderDropWeapon {
	return ActionOrderDropWeapon{}
}

// Read DropWeapon from reader
func ReadActionOrderDropWeapon() ActionOrderDropWeapon {
	return ActionOrderDropWeapon{}
}

// Write DropWeapon to writer
func (actionOrderDropWeapon ActionOrderDropWeapon) Write() {
	flow.WriteInt32(3)
}

// Get string representation of DropWeapon
func (actionOrderDropWeapon ActionOrderDropWeapon) String() string {
	stringResult := "{ "
	stringResult += " }"
	return stringResult
}

// Drop ammo
type ActionOrderDropAmmo struct {
	// Weapon type index (starting with 0)
	WeaponTypeIndex int32
	// Amount of ammo
	Amount int32
}

func NewActionOrderDropAmmo(weaponTypeIndex int32, amount int32) ActionOrderDropAmmo {
	return ActionOrderDropAmmo{
		WeaponTypeIndex: weaponTypeIndex,
		Amount:          amount,
	}
}

// Read DropAmmo from reader
func ReadActionOrderDropAmmo() ActionOrderDropAmmo {
	weaponTypeIndex := flow.ReadInt32()
	amount := flow.ReadInt32()
	return ActionOrderDropAmmo{
		WeaponTypeIndex: weaponTypeIndex,
		Amount:          amount,
	}
}

// Write DropAmmo to writer
func (actionOrderDropAmmo ActionOrderDropAmmo) Write() {
	flow.WriteInt32(4)
	weaponTypeIndex := actionOrderDropAmmo.WeaponTypeIndex
	flow.WriteInt32(weaponTypeIndex)
	amount := actionOrderDropAmmo.Amount
	flow.WriteInt32(amount)
}

// Get string representation of DropAmmo
func (actionOrderDropAmmo ActionOrderDropAmmo) String() string {
	stringResult := "{ "
	stringResult += "WeaponTypeIndex: "
	weaponTypeIndex := actionOrderDropAmmo.WeaponTypeIndex
	stringResult += fmt.Sprint(weaponTypeIndex)
	stringResult += ", "
	stringResult += "Amount: "
	amount := actionOrderDropAmmo.Amount
	stringResult += fmt.Sprint(amount)
	stringResult += " }"
	return stringResult
}

// Start/continue aiming
type ActionOrderAim struct {
	// Shoot (only possible in full aim)
	Shoot bool
}

func NewActionOrderAim(shoot bool) ActionOrderAim {
	return ActionOrderAim{
		Shoot: shoot,
	}
}

// Read Aim from reader
func ReadActionOrderAim() ActionOrderAim {
	shoot := flow.ReadBool()
	return ActionOrderAim{
		Shoot: shoot,
	}
}

// Write Aim to writer
func (actionOrderAim ActionOrderAim) Write() {
	flow.WriteInt32(5)
	shoot := actionOrderAim.Shoot
	flow.WriteBool(shoot)
}

// Get string representation of Aim
func (actionOrderAim ActionOrderAim) String() string {
	stringResult := "{ "
	stringResult += "Shoot: "
	shoot := actionOrderAim.Shoot
	stringResult += fmt.Sprint(shoot)
	stringResult += " }"
	return stringResult
}
