package model

import (
	"fmt"

	"aicup22/pkg/stream"
)

// Non changing game state
type Constants struct {
	// Number of ticks per game second
	TicksPerSecond float64
	// Starting number of units in each team
	TeamSize int32
	// Initial zone radius
	InitialZoneRadius float64
	// Speed of zone radius
	ZoneSpeed float64
	// Damage dealt to units outside of the zone per second
	ZoneDamagePerSecond float64
	// Unit spawning time
	SpawnTime float64
	// Damage dealt to units trying to spawn in incorrect position per second
	SpawnCollisionDamagePerSecond float64
	// Time required to perform looting actions (in seconds)
	LootingTime float64
	// Number of bot players (teams)
	BotPlayers int32
	// Units' radius
	UnitRadius float64
	// Max units' health
	UnitHealth float64
	// Health automatically restored per second
	HealthRegenerationPerSecond float64
	// Time until automatic health regeneration since last health damage (in seconds)
	HealthRegenerationDelay float64
	// Max value of unit's shield
	MaxShield float64
	// Initial value of unit's shield
	SpawnShield float64
	// Initial number of extra lives for units
	ExtraLives int32
	// Zone radius after which respawning is disabled
	LastRespawnZoneRadius float64
	// Units' field of view without aiming (in degrees)
	FieldOfView float64
	// Units' view distance
	ViewDistance float64
	// Whether units' view is blocked by obstacles
	ViewBlocking bool
	// Unit rotation speed without aiming (degrees per second)
	RotationSpeed float64
	// Units' movement speed while spawning
	SpawnMovementSpeed float64
	// Max unit speed when walking forward
	MaxUnitForwardSpeed float64
	// Max unit speed when walking backward
	MaxUnitBackwardSpeed float64
	// Max unit acceleration
	UnitAcceleration float64
	// Whether a unit can damage units of the same team
	FriendlyFire bool
	// Score given for killing enemy unit
	KillScore float64
	// Score multiplier for damaging enemy units
	DamageScoreMultiplier float64
	// Score given for every team killed before you
	ScorePerPlace float64
	// List of properties of every weapon type
	Weapons []WeaponProperties
	// Starting weapon with which units spawn, or None
	StartingWeapon *int32
	// Ammo for starting weapon given when unit spawns
	StartingWeaponAmmo int32
	// Max number of shield potions in unit's inventory
	MaxShieldPotionsInInventory int32
	// Amount of shield restored using one potion
	ShieldPerPotion float64
	// Time required to perform action of using shield potion
	ShieldPotionUseTime float64
	// List of properties of every sound type
	Sounds []SoundProperties
	// Sound type index when moving (starting with 0), or None
	StepsSoundTypeIndex *int32
	// Distance when steps sound will be 100% probability
	StepsSoundTravelDistance float64
	// List of obstacles on the map
	Obstacles []Obstacle
}

var (
	flow *stream.Stream
)

