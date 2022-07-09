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

func NewConstants(ticksPerSecond float64, teamSize int32,
	initialZoneRadius, zoneSpeed, zoneDamagePerSecond, spawnTime, spawnCollisionDamagePerSecond, lootingTime float64,
	botPlayers int32,
	unitRadius, unitHealth, healthRegenerationPerSecond, healthRegenerationDelay, maxShield, spawnShield float64,
	extraLives int32,
	lastRespawnZoneRadius, fieldOfView, viewDistance float64,
	viewBlocking bool,
	rotationSpeed, spawnMovementSpeed, maxUnitForwardSpeed, maxUnitBackwardSpeed, unitAcceleration float64,
	friendlyFire bool,
	killScore, damageScoreMultiplier, scorePerPlace float64,
	weapons []WeaponProperties, startingWeapon *int32,
	startingWeaponAmmo, maxShieldPotionsInInventory int32,
	shieldPerPotion, shieldPotionUseTime float64,
	sounds []SoundProperties, stepsSoundTypeIndex *int32, stepsSoundTravelDistance float64, obstacles []Obstacle) Constants {
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
func (sf Constants) Write() {
	ticksPerSecond := sf.TicksPerSecond
	flow.WriteFloat64(ticksPerSecond)
	teamSize := sf.TeamSize
	flow.WriteInt32(teamSize)
	initialZoneRadius := sf.InitialZoneRadius
	flow.WriteFloat64(initialZoneRadius)
	zoneSpeed := sf.ZoneSpeed
	flow.WriteFloat64(zoneSpeed)
	zoneDamagePerSecond := sf.ZoneDamagePerSecond
	flow.WriteFloat64(zoneDamagePerSecond)
	spawnTime := sf.SpawnTime
	flow.WriteFloat64(spawnTime)
	spawnCollisionDamagePerSecond := sf.SpawnCollisionDamagePerSecond
	flow.WriteFloat64(spawnCollisionDamagePerSecond)
	lootingTime := sf.LootingTime
	flow.WriteFloat64(lootingTime)
	botPlayers := sf.BotPlayers
	flow.WriteInt32(botPlayers)
	unitRadius := sf.UnitRadius
	flow.WriteFloat64(unitRadius)
	unitHealth := sf.UnitHealth
	flow.WriteFloat64(unitHealth)
	healthRegenerationPerSecond := sf.HealthRegenerationPerSecond
	flow.WriteFloat64(healthRegenerationPerSecond)
	healthRegenerationDelay := sf.HealthRegenerationDelay
	flow.WriteFloat64(healthRegenerationDelay)
	maxShield := sf.MaxShield
	flow.WriteFloat64(maxShield)
	spawnShield := sf.SpawnShield
	flow.WriteFloat64(spawnShield)
	extraLives := sf.ExtraLives
	flow.WriteInt32(extraLives)
	lastRespawnZoneRadius := sf.LastRespawnZoneRadius
	flow.WriteFloat64(lastRespawnZoneRadius)
	fieldOfView := sf.FieldOfView
	flow.WriteFloat64(fieldOfView)
	viewDistance := sf.ViewDistance
	flow.WriteFloat64(viewDistance)
	viewBlocking := sf.ViewBlocking
	flow.WriteBool(viewBlocking)
	rotationSpeed := sf.RotationSpeed
	flow.WriteFloat64(rotationSpeed)
	spawnMovementSpeed := sf.SpawnMovementSpeed
	flow.WriteFloat64(spawnMovementSpeed)
	maxUnitForwardSpeed := sf.MaxUnitForwardSpeed
	flow.WriteFloat64(maxUnitForwardSpeed)
	maxUnitBackwardSpeed := sf.MaxUnitBackwardSpeed
	flow.WriteFloat64(maxUnitBackwardSpeed)
	unitAcceleration := sf.UnitAcceleration
	flow.WriteFloat64(unitAcceleration)
	friendlyFire := sf.FriendlyFire
	flow.WriteBool(friendlyFire)
	killScore := sf.KillScore
	flow.WriteFloat64(killScore)
	damageScoreMultiplier := sf.DamageScoreMultiplier
	flow.WriteFloat64(damageScoreMultiplier)
	scorePerPlace := sf.ScorePerPlace
	flow.WriteFloat64(scorePerPlace)
	weapons := sf.Weapons
	flow.WriteInt32(int32(len(weapons)))
	for _, weaponsElement := range weapons {
		weaponsElement.Write()
	}
	startingWeapon := sf.StartingWeapon
	if startingWeapon == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		startingWeaponValue := *startingWeapon
		flow.WriteInt32(startingWeaponValue)
	}
	startingWeaponAmmo := sf.StartingWeaponAmmo
	flow.WriteInt32(startingWeaponAmmo)
	maxShieldPotionsInInventory := sf.MaxShieldPotionsInInventory
	flow.WriteInt32(maxShieldPotionsInInventory)
	shieldPerPotion := sf.ShieldPerPotion
	flow.WriteFloat64(shieldPerPotion)
	shieldPotionUseTime := sf.ShieldPotionUseTime
	flow.WriteFloat64(shieldPotionUseTime)
	sounds := sf.Sounds
	flow.WriteInt32(int32(len(sounds)))
	for _, soundsElement := range sounds {
		soundsElement.Write()
	}
	stepsSoundTypeIndex := sf.StepsSoundTypeIndex
	if stepsSoundTypeIndex == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		stepsSoundTypeIndexValue := *stepsSoundTypeIndex
		flow.WriteInt32(stepsSoundTypeIndexValue)
	}
	stepsSoundTravelDistance := sf.StepsSoundTravelDistance
	flow.WriteFloat64(stepsSoundTravelDistance)
	obstacles := sf.Obstacles
	flow.WriteInt32(int32(len(obstacles)))
	for _, obstaclesElement := range obstacles {
		obstaclesElement.Write()
	}
}

