package model

import (
	"fmt"

	"aicup22/pkg/stream"
)

// A unit
type Unit struct {
	// Unique id
	Id int32
	// Id of the player (team) controlling the unit
	PlayerId int32
	// Current health
	Health float64
	// Current shield value
	Shield float64
	// Left extra lives of this unit
	ExtraLives int32
	// Current position of unit's center
	Position Vec2
	// Remaining time until unit will be spawned, or None
	RemainingSpawnTime *float64
	// Current velocity
	Velocity Vec2
	// Current view direction (vector of length 1)
	Direction Vec2
	// Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
	Aim float64
	// Current action unit is performing, or None
	Action *Action
	// Tick when health regeneration will start (can be less than current game tick)
	HealthRegenerationStartTick int32
	// Index of the weapon this unit is holding (starting with 0), or None
	Weapon *int32
	// Next tick when unit can shoot again (can be less than current game tick)
	NextShotTick int32
	// List of ammo in unit's inventory for every weapon type
	Ammo []int32
	// Number of shield potions in inventory
	ShieldPotions int32
}

func NewUnit(id, playerId int32,
	health, shield float64,
	extraLives int32, position Vec2, remainingSpawnTime *float64,
	velocity, direction Vec2, aim float64, action *Action,
	healthRegenerationStartTick int32, weapon *int32, nextShotTick int32, ammo []int32, shieldPotions int32) Unit {
	return Unit{
		Id:                          id,
		PlayerId:                    playerId,
		Health:                      health,
		Shield:                      shield,
		ExtraLives:                  extraLives,
		Position:                    position,
		RemainingSpawnTime:          remainingSpawnTime,
		Velocity:                    velocity,
		Direction:                   direction,
		Aim:                         aim,
		Action:                      action,
		HealthRegenerationStartTick: healthRegenerationStartTick,
		Weapon:                      weapon,
		NextShotTick:                nextShotTick,
		Ammo:                        ammo,
		ShieldPotions:               shieldPotions,
	}
}

// Read Unit from reader
func ReadUnit() Unit {
	id := flow.ReadInt32()
	playerId := flow.ReadInt32()
	health := flow.ReadFloat64()
	shield := flow.ReadFloat64()
	extraLives := flow.ReadInt32()
	position := ReadVec2()
	var remainingSpawnTime *float64
	if stream.Flow().ReadBool() {
		remainingSpawnTimeValue := flow.ReadFloat64()
		remainingSpawnTime = &remainingSpawnTimeValue
	} else {
		remainingSpawnTime = nil
	}
	velocity := ReadVec2()
	direction := ReadVec2()
	aim := flow.ReadFloat64()
	var action *Action
	if flow.ReadBool() {
		actionValue := ReadAction()
		action = &actionValue
	} else {
		action = nil
	}
	healthRegenerationStartTick := stream.Flow().ReadInt32()
	var weapon *int32
	if stream.Flow().ReadBool() {
		weaponValue := stream.Flow().ReadInt32()
		weapon = &weaponValue
	} else {
		weapon = nil
	}
	nextShotTick := stream.Flow().ReadInt32()
	ammo := make([]int32, stream.Flow().ReadInt32())
	for ammoIndex := range ammo {
		ammoElement := stream.Flow().ReadInt32()
		ammo[ammoIndex] = ammoElement
	}
	shieldPotions := stream.Flow().ReadInt32()
	return Unit{
		Id:                          id,
		PlayerId:                    playerId,
		Health:                      health,
		Shield:                      shield,
		ExtraLives:                  extraLives,
		Position:                    position,
		RemainingSpawnTime:          remainingSpawnTime,
		Velocity:                    velocity,
		Direction:                   direction,
		Aim:                         aim,
		Action:                      action,
		HealthRegenerationStartTick: healthRegenerationStartTick,
		Weapon:                      weapon,
		NextShotTick:                nextShotTick,
		Ammo:                        ammo,
		ShieldPotions:               shieldPotions,
	}
}