func NewConstants(ticksPerSecond float64, teamSize int32, initialZoneRadius float64, zoneSpeed float64, zoneDamagePerSecond float64, spawnTime float64, spawnCollisionDamagePerSecond float64, lootingTime float64, botPlayers int32, unitRadius float64, unitHealth float64, healthRegenerationPerSecond float64, healthRegenerationDelay float64, maxShield float64, spawnShield float64, extraLives int32, lastRespawnZoneRadius float64, fieldOfView float64, viewDistance float64, viewBlocking bool, rotationSpeed float64, spawnMovementSpeed float64, maxUnitForwardSpeed float64, maxUnitBackwardSpeed float64, unitAcceleration float64, friendlyFire bool, killScore float64, damageScoreMultiplier float64, scorePerPlace float64, weapons []WeaponProperties, startingWeapon *int32, startingWeaponAmmo int32, maxShieldPotionsInInventory int32, shieldPerPotion float64, shieldPotionUseTime float64, sounds []SoundProperties, stepsSoundTypeIndex *int32, stepsSoundTravelDistance float64, obstacles []Obstacle) Constants {
	if flow == nil {
		flow = stream.Flow()
	}
	return Constants{
		TicksPerSecond:                ticksPerSecond,
		TeamSize:                      teamSize,
		InitialZoneRadius:             initialZoneRadius,
		ZoneSpeed:                     zoneSpeed,
		ZoneDamagePerSecond:           zoneDamagePerSecond,
		SpawnTime:                     spawnTime,
		SpawnCollisionDamagePerSecond: spawnCollisionDamagePerSecond,
		LootingTime:                   lootingTime,
		BotPlayers:                    botPlayers,
		UnitRadius:                    unitRadius,
		UnitHealth:                    unitHealth,
		HealthRegenerationPerSecond:   healthRegenerationPerSecond,
		HealthRegenerationDelay:       healthRegenerationDelay,
		MaxShield:                     maxShield,
		SpawnShield:                   spawnShield,
		ExtraLives:                    extraLives,
		LastRespawnZoneRadius:         lastRespawnZoneRadius,
		FieldOfView:                   fieldOfView,
		ViewDistance:                  viewDistance,
		ViewBlocking:                  viewBlocking,
		RotationSpeed:                 rotationSpeed,
		SpawnMovementSpeed:            spawnMovementSpeed,
		MaxUnitForwardSpeed:           maxUnitForwardSpeed,
		MaxUnitBackwardSpeed:          maxUnitBackwardSpeed,
		UnitAcceleration:              unitAcceleration,
		FriendlyFire:                  friendlyFire,
		KillScore:                     killScore,
		DamageScoreMultiplier:         damageScoreMultiplier,
		ScorePerPlace:                 scorePerPlace,
		Weapons:                       weapons,
		StartingWeapon:                startingWeapon,
		StartingWeaponAmmo:            startingWeaponAmmo,
		MaxShieldPotionsInInventory:   maxShieldPotionsInInventory,
		ShieldPerPotion:               shieldPerPotion,
		ShieldPotionUseTime:           shieldPotionUseTime,
		Sounds:                        sounds,
		StepsSoundTypeIndex:           stepsSoundTypeIndex,
		StepsSoundTravelDistance:      stepsSoundTravelDistance,
		Obstacles:                     obstacles,
	}
}

