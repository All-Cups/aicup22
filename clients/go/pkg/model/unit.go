package model

import (
	"fmt"
	"io"

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

func NewUnit(id, playerId int32, health, shield float64, extraLives int32, position Vec2, remainingSpawnTime *float64, velocity, direction Vec2, aim float64, action *Action, healthRegenerationStartTick int32, weapon *int32, nextShotTick int32, ammo []int32, shieldPotions int32) Unit {
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
func ReadUnit(reader io.Reader) Unit {
	id := flow.ReadInt32()
	playerId := flow.ReadInt32()
	health := flow.ReadFloat64()
	shield := flow.ReadFloat64()
	extraLives := flow.ReadInt32()
	position := ReadVec2(reader)
	var remainingSpawnTime *float64
	if stream.Flow().ReadBool() {
		remainingSpawnTimeValue := flow.ReadFloat64()
		remainingSpawnTime = &remainingSpawnTimeValue
	} else {
		remainingSpawnTime = nil
	}
	velocity := ReadVec2(reader)
	direction := ReadVec2(reader)
	aim := flow.ReadFloat64()
	var action *Action
	if flow.ReadBool() {
		actionValue := ReadAction(reader)
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
func (unit Unit) Write(writer io.Writer) {
	id := unit.Id
	stream.WriteInt32(writer, id)
	playerId := unit.PlayerId
	stream.WriteInt32(writer, playerId)
	health := unit.Health
	stream.WriteFloat64(writer, health)
	shield := unit.Shield
	stream.WriteFloat64(writer, shield)
	extraLives := unit.ExtraLives
	stream.WriteInt32(writer, extraLives)
	position := unit.Position
	position.Write(writer)
	remainingSpawnTime := unit.RemainingSpawnTime
	if remainingSpawnTime == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		remainingSpawnTimeValue := *remainingSpawnTime
		stream.WriteFloat64(writer, remainingSpawnTimeValue)
	}
	velocity := unit.Velocity
	velocity.Write(writer)
	direction := unit.Direction
	direction.Write(writer)
	aim := unit.Aim
	stream.WriteFloat64(writer, aim)
	action := unit.Action
	if action == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		actionValue := *action
		actionValue.Write(writer)
	}
	healthRegenerationStartTick := unit.HealthRegenerationStartTick
	stream.WriteInt32(writer, healthRegenerationStartTick)
	weapon := unit.Weapon
	if weapon == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		weaponValue := *weapon
		stream.WriteInt32(writer, weaponValue)
	}
	nextShotTick := unit.NextShotTick
	stream.WriteInt32(writer, nextShotTick)
	ammo := unit.Ammo
	stream.WriteInt32(writer, int32(len(ammo)))
	for _, ammoElement := range ammo {
		stream.WriteInt32(writer, ammoElement)
	}
	shieldPotions := unit.ShieldPotions
	stream.WriteInt32(writer, shieldPotions)
}

// Get string representation of Unit
func (unit Unit) String() string {
	stringResult := "{ "
	stringResult += "Id: "
	id := unit.Id
	stringResult += fmt.Sprint(id)
	stringResult += ", "
	stringResult += "PlayerId: "
	playerId := unit.PlayerId
	stringResult += fmt.Sprint(playerId)
	stringResult += ", "
	stringResult += "Health: "
	health := unit.Health
	stringResult += fmt.Sprint(health)
	stringResult += ", "
	stringResult += "Shield: "
	shield := unit.Shield
	stringResult += fmt.Sprint(shield)
	stringResult += ", "
	stringResult += "ExtraLives: "
	extraLives := unit.ExtraLives
	stringResult += fmt.Sprint(extraLives)
	stringResult += ", "
	stringResult += "Position: "
	position := unit.Position
	stringResult += position.String()
	stringResult += ", "
	stringResult += "RemainingSpawnTime: "
	remainingSpawnTime := unit.RemainingSpawnTime
	if remainingSpawnTime == nil {
		stringResult += "nil"
	} else {
		remainingSpawnTimeValue := *remainingSpawnTime
		stringResult += fmt.Sprint(remainingSpawnTimeValue)
	}
	stringResult += ", "
	stringResult += "Velocity: "
	velocity := unit.Velocity
	stringResult += velocity.String()
	stringResult += ", "
	stringResult += "Direction: "
	direction := unit.Direction
	stringResult += direction.String()
	stringResult += ", "
	stringResult += "Aim: "
	aim := unit.Aim
	stringResult += fmt.Sprint(aim)
	stringResult += ", "
	stringResult += "Action: "
	action := unit.Action
	if action == nil {
		stringResult += "nil"
	} else {
		actionValue := *action
		stringResult += actionValue.String()
	}
	stringResult += ", "
	stringResult += "HealthRegenerationStartTick: "
	healthRegenerationStartTick := unit.HealthRegenerationStartTick
	stringResult += fmt.Sprint(healthRegenerationStartTick)
	stringResult += ", "
	stringResult += "Weapon: "
	weapon := unit.Weapon
	if weapon == nil {
		stringResult += "nil"
	} else {
		weaponValue := *weapon
		stringResult += fmt.Sprint(weaponValue)
	}
	stringResult += ", "
	stringResult += "NextShotTick: "
	nextShotTick := unit.NextShotTick
	stringResult += fmt.Sprint(nextShotTick)
	stringResult += ", "
	stringResult += "Ammo: "
	ammo := unit.Ammo
	stringResult += "[ "
	for ammoIndex, ammoElement := range ammo {
		if ammoIndex != 0 {
			stringResult += ", "
		}
		stringResult += fmt.Sprint(ammoElement)
	}
	stringResult += " ]"
	stringResult += ", "
	stringResult += "ShieldPotions: "
	shieldPotions := unit.ShieldPotions
	stringResult += fmt.Sprint(shieldPotions)
	stringResult += " }"
	return stringResult
}
