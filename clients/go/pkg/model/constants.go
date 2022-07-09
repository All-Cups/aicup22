package model

import (
	"fmt"
	"io"

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

func NewConstants(ticksPerSecond float64, teamSize int32, initialZoneRadius float64, zoneSpeed float64, zoneDamagePerSecond float64, spawnTime float64, spawnCollisionDamagePerSecond float64, lootingTime float64, botPlayers int32, unitRadius float64, unitHealth float64, healthRegenerationPerSecond float64, healthRegenerationDelay float64, maxShield float64, spawnShield float64, extraLives int32, lastRespawnZoneRadius float64, fieldOfView float64, viewDistance float64, viewBlocking bool, rotationSpeed float64, spawnMovementSpeed float64, maxUnitForwardSpeed float64, maxUnitBackwardSpeed float64, unitAcceleration float64, friendlyFire bool, killScore float64, damageScoreMultiplier float64, scorePerPlace float64, weapons []WeaponProperties, startingWeapon *int32, startingWeaponAmmo int32, maxShieldPotionsInInventory int32, shieldPerPotion float64, shieldPotionUseTime float64, sounds []SoundProperties, stepsSoundTypeIndex *int32, stepsSoundTravelDistance float64, obstacles []Obstacle) Constants {
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
func ReadConstants(reader io.Reader) Constants {
	ticksPerSecond := stream.ReadFloat64(reader)
	teamSize := stream.Flow().ReadInt32()
	initialZoneRadius := stream.ReadFloat64(reader)
	zoneSpeed := stream.ReadFloat64(reader)
	zoneDamagePerSecond := stream.ReadFloat64(reader)
	spawnTime := stream.ReadFloat64(reader)
	spawnCollisionDamagePerSecond := stream.ReadFloat64(reader)
	lootingTime := stream.ReadFloat64(reader)
	botPlayers := stream.Flow().ReadInt32()
	unitRadius := stream.ReadFloat64(reader)
	unitHealth := stream.ReadFloat64(reader)
	healthRegenerationPerSecond := stream.ReadFloat64(reader)
	healthRegenerationDelay := stream.ReadFloat64(reader)
	maxShield := stream.ReadFloat64(reader)
	spawnShield := stream.ReadFloat64(reader)
	extraLives := stream.Flow().ReadInt32()
	lastRespawnZoneRadius := stream.ReadFloat64(reader)
	fieldOfView := stream.ReadFloat64(reader)
	viewDistance := stream.ReadFloat64(reader)
	viewBlocking := stream.Flow().ReadBool()
	rotationSpeed := stream.ReadFloat64(reader)
	spawnMovementSpeed := stream.ReadFloat64(reader)
	maxUnitForwardSpeed := stream.ReadFloat64(reader)
	maxUnitBackwardSpeed := stream.ReadFloat64(reader)
	unitAcceleration := stream.ReadFloat64(reader)
	friendlyFire := stream.Flow().ReadBool()
	killScore := stream.ReadFloat64(reader)
	damageScoreMultiplier := stream.ReadFloat64(reader)
	scorePerPlace := stream.ReadFloat64(reader)
	weapons := make([]WeaponProperties, stream.Flow().ReadInt32())
	for weaponsIndex := range weapons {
		weaponsElement := ReadWeaponProperties(reader)
		weapons[weaponsIndex] = weaponsElement
	}
	var startingWeapon *int32
	if stream.Flow().ReadBool() {
		startingWeaponValue := stream.Flow().ReadInt32()
		startingWeapon = &startingWeaponValue
	} else {
		startingWeapon = nil
	}
	startingWeaponAmmo := stream.Flow().ReadInt32()
	maxShieldPotionsInInventory := stream.Flow().ReadInt32()
	shieldPerPotion := stream.ReadFloat64(reader)
	shieldPotionUseTime := stream.ReadFloat64(reader)
	sounds := make([]SoundProperties, stream.Flow().ReadInt32())
	for soundsIndex := range sounds {
		soundsElement := ReadSoundProperties(reader)
		sounds[soundsIndex] = soundsElement
	}
	var stepsSoundTypeIndex *int32
	if stream.Flow().ReadBool() {
		stepsSoundTypeIndexValue := stream.Flow().ReadInt32()
		stepsSoundTypeIndex = &stepsSoundTypeIndexValue
	} else {
		stepsSoundTypeIndex = nil
	}
	stepsSoundTravelDistance := stream.ReadFloat64(reader)
	obstacles := make([]Obstacle, stream.Flow().ReadInt32())
	for obstaclesIndex := range obstacles {
		obstaclesElement := ReadObstacle(reader)
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
func (constants Constants) Write(writer io.Writer) {
	ticksPerSecond := constants.TicksPerSecond
	stream.WriteFloat64(writer, ticksPerSecond)
	teamSize := constants.TeamSize
	stream.WriteInt32(writer, teamSize)
	initialZoneRadius := constants.InitialZoneRadius
	stream.WriteFloat64(writer, initialZoneRadius)
	zoneSpeed := constants.ZoneSpeed
	stream.WriteFloat64(writer, zoneSpeed)
	zoneDamagePerSecond := constants.ZoneDamagePerSecond
	stream.WriteFloat64(writer, zoneDamagePerSecond)
	spawnTime := constants.SpawnTime
	stream.WriteFloat64(writer, spawnTime)
	spawnCollisionDamagePerSecond := constants.SpawnCollisionDamagePerSecond
	stream.WriteFloat64(writer, spawnCollisionDamagePerSecond)
	lootingTime := constants.LootingTime
	stream.WriteFloat64(writer, lootingTime)
	botPlayers := constants.BotPlayers
	stream.WriteInt32(writer, botPlayers)
	unitRadius := constants.UnitRadius
	stream.WriteFloat64(writer, unitRadius)
	unitHealth := constants.UnitHealth
	stream.WriteFloat64(writer, unitHealth)
	healthRegenerationPerSecond := constants.HealthRegenerationPerSecond
	stream.WriteFloat64(writer, healthRegenerationPerSecond)
	healthRegenerationDelay := constants.HealthRegenerationDelay
	stream.WriteFloat64(writer, healthRegenerationDelay)
	maxShield := constants.MaxShield
	stream.WriteFloat64(writer, maxShield)
	spawnShield := constants.SpawnShield
	stream.WriteFloat64(writer, spawnShield)
	extraLives := constants.ExtraLives
	stream.WriteInt32(writer, extraLives)
	lastRespawnZoneRadius := constants.LastRespawnZoneRadius
	stream.WriteFloat64(writer, lastRespawnZoneRadius)
	fieldOfView := constants.FieldOfView
	stream.WriteFloat64(writer, fieldOfView)
	viewDistance := constants.ViewDistance
	stream.WriteFloat64(writer, viewDistance)
	viewBlocking := constants.ViewBlocking
	stream.WriteBool(writer, viewBlocking)
	rotationSpeed := constants.RotationSpeed
	stream.WriteFloat64(writer, rotationSpeed)
	spawnMovementSpeed := constants.SpawnMovementSpeed
	stream.WriteFloat64(writer, spawnMovementSpeed)
	maxUnitForwardSpeed := constants.MaxUnitForwardSpeed
	stream.WriteFloat64(writer, maxUnitForwardSpeed)
	maxUnitBackwardSpeed := constants.MaxUnitBackwardSpeed
	stream.WriteFloat64(writer, maxUnitBackwardSpeed)
	unitAcceleration := constants.UnitAcceleration
	stream.WriteFloat64(writer, unitAcceleration)
	friendlyFire := constants.FriendlyFire
	stream.WriteBool(writer, friendlyFire)
	killScore := constants.KillScore
	stream.WriteFloat64(writer, killScore)
	damageScoreMultiplier := constants.DamageScoreMultiplier
	stream.WriteFloat64(writer, damageScoreMultiplier)
	scorePerPlace := constants.ScorePerPlace
	stream.WriteFloat64(writer, scorePerPlace)
	weapons := constants.Weapons
	stream.WriteInt32(writer, int32(len(weapons)))
	for _, weaponsElement := range weapons {
		weaponsElement.Write(writer)
	}
	startingWeapon := constants.StartingWeapon
	if startingWeapon == nil {
		stream.WriteBool(writer, false)
	} else {
		stream.WriteBool(writer, true)
		startingWeaponValue := *startingWeapon
		stream.WriteInt32(writer, startingWeaponValue)
	}
	startingWeaponAmmo := constants.StartingWeaponAmmo
	stream.WriteInt32(writer, startingWeaponAmmo)
	maxShieldPotionsInInventory := constants.MaxShieldPotionsInInventory
	stream.WriteInt32(writer, maxShieldPotionsInInventory)
	shieldPerPotion := constants.ShieldPerPotion
	stream.WriteFloat64(writer, shieldPerPotion)
	shieldPotionUseTime := constants.ShieldPotionUseTime
	stream.WriteFloat64(writer, shieldPotionUseTime)
	sounds := constants.Sounds
	stream.WriteInt32(writer, int32(len(sounds)))
	for _, soundsElement := range sounds {
		soundsElement.Write(writer)
	}
	stepsSoundTypeIndex := constants.StepsSoundTypeIndex
	if stepsSoundTypeIndex == nil {
		stream.WriteBool(writer, false)
	} else {
		stream.WriteBool(writer, true)
		stepsSoundTypeIndexValue := *stepsSoundTypeIndex
		stream.WriteInt32(writer, stepsSoundTypeIndexValue)
	}
	stepsSoundTravelDistance := constants.StepsSoundTravelDistance
	stream.WriteFloat64(writer, stepsSoundTravelDistance)
	obstacles := constants.Obstacles
	stream.WriteInt32(writer, int32(len(obstacles)))
	for _, obstaclesElement := range obstacles {
		obstaclesElement.Write(writer)
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