// Read Constants from reader
func ReadConstants() Constants {
	ticksPerSecond := flow.ReadFloat64()
	teamSize := flow.ReadInt32()
	initialZoneRadius := flow.ReadFloat64()
	zoneSpeed := flow.ReadFloat64()
	zoneDamagePerSecond := flow.ReadFloat64()
	spawnTime := flow.ReadFloat64()
	spawnCollisionDamagePerSecond := flow.ReadFloat64()
	lootingTime := flow.ReadFloat64()
	botPlayers := flow.ReadInt32()
	unitRadius := flow.ReadFloat64()
	unitHealth := flow.ReadFloat64()
	healthRegenerationPerSecond := flow.ReadFloat64()
	healthRegenerationDelay := flow.ReadFloat64()
	maxShield := flow.ReadFloat64()
	spawnShield := flow.ReadFloat64()
	extraLives := flow.ReadInt32()
	lastRespawnZoneRadius := flow.ReadFloat64()
	fieldOfView := flow.ReadFloat64()
	viewDistance := flow.ReadFloat64()
	viewBlocking := flow.ReadBool()
	rotationSpeed := flow.ReadFloat64()
	spawnMovementSpeed := flow.ReadFloat64()
	maxUnitForwardSpeed := flow.ReadFloat64()
	maxUnitBackwardSpeed := flow.ReadFloat64()
	unitAcceleration := flow.ReadFloat64()
	friendlyFire := flow.ReadBool()
	killScore := flow.ReadFloat64()
	damageScoreMultiplier := flow.ReadFloat64()
	scorePerPlace := flow.ReadFloat64()
	weapons := make([]WeaponProperties, flow.ReadInt32())
	for weaponsIndex := range weapons {
		weaponsElement := ReadWeaponProperties()
		weapons[weaponsIndex] = weaponsElement
	}
	var startingWeapon *int32
	if flow.ReadBool() {
		startingWeaponValue := flow.ReadInt32()
		startingWeapon = &startingWeaponValue
	} else {
		startingWeapon = nil
	}
	startingWeaponAmmo := flow.ReadInt32()
	maxShieldPotionsInInventory := flow.ReadInt32()
	shieldPerPotion := flow.ReadFloat64()
	shieldPotionUseTime := flow.ReadFloat64()
	sounds := make([]SoundProperties, flow.ReadInt32())
	for soundsIndex := range sounds {
		soundsElement := ReadSoundProperties()
		sounds[soundsIndex] = soundsElement
	}
	var stepsSoundTypeIndex *int32
	if flow.ReadBool() {
		stepsSoundTypeIndexValue := flow.ReadInt32()
		stepsSoundTypeIndex = &stepsSoundTypeIndexValue
	} else {
		stepsSoundTypeIndex = nil
	}
	stepsSoundTravelDistance := flow.ReadFloat64()
	obstacles := make([]Obstacle, flow.ReadInt32())
	for obstaclesIndex := range obstacles {
		obstaclesElement := ReadObstacle()
		obstacles[obstaclesIndex] = obstaclesElement
	}
	return Constants{
		TicksPerSecond:                ticksPerSecond,
		TeamSize:                      teamSize,
		InitialZoneRadius:             initialZoneRadius,
		ZoneSpeed:                     zoneSpeed,
		ZoneDamagePerSecond:           zoneDamagePerSecond,
		SpawnTime:                     spawnTime,
		SpawnCollisionDamagePerSecond: spawnCollisionDamagePerSecond,
		LootingTime:                   lootingTime,
		BotPlayers:                    botPlayers,
		UnitRadius:                    unitRadius,
		UnitHealth:                    unitHealth,
		HealthRegenerationPerSecond:   healthRegenerationPerSecond,
		HealthRegenerationDelay:       healthRegenerationDelay,
		MaxShield:                     maxShield,
		SpawnShield:                   spawnShield,
		ExtraLives:                    extraLives,
		LastRespawnZoneRadius:         lastRespawnZoneRadius,
		FieldOfView:                   fieldOfView,
		ViewDistance:                  viewDistance,
		ViewBlocking:                  viewBlocking,
		RotationSpeed:                 rotationSpeed,
		SpawnMovementSpeed:            spawnMovementSpeed,
		MaxUnitForwardSpeed:           maxUnitForwardSpeed,
		MaxUnitBackwardSpeed:          maxUnitBackwardSpeed,
		UnitAcceleration:              unitAcceleration,
		FriendlyFire:                  friendlyFire,
		KillScore:                     killScore,
		DamageScoreMultiplier:         damageScoreMultiplier,
		ScorePerPlace:                 scorePerPlace,
		Weapons:                       weapons,
		StartingWeapon:                startingWeapon,
		StartingWeaponAmmo:            startingWeaponAmmo,
		MaxShieldPotionsInInventory:   maxShieldPotionsInInventory,
		ShieldPerPotion:               shieldPerPotion,
		ShieldPotionUseTime:           shieldPotionUseTime,
		Sounds:                        sounds,
		StepsSoundTypeIndex:           stepsSoundTypeIndex,
		StepsSoundTravelDistance:      stepsSoundTravelDistance,
		Obstacles:                     obstacles,
	}
}