// Write Unit to writer
func (sf Unit) Write() {
	id := sf.Id
	flow.WriteInt32(id)
	playerId := sf.PlayerId
	flow.WriteInt32(playerId)
	health := sf.Health
	flow.WriteFloat64(health)
	shield := sf.Shield
	flow.WriteFloat64(shield)
	extraLives := sf.ExtraLives
	flow.WriteInt32(extraLives)
	position := sf.Position
	position.Write()
	remainingSpawnTime := sf.RemainingSpawnTime
	if remainingSpawnTime == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		remainingSpawnTimeValue := *remainingSpawnTime
		flow.WriteFloat64(remainingSpawnTimeValue)
	}
	velocity := sf.Velocity
	velocity.Write()
	direction := sf.Direction
	direction.Write()
	aim := sf.Aim
	flow.WriteFloat64(aim)
	action := sf.Action
	if action == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		actionValue := *action
		actionValue.Write()
	}
	healthRegenerationStartTick := sf.HealthRegenerationStartTick
	flow.WriteInt32(healthRegenerationStartTick)
	weapon := sf.Weapon
	if weapon == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		weaponValue := *weapon
		flow.WriteInt32(weaponValue)
	}
	nextShotTick := sf.NextShotTick
	flow.WriteInt32(nextShotTick)
	ammo := sf.Ammo
	flow.WriteInt32(int32(len(ammo)))
	for _, ammoElement := range ammo {
		flow.WriteInt32(ammoElement)
	}
	shieldPotions := sf.ShieldPotions
	flow.WriteInt32(shieldPotions)
}

// Get string representation of Unit
func (sf Unit) String() string {
	strRes := "{ "
	strRes += "Id: "
	id := sf.Id
	strRes += fmt.Sprint(id)
	strRes += ", "
	strRes += "PlayerId: "
	playerId := sf.PlayerId
	strRes += fmt.Sprint(playerId)
	strRes += ", "
	strRes += "Health: "
	health := sf.Health
	strRes += fmt.Sprint(health)
	strRes += ", "
	strRes += "Shield: "
	shield := sf.Shield
	strRes += fmt.Sprint(shield)
	strRes += ", "
	strRes += "ExtraLives: "
	extraLives := sf.ExtraLives
	strRes += fmt.Sprint(extraLives)
	strRes += ", "
	strRes += "Position: "
	position := sf.Position
	strRes += position.String()
	strRes += ", "
	strRes += "RemainingSpawnTime: "
	remainingSpawnTime := sf.RemainingSpawnTime
	if remainingSpawnTime == nil {
		strRes += "nil"
	} else {
		remainingSpawnTimeValue := *remainingSpawnTime
		strRes += fmt.Sprint(remainingSpawnTimeValue)
	}
	strRes += ", "
	strRes += "Velocity: "
	velocity := sf.Velocity
	strRes += velocity.String()
	strRes += ", "
	strRes += "Direction: "
	direction := sf.Direction
	strRes += direction.String()
	strRes += ", "
	strRes += "Aim: "
	aim := sf.Aim
	strRes += fmt.Sprint(aim)
	strRes += ", "
	strRes += "Action: "
	action := sf.Action
	if action == nil {
		strRes += "nil"
	} else {
		actionValue := *action
		strRes += actionValue.String()
	}
	strRes += ", "
	strRes += "HealthRegenerationStartTick: "
	healthRegenerationStartTick := sf.HealthRegenerationStartTick
	strRes += fmt.Sprint(healthRegenerationStartTick)
	strRes += ", "
	strRes += "Weapon: "
	weapon := sf.Weapon
	if weapon == nil {
		strRes += "nil"
	} else {
		weaponValue := *weapon
		strRes += fmt.Sprint(weaponValue)
	}
	strRes += ", "
	strRes += "NextShotTick: "
	nextShotTick := sf.NextShotTick
	strRes += fmt.Sprint(nextShotTick)
	strRes += ", "
	strRes += "Ammo: "
	ammo := sf.Ammo
	strRes += "[ "
	for ammoIndex, ammoElement := range ammo {
		if ammoIndex != 0 {
			strRes += ", "
		}
		strRes += fmt.Sprint(ammoElement)
	}
	strRes += " ]"
	strRes += ", "
	strRes += "ShieldPotions: "
	shieldPotions := sf.ShieldPotions
	strRes += fmt.Sprint(shieldPotions)
	strRes += " }"
	return strRes
}
