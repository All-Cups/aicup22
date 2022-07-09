package model

import (
	"fmt"
	"io"

	. "aicup22/stream"
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

func NewUnit(id int32, playerId int32, health float64, shield float64, extraLives int32, position Vec2, remainingSpawnTime *float64, velocity Vec2, direction Vec2, aim float64, action *Action, healthRegenerationStartTick int32, weapon *int32, nextShotTick int32, ammo []int32, shieldPotions int32) Unit {
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
	var id int32
	id = ReadInt32(reader)
	var playerId int32
	playerId = ReadInt32(reader)
	var health float64
	health = ReadFloat64(reader)
	var shield float64
	shield = ReadFloat64(reader)
	var extraLives int32
	extraLives = ReadInt32(reader)
	var position Vec2
	position = ReadVec2(reader)
	var remainingSpawnTime *float64
	if ReadBool(reader) {
		var remainingSpawnTimeValue float64
		remainingSpawnTimeValue = ReadFloat64(reader)
		remainingSpawnTime = &remainingSpawnTimeValue
	} else {
		remainingSpawnTime = nil
	}
	var velocity Vec2
	velocity = ReadVec2(reader)
	var direction Vec2
	direction = ReadVec2(reader)
	var aim float64
	aim = ReadFloat64(reader)
	var action *Action
	if ReadBool(reader) {
		var actionValue Action
		actionValue = ReadAction(reader)
		action = &actionValue
	} else {
		action = nil
	}
	var healthRegenerationStartTick int32
	healthRegenerationStartTick = ReadInt32(reader)
	var weapon *int32
	if ReadBool(reader) {
		var weaponValue int32
		weaponValue = ReadInt32(reader)
		weapon = &weaponValue
	} else {
		weapon = nil
	}
	var nextShotTick int32
	nextShotTick = ReadInt32(reader)
	var ammo []int32
	ammo = make([]int32, ReadInt32(reader))
	for ammoIndex := range ammo {
		var ammoElement int32
		ammoElement = ReadInt32(reader)
		ammo[ammoIndex] = ammoElement
	}
	var shieldPotions int32
	shieldPotions = ReadInt32(reader)
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
	WriteInt32(writer, id)
	playerId := unit.PlayerId
	WriteInt32(writer, playerId)
	health := unit.Health
	WriteFloat64(writer, health)
	shield := unit.Shield
	WriteFloat64(writer, shield)
	extraLives := unit.ExtraLives
	WriteInt32(writer, extraLives)
	position := unit.Position
	position.Write(writer)
	remainingSpawnTime := unit.RemainingSpawnTime
	if remainingSpawnTime == nil {
		WriteBool(writer, false)
	} else {
		WriteBool(writer, true)
		remainingSpawnTimeValue := *remainingSpawnTime
		WriteFloat64(writer, remainingSpawnTimeValue)
	}
	velocity := unit.Velocity
	velocity.Write(writer)
	direction := unit.Direction
	direction.Write(writer)
	aim := unit.Aim
	WriteFloat64(writer, aim)
	action := unit.Action
	if action == nil {
		WriteBool(writer, false)
	} else {
		WriteBool(writer, true)
		actionValue := *action
		actionValue.Write(writer)
	}
	healthRegenerationStartTick := unit.HealthRegenerationStartTick
	WriteInt32(writer, healthRegenerationStartTick)
	weapon := unit.Weapon
	if weapon == nil {
		WriteBool(writer, false)
	} else {
		WriteBool(writer, true)
		weaponValue := *weapon
		WriteInt32(writer, weaponValue)
	}
	nextShotTick := unit.NextShotTick
	WriteInt32(writer, nextShotTick)
	ammo := unit.Ammo
	WriteInt32(writer, int32(len(ammo)))
	for _, ammoElement := range ammo {
		WriteInt32(writer, ammoElement)
	}
	shieldPotions := unit.ShieldPotions
	WriteInt32(writer, shieldPotions)
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