// Write Constants to writer
func (constants Constants) Write() {
	ticksPerSecond := constants.TicksPerSecond
	flow.WriteFloat64(ticksPerSecond)
	teamSize := constants.TeamSize
	flow.WriteInt32(teamSize)
	initialZoneRadius := constants.InitialZoneRadius
	flow.WriteFloat64(initialZoneRadius)
	zoneSpeed := constants.ZoneSpeed
	flow.WriteFloat64(zoneSpeed)
	zoneDamagePerSecond := constants.ZoneDamagePerSecond
	flow.WriteFloat64(zoneDamagePerSecond)
	spawnTime := constants.SpawnTime
	flow.WriteFloat64(spawnTime)
	spawnCollisionDamagePerSecond := constants.SpawnCollisionDamagePerSecond
	flow.WriteFloat64(spawnCollisionDamagePerSecond)
	lootingTime := constants.LootingTime
	flow.WriteFloat64(lootingTime)
	botPlayers := constants.BotPlayers
	flow.WriteInt32(botPlayers)
	unitRadius := constants.UnitRadius
	flow.WriteFloat64(unitRadius)
	unitHealth := constants.UnitHealth
	flow.WriteFloat64(unitHealth)
	healthRegenerationPerSecond := constants.HealthRegenerationPerSecond
	flow.WriteFloat64(healthRegenerationPerSecond)
	healthRegenerationDelay := constants.HealthRegenerationDelay
	flow.WriteFloat64(healthRegenerationDelay)
	maxShield := constants.MaxShield
	flow.WriteFloat64(maxShield)
	spawnShield := constants.SpawnShield
	flow.WriteFloat64(spawnShield)
	extraLives := constants.ExtraLives
	flow.WriteInt32(extraLives)
	lastRespawnZoneRadius := constants.LastRespawnZoneRadius
	flow.WriteFloat64(lastRespawnZoneRadius)
	fieldOfView := constants.FieldOfView
	flow.WriteFloat64(fieldOfView)
	viewDistance := constants.ViewDistance
	flow.WriteFloat64(viewDistance)
	viewBlocking := constants.ViewBlocking
	flow.WriteBool(viewBlocking)
	rotationSpeed := constants.RotationSpeed
	flow.WriteFloat64(rotationSpeed)
	spawnMovementSpeed := constants.SpawnMovementSpeed
	flow.WriteFloat64(spawnMovementSpeed)
	maxUnitForwardSpeed := constants.MaxUnitForwardSpeed
	flow.WriteFloat64(maxUnitForwardSpeed)
	maxUnitBackwardSpeed := constants.MaxUnitBackwardSpeed
	flow.WriteFloat64(maxUnitBackwardSpeed)
	unitAcceleration := constants.UnitAcceleration
	flow.WriteFloat64(unitAcceleration)
	friendlyFire := constants.FriendlyFire
	flow.WriteBool(friendlyFire)
	killScore := constants.KillScore
	flow.WriteFloat64(killScore)
	damageScoreMultiplier := constants.DamageScoreMultiplier
	flow.WriteFloat64(damageScoreMultiplier)
	scorePerPlace := constants.ScorePerPlace
	flow.WriteFloat64(scorePerPlace)
	weapons := constants.Weapons
	flow.WriteInt32(int32(len(weapons)))
	for _, weaponsElement := range weapons {
		weaponsElement.Write()
	}
	startingWeapon := constants.StartingWeapon
	if startingWeapon == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		startingWeaponValue := *startingWeapon
		flow.WriteInt32(startingWeaponValue)
	}
	startingWeaponAmmo := constants.StartingWeaponAmmo
	flow.WriteInt32(startingWeaponAmmo)
	maxShieldPotionsInInventory := constants.MaxShieldPotionsInInventory
	flow.WriteInt32(maxShieldPotionsInInventory)
	shieldPerPotion := constants.ShieldPerPotion
	flow.WriteFloat64(shieldPerPotion)
	shieldPotionUseTime := constants.ShieldPotionUseTime
	flow.WriteFloat64(shieldPotionUseTime)
	sounds := constants.Sounds
	flow.WriteInt32(int32(len(sounds)))
	for _, soundsElement := range sounds {
		soundsElement.Write()
	}
	stepsSoundTypeIndex := constants.StepsSoundTypeIndex
	if stepsSoundTypeIndex == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		stepsSoundTypeIndexValue := *stepsSoundTypeIndex
		flow.WriteInt32(stepsSoundTypeIndexValue)
	}
	stepsSoundTravelDistance := constants.StepsSoundTravelDistance
	flow.WriteFloat64(stepsSoundTravelDistance)
	obstacles := constants.Obstacles
	flow.WriteInt32(int32(len(obstacles)))
	for _, obstaclesElement := range obstacles {
		obstaclesElement.Write()
	}
}