// Get string representation of Constants
func (sf Constants) String() string {
	strRes := "{ "
	strRes += "TicksPerSecond: "
	ticksPerSecond := sf.TicksPerSecond
	strRes += fmt.Sprint(ticksPerSecond)
	strRes += ", "
	strRes += "TeamSize: "
	teamSize := sf.TeamSize
	strRes += fmt.Sprint(teamSize)
	strRes += ", "
	strRes += "InitialZoneRadius: "
	initialZoneRadius := sf.InitialZoneRadius
	strRes += fmt.Sprint(initialZoneRadius)
	strRes += ", "
	strRes += "ZoneSpeed: "
	zoneSpeed := sf.ZoneSpeed
	strRes += fmt.Sprint(zoneSpeed)
	strRes += ", "
	strRes += "ZoneDamagePerSecond: "
	zoneDamagePerSecond := sf.ZoneDamagePerSecond
	strRes += fmt.Sprint(zoneDamagePerSecond)
	strRes += ", "
	strRes += "SpawnTime: "
	spawnTime := sf.SpawnTime
	strRes += fmt.Sprint(spawnTime)
	strRes += ", "
	strRes += "SpawnCollisionDamagePerSecond: "
	spawnCollisionDamagePerSecond := sf.SpawnCollisionDamagePerSecond
	strRes += fmt.Sprint(spawnCollisionDamagePerSecond)
	strRes += ", "
	strRes += "LootingTime: "
	lootingTime := sf.LootingTime
	strRes += fmt.Sprint(lootingTime)
	strRes += ", "
	strRes += "BotPlayers: "
	botPlayers := sf.BotPlayers
	strRes += fmt.Sprint(botPlayers)
	strRes += ", "
	strRes += "UnitRadius: "
	unitRadius := sf.UnitRadius
	strRes += fmt.Sprint(unitRadius)
	strRes += ", "
	strRes += "UnitHealth: "
	unitHealth := sf.UnitHealth
	strRes += fmt.Sprint(unitHealth)
	strRes += ", "
	strRes += "HealthRegenerationPerSecond: "
	healthRegenerationPerSecond := sf.HealthRegenerationPerSecond
	strRes += fmt.Sprint(healthRegenerationPerSecond)
	strRes += ", "
	strRes += "HealthRegenerationDelay: "
	healthRegenerationDelay := sf.HealthRegenerationDelay
	strRes += fmt.Sprint(healthRegenerationDelay)
	strRes += ", "
	strRes += "MaxShield: "
	maxShield := sf.MaxShield
	strRes += fmt.Sprint(maxShield)
	strRes += ", "
	strRes += "SpawnShield: "
	spawnShield := sf.SpawnShield
	strRes += fmt.Sprint(spawnShield)
	strRes += ", "
	strRes += "ExtraLives: "
	extraLives := sf.ExtraLives
	strRes += fmt.Sprint(extraLives)
	strRes += ", "
	strRes += "LastRespawnZoneRadius: "
	lastRespawnZoneRadius := sf.LastRespawnZoneRadius
	strRes += fmt.Sprint(lastRespawnZoneRadius)
	strRes += ", "
	strRes += "FieldOfView: "
	fieldOfView := sf.FieldOfView
	strRes += fmt.Sprint(fieldOfView)
	strRes += ", "
	strRes += "ViewDistance: "
	viewDistance := sf.ViewDistance
	strRes += fmt.Sprint(viewDistance)
	strRes += ", "
	strRes += "ViewBlocking: "
	viewBlocking := sf.ViewBlocking
	strRes += fmt.Sprint(viewBlocking)
	strRes += ", "
	strRes += "RotationSpeed: "
	rotationSpeed := sf.RotationSpeed
	strRes += fmt.Sprint(rotationSpeed)
	strRes += ", "
	strRes += "SpawnMovementSpeed: "
	spawnMovementSpeed := sf.SpawnMovementSpeed
	strRes += fmt.Sprint(spawnMovementSpeed)
	strRes += ", "
	strRes += "MaxUnitForwardSpeed: "
	maxUnitForwardSpeed := sf.MaxUnitForwardSpeed
	strRes += fmt.Sprint(maxUnitForwardSpeed)
	strRes += ", "
	strRes += "MaxUnitBackwardSpeed: "
	maxUnitBackwardSpeed := sf.MaxUnitBackwardSpeed
	strRes += fmt.Sprint(maxUnitBackwardSpeed)
	strRes += ", "
	strRes += "UnitAcceleration: "
	unitAcceleration := sf.UnitAcceleration
	strRes += fmt.Sprint(unitAcceleration)
	strRes += ", "
	strRes += "FriendlyFire: "
	friendlyFire := sf.FriendlyFire
	strRes += fmt.Sprint(friendlyFire)
	strRes += ", "
	strRes += "KillScore: "
	killScore := sf.KillScore
	strRes += fmt.Sprint(killScore)
	strRes += ", "
	strRes += "DamageScoreMultiplier: "
	damageScoreMultiplier := sf.DamageScoreMultiplier
	strRes += fmt.Sprint(damageScoreMultiplier)
	strRes += ", "
	strRes += "ScorePerPlace: "
	scorePerPlace := sf.ScorePerPlace
	strRes += fmt.Sprint(scorePerPlace)
	strRes += ", "
	strRes += "Weapons: "
	weapons := sf.Weapons
	strRes += "[ "
	for weaponsIndex, weaponsElement := range weapons {
		if weaponsIndex != 0 {
			strRes += ", "
		}
		strRes += weaponsElement.String()
	}
	strRes += " ]"
	strRes += ", "
	strRes += "StartingWeapon: "
	startingWeapon := sf.StartingWeapon
	if startingWeapon == nil {
		strRes += "nil"
	} else {
		startingWeaponValue := *startingWeapon
		strRes += fmt.Sprint(startingWeaponValue)
	}
	strRes += ", "
	strRes += "StartingWeaponAmmo: "
	startingWeaponAmmo := sf.StartingWeaponAmmo
	strRes += fmt.Sprint(startingWeaponAmmo)
	strRes += ", "
	strRes += "MaxShieldPotionsInInventory: "
	maxShieldPotionsInInventory := sf.MaxShieldPotionsInInventory
	strRes += fmt.Sprint(maxShieldPotionsInInventory)
	strRes += ", "
	strRes += "ShieldPerPotion: "
	shieldPerPotion := sf.ShieldPerPotion
	strRes += fmt.Sprint(shieldPerPotion)
	strRes += ", "
	strRes += "ShieldPotionUseTime: "
	shieldPotionUseTime := sf.ShieldPotionUseTime
	strRes += fmt.Sprint(shieldPotionUseTime)
	strRes += ", "
	strRes += "Sounds: "
	sounds := sf.Sounds
	strRes += "[ "
	for soundsIndex, soundsElement := range sounds {
		if soundsIndex != 0 {
			strRes += ", "
		}
		strRes += soundsElement.String()
	}
	strRes += " ]"
	strRes += ", "
	strRes += "StepsSoundTypeIndex: "
	stepsSoundTypeIndex := sf.StepsSoundTypeIndex
	if stepsSoundTypeIndex == nil {
		strRes += "nil"
	} else {
		stepsSoundTypeIndexValue := *stepsSoundTypeIndex
		strRes += fmt.Sprint(stepsSoundTypeIndexValue)
	}
	strRes += ", "
	strRes += "StepsSoundTravelDistance: "
	stepsSoundTravelDistance := sf.StepsSoundTravelDistance
	strRes += fmt.Sprint(stepsSoundTravelDistance)
	strRes += ", "
	strRes += "Obstacles: "
	obstacles := sf.Obstacles
	strRes += "[ "
	for obstaclesIndex, obstaclesElement := range obstacles {
		if obstaclesIndex != 0 {
			strRes += ", "
		}
		strRes += obstaclesElement.String()
	}
	strRes += " ]"
	strRes += " }"
	return strRes
}
