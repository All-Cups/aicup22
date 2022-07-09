package model

import (
	"fmt"
	"io"

	. "aicup22/stream"
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
	var ticksPerSecond float64
	ticksPerSecond = ReadFloat64(reader)
	var teamSize int32
	teamSize = ReadInt32(reader)
	var initialZoneRadius float64
	initialZoneRadius = ReadFloat64(reader)
	var zoneSpeed float64
	zoneSpeed = ReadFloat64(reader)
	var zoneDamagePerSecond float64
	zoneDamagePerSecond = ReadFloat64(reader)
	var spawnTime float64
	spawnTime = ReadFloat64(reader)
	var spawnCollisionDamagePerSecond float64
	spawnCollisionDamagePerSecond = ReadFloat64(reader)
	var lootingTime float64
	lootingTime = ReadFloat64(reader)
	var botPlayers int32
	botPlayers = ReadInt32(reader)
	var unitRadius float64
	unitRadius = ReadFloat64(reader)
	var unitHealth float64
	unitHealth = ReadFloat64(reader)
	var healthRegenerationPerSecond float64
	healthRegenerationPerSecond = ReadFloat64(reader)
	var healthRegenerationDelay float64
	healthRegenerationDelay = ReadFloat64(reader)
	var maxShield float64
	maxShield = ReadFloat64(reader)
	var spawnShield float64
	spawnShield = ReadFloat64(reader)
	var extraLives int32
	extraLives = ReadInt32(reader)
	var lastRespawnZoneRadius float64
	lastRespawnZoneRadius = ReadFloat64(reader)
	var fieldOfView float64
	fieldOfView = ReadFloat64(reader)
	var viewDistance float64
	viewDistance = ReadFloat64(reader)
	var viewBlocking bool
	viewBlocking = ReadBool(reader)
	var rotationSpeed float64
	rotationSpeed = ReadFloat64(reader)
	var spawnMovementSpeed float64
	spawnMovementSpeed = ReadFloat64(reader)
	var maxUnitForwardSpeed float64
	maxUnitForwardSpeed = ReadFloat64(reader)
	var maxUnitBackwardSpeed float64
	maxUnitBackwardSpeed = ReadFloat64(reader)
	var unitAcceleration float64
	unitAcceleration = ReadFloat64(reader)
	var friendlyFire bool
	friendlyFire = ReadBool(reader)
	var killScore float64
	killScore = ReadFloat64(reader)
	var damageScoreMultiplier float64
	damageScoreMultiplier = ReadFloat64(reader)
	var scorePerPlace float64
	scorePerPlace = ReadFloat64(reader)
	var weapons []WeaponProperties
	weapons = make([]WeaponProperties, ReadInt32(reader))
	for weaponsIndex := range weapons {
		var weaponsElement WeaponProperties
		weaponsElement = ReadWeaponProperties(reader)
		weapons[weaponsIndex] = weaponsElement
	}
	var startingWeapon *int32
	if ReadBool(reader) {
		var startingWeaponValue int32
		startingWeaponValue = ReadInt32(reader)
		startingWeapon = &startingWeaponValue
	} else {
		startingWeapon = nil
	}
	var startingWeaponAmmo int32
	startingWeaponAmmo = ReadInt32(reader)
	var maxShieldPotionsInInventory int32
	maxShieldPotionsInInventory = ReadInt32(reader)
	var shieldPerPotion float64
	shieldPerPotion = ReadFloat64(reader)
	var shieldPotionUseTime float64
	shieldPotionUseTime = ReadFloat64(reader)
	var sounds []SoundProperties
	sounds = make([]SoundProperties, ReadInt32(reader))
	for soundsIndex := range sounds {
		var soundsElement SoundProperties
		soundsElement = ReadSoundProperties(reader)
		sounds[soundsIndex] = soundsElement
	}
	var stepsSoundTypeIndex *int32
	if ReadBool(reader) {
		var stepsSoundTypeIndexValue int32
		stepsSoundTypeIndexValue = ReadInt32(reader)
		stepsSoundTypeIndex = &stepsSoundTypeIndexValue
	} else {
		stepsSoundTypeIndex = nil
	}
	var stepsSoundTravelDistance float64
	stepsSoundTravelDistance = ReadFloat64(reader)
	var obstacles []Obstacle
	obstacles = make([]Obstacle, ReadInt32(reader))
	for obstaclesIndex := range obstacles {
		var obstaclesElement Obstacle
		obstaclesElement = ReadObstacle(reader)
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
	WriteFloat64(writer, ticksPerSecond)
	teamSize := constants.TeamSize
	WriteInt32(writer, teamSize)
	initialZoneRadius := constants.InitialZoneRadius
	WriteFloat64(writer, initialZoneRadius)
	zoneSpeed := constants.ZoneSpeed
	WriteFloat64(writer, zoneSpeed)
	zoneDamagePerSecond := constants.ZoneDamagePerSecond
	WriteFloat64(writer, zoneDamagePerSecond)
	spawnTime := constants.SpawnTime
	WriteFloat64(writer, spawnTime)
	spawnCollisionDamagePerSecond := constants.SpawnCollisionDamagePerSecond
	WriteFloat64(writer, spawnCollisionDamagePerSecond)
	lootingTime := constants.LootingTime
	WriteFloat64(writer, lootingTime)
	botPlayers := constants.BotPlayers
	WriteInt32(writer, botPlayers)
	unitRadius := constants.UnitRadius
	WriteFloat64(writer, unitRadius)
	unitHealth := constants.UnitHealth
	WriteFloat64(writer, unitHealth)
	healthRegenerationPerSecond := constants.HealthRegenerationPerSecond
	WriteFloat64(writer, healthRegenerationPerSecond)
	healthRegenerationDelay := constants.HealthRegenerationDelay
	WriteFloat64(writer, healthRegenerationDelay)
	maxShield := constants.MaxShield
	WriteFloat64(writer, maxShield)
	spawnShield := constants.SpawnShield
	WriteFloat64(writer, spawnShield)
	extraLives := constants.ExtraLives
	WriteInt32(writer, extraLives)
	lastRespawnZoneRadius := constants.LastRespawnZoneRadius
	WriteFloat64(writer, lastRespawnZoneRadius)
	fieldOfView := constants.FieldOfView
	WriteFloat64(writer, fieldOfView)
	viewDistance := constants.ViewDistance
	WriteFloat64(writer, viewDistance)
	viewBlocking := constants.ViewBlocking
	WriteBool(writer, viewBlocking)
	rotationSpeed := constants.RotationSpeed
	WriteFloat64(writer, rotationSpeed)
	spawnMovementSpeed := constants.SpawnMovementSpeed
	WriteFloat64(writer, spawnMovementSpeed)
	maxUnitForwardSpeed := constants.MaxUnitForwardSpeed
	WriteFloat64(writer, maxUnitForwardSpeed)
	maxUnitBackwardSpeed := constants.MaxUnitBackwardSpeed
	WriteFloat64(writer, maxUnitBackwardSpeed)
	unitAcceleration := constants.UnitAcceleration
	WriteFloat64(writer, unitAcceleration)
	friendlyFire := constants.FriendlyFire
	WriteBool(writer, friendlyFire)
	killScore := constants.KillScore
	WriteFloat64(writer, killScore)
	damageScoreMultiplier := constants.DamageScoreMultiplier
	WriteFloat64(writer, damageScoreMultiplier)
	scorePerPlace := constants.ScorePerPlace
	WriteFloat64(writer, scorePerPlace)
	weapons := constants.Weapons
	WriteInt32(writer, int32(len(weapons)))
	for _, weaponsElement := range weapons {
		weaponsElement.Write(writer)
	}
	startingWeapon := constants.StartingWeapon
	if startingWeapon == nil {
		WriteBool(writer, false)
	} else {
		WriteBool(writer, true)
		startingWeaponValue := *startingWeapon
		WriteInt32(writer, startingWeaponValue)
	}
	startingWeaponAmmo := constants.StartingWeaponAmmo
	WriteInt32(writer, startingWeaponAmmo)
	maxShieldPotionsInInventory := constants.MaxShieldPotionsInInventory
	WriteInt32(writer, maxShieldPotionsInInventory)
	shieldPerPotion := constants.ShieldPerPotion
	WriteFloat64(writer, shieldPerPotion)
	shieldPotionUseTime := constants.ShieldPotionUseTime
	WriteFloat64(writer, shieldPotionUseTime)
	sounds := constants.Sounds
	WriteInt32(writer, int32(len(sounds)))
	for _, soundsElement := range sounds {
		soundsElement.Write(writer)
	}
	stepsSoundTypeIndex := constants.StepsSoundTypeIndex
	if stepsSoundTypeIndex == nil {
		WriteBool(writer, false)
	} else {
		WriteBool(writer, true)
		stepsSoundTypeIndexValue := *stepsSoundTypeIndex
		WriteInt32(writer, stepsSoundTypeIndexValue)
	}
	stepsSoundTravelDistance := constants.StepsSoundTravelDistance
	WriteFloat64(writer, stepsSoundTravelDistance)
	obstacles := constants.Obstacles
	WriteInt32(writer, int32(len(obstacles)))
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