// Get string representation of Constants
func (constants Constants) String() string {
	stringResult := "{ "
	stringResult += "TicksPerSecond: "
	ticksPerSecond := constants.TicksPerSecond
	stringResult += fmt.Sprint(ticksPerSecond)
	stringResult += ", "
	stringResult += "TeamSize: "
	teamSize := constants.TeamSize
	stringResult += fmt.Sprint(teamSize)
	stringResult += ", "
	stringResult += "InitialZoneRadius: "
	initialZoneRadius := constants.InitialZoneRadius
	stringResult += fmt.Sprint(initialZoneRadius)
	stringResult += ", "
	stringResult += "ZoneSpeed: "
	zoneSpeed := constants.ZoneSpeed
	stringResult += fmt.Sprint(zoneSpeed)
	stringResult += ", "
	stringResult += "ZoneDamagePerSecond: "
	zoneDamagePerSecond := constants.ZoneDamagePerSecond
	stringResult += fmt.Sprint(zoneDamagePerSecond)
	stringResult += ", "
	stringResult += "SpawnTime: "
	spawnTime := constants.SpawnTime
	stringResult += fmt.Sprint(spawnTime)
	stringResult += ", "
	stringResult += "SpawnCollisionDamagePerSecond: "
	spawnCollisionDamagePerSecond := constants.SpawnCollisionDamagePerSecond
	stringResult += fmt.Sprint(spawnCollisionDamagePerSecond)
	stringResult += ", "
	stringResult += "LootingTime: "
	lootingTime := constants.LootingTime
	stringResult += fmt.Sprint(lootingTime)
	stringResult += ", "
	stringResult += "BotPlayers: "
	botPlayers := constants.BotPlayers
	stringResult += fmt.Sprint(botPlayers)
	stringResult += ", "
	stringResult += "UnitRadius: "
	unitRadius := constants.UnitRadius
	stringResult += fmt.Sprint(unitRadius)
	stringResult += ", "
	stringResult += "UnitHealth: "
	unitHealth := constants.UnitHealth
	stringResult += fmt.Sprint(unitHealth)
	stringResult += ", "
	stringResult += "HealthRegenerationPerSecond: "
	healthRegenerationPerSecond := constants.HealthRegenerationPerSecond
	stringResult += fmt.Sprint(healthRegenerationPerSecond)
	stringResult += ", "
	stringResult += "HealthRegenerationDelay: "
	healthRegenerationDelay := constants.HealthRegenerationDelay
	stringResult += fmt.Sprint(healthRegenerationDelay)
	stringResult += ", "
	stringResult += "MaxShield: "
	maxShield := constants.MaxShield
	stringResult += fmt.Sprint(maxShield)
	stringResult += ", "
	stringResult += "SpawnShield: "
	spawnShield := constants.SpawnShield
	stringResult += fmt.Sprint(spawnShield)
	stringResult += ", "
	stringResult += "ExtraLives: "
	extraLives := constants.ExtraLives
	stringResult += fmt.Sprint(extraLives)
	stringResult += ", "
	stringResult += "LastRespawnZoneRadius: "
	lastRespawnZoneRadius := constants.LastRespawnZoneRadius
	stringResult += fmt.Sprint(lastRespawnZoneRadius)
	stringResult += ", "
	stringResult += "FieldOfView: "
	fieldOfView := constants.FieldOfView
	stringResult += fmt.Sprint(fieldOfView)
	stringResult += ", "
	stringResult += "ViewDistance: "
	viewDistance := constants.ViewDistance
	stringResult += fmt.Sprint(viewDistance)
	stringResult += ", "
	stringResult += "ViewBlocking: "
	viewBlocking := constants.ViewBlocking
	stringResult += fmt.Sprint(viewBlocking)
	stringResult += ", "
	stringResult += "RotationSpeed: "
	rotationSpeed := constants.RotationSpeed
	stringResult += fmt.Sprint(rotationSpeed)
	stringResult += ", "
	stringResult += "SpawnMovementSpeed: "
	spawnMovementSpeed := constants.SpawnMovementSpeed
	stringResult += fmt.Sprint(spawnMovementSpeed)
	stringResult += ", "
	stringResult += "MaxUnitForwardSpeed: "
	maxUnitForwardSpeed := constants.MaxUnitForwardSpeed
	stringResult += fmt.Sprint(maxUnitForwardSpeed)
	stringResult += ", "
	stringResult += "MaxUnitBackwardSpeed: "
	maxUnitBackwardSpeed := constants.MaxUnitBackwardSpeed
	stringResult += fmt.Sprint(maxUnitBackwardSpeed)
	stringResult += ", "
	stringResult += "UnitAcceleration: "
	unitAcceleration := constants.UnitAcceleration
	stringResult += fmt.Sprint(unitAcceleration)
	stringResult += ", "
	stringResult += "FriendlyFire: "
	friendlyFire := constants.FriendlyFire
	stringResult += fmt.Sprint(friendlyFire)
	stringResult += ", "
	stringResult += "KillScore: "
	killScore := constants.KillScore
	stringResult += fmt.Sprint(killScore)
	stringResult += ", "
	stringResult += "DamageScoreMultiplier: "
	damageScoreMultiplier := constants.DamageScoreMultiplier
	stringResult += fmt.Sprint(damageScoreMultiplier)
	stringResult += ", "
	stringResult += "ScorePerPlace: "
	scorePerPlace := constants.ScorePerPlace
	stringResult += fmt.Sprint(scorePerPlace)
	stringResult += ", "
	stringResult += "Weapons: "
	weapons := constants.Weapons
	stringResult += "[ "
	for weaponsIndex, weaponsElement := range weapons {
		if weaponsIndex != 0 {
			stringResult += ", "
		}
		stringResult += weaponsElement.String()
	}
	stringResult += " ]"
	stringResult += ", "
	stringResult += "StartingWeapon: "
	startingWeapon := constants.StartingWeapon
	if startingWeapon == nil {
		stringResult += "nil"
	} else {
		startingWeaponValue := *startingWeapon
		stringResult += fmt.Sprint(startingWeaponValue)
	}
	stringResult += ", "
	stringResult += "StartingWeaponAmmo: "
	startingWeaponAmmo := constants.StartingWeaponAmmo
	stringResult += fmt.Sprint(startingWeaponAmmo)
	stringResult += ", "
	stringResult += "MaxShieldPotionsInInventory: "
	maxShieldPotionsInInventory := constants.MaxShieldPotionsInInventory
	stringResult += fmt.Sprint(maxShieldPotionsInInventory)
	stringResult += ", "
	stringResult += "ShieldPerPotion: "
	shieldPerPotion := constants.ShieldPerPotion
	stringResult += fmt.Sprint(shieldPerPotion)
	stringResult += ", "
	stringResult += "ShieldPotionUseTime: "
	shieldPotionUseTime := constants.ShieldPotionUseTime
	stringResult += fmt.Sprint(shieldPotionUseTime)
	stringResult += ", "
	stringResult += "Sounds: "
	sounds := constants.Sounds
	stringResult += "[ "
	for soundsIndex, soundsElement := range sounds {
		if soundsIndex != 0 {
			stringResult += ", "
		}
		stringResult += soundsElement.String()
	}
	stringResult += " ]"
	stringResult += ", "
	stringResult += "StepsSoundTypeIndex: "
	stepsSoundTypeIndex := constants.StepsSoundTypeIndex
	if stepsSoundTypeIndex == nil {
		stringResult += "nil"
	} else {
		stepsSoundTypeIndexValue := *stepsSoundTypeIndex
		stringResult += fmt.Sprint(stepsSoundTypeIndexValue)
	}
	stringResult += ", "
	stringResult += "StepsSoundTravelDistance: "
	stepsSoundTravelDistance := constants.StepsSoundTravelDistance
	stringResult += fmt.Sprint(stepsSoundTravelDistance)
	stringResult += ", "
	stringResult += "Obstacles: "
	obstacles := constants.Obstacles
	stringResult += "[ "
	for obstaclesIndex, obstaclesElement := range obstacles {
		if obstaclesIndex != 0 {
			stringResult += ", "
		}
		stringResult += obstaclesElement.String()
	}
	stringResult += " ]"
	stringResult += " }"
	return stringResult
}
