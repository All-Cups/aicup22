package model

import (
	"fmt"

	"aicup22/pkg/stream"
)

// Weapon properties
type WeaponProperties struct {
	// Name
	Name string
	// Shooting speed (number of shots per second)
	RoundsPerSecond float64
	// Accuracy (spread angle) of a shot (in degrees)
	Spread float64
	// Aiming time
	AimTime float64
	// Field of view in full aim (in degrees)
	AimFieldOfView float64
	// Rotation speed in full aim (degrees per second)
	AimRotationSpeed float64
	// Movement speed modifier in full aim
	AimMovementSpeedModifier float64
	// Speed of projectiles
	ProjectileSpeed float64
	// Damage of a projectile
	ProjectileDamage float64
	// Projectiles' life time
	ProjectileLifeTime float64
	// Index of the sound when shooting (starting with 0), or None
	ShotSoundTypeIndex *int32
	// Index of the sound when hitting something (starting with 0), or None
	ProjectileHitSoundTypeIndex *int32
	// Max amount of ammo unit can hold in their inventory
	MaxInventoryAmmo int32
}

func NewWeaponProperties(name string,
	roundsPerSecond, spread, aimTime, aimFieldOfView, aimRotationSpeed, aimMovementSpeedModifier, projectileSpeed, projectileDamage, projectileLifeTime float64,
	shotSoundTypeIndex, projectileHitSoundTypeIndex *int32,
	maxInventoryAmmo int32) WeaponProperties {
	return WeaponProperties{
		Name:                        name,
		RoundsPerSecond:             roundsPerSecond,
		Spread:                      spread,
		AimTime:                     aimTime,
		AimFieldOfView:              aimFieldOfView,
		AimRotationSpeed:            aimRotationSpeed,
		AimMovementSpeedModifier:    aimMovementSpeedModifier,
		ProjectileSpeed:             projectileSpeed,
		ProjectileDamage:            projectileDamage,
		ProjectileLifeTime:          projectileLifeTime,
		ShotSoundTypeIndex:          shotSoundTypeIndex,
		ProjectileHitSoundTypeIndex: projectileHitSoundTypeIndex,
		MaxInventoryAmmo:            maxInventoryAmmo,
	}
}

// Read WeaponProperties from reader
func ReadWeaponProperties() WeaponProperties {
	name := flow.ReadString()
	roundsPerSecond := flow.ReadFloat64()
	spread := flow.ReadFloat64()
	aimTime := flow.ReadFloat64()
	aimFieldOfView := flow.ReadFloat64()
	aimRotationSpeed := flow.ReadFloat64()
	aimMovementSpeedModifier := flow.ReadFloat64()
	projectileSpeed := flow.ReadFloat64()
	projectileDamage := flow.ReadFloat64()
	projectileLifeTime := flow.ReadFloat64()
	var shotSoundTypeIndex *int32
	if stream.Flow().ReadBool() {
		shotSoundTypeIndexValue := stream.Flow().ReadInt32()
		shotSoundTypeIndex = &shotSoundTypeIndexValue
	} else {
		shotSoundTypeIndex = nil
	}
	var projectileHitSoundTypeIndex *int32
	if stream.Flow().ReadBool() {
		projectileHitSoundTypeIndexValue := stream.Flow().ReadInt32()
		projectileHitSoundTypeIndex = &projectileHitSoundTypeIndexValue
	} else {
		projectileHitSoundTypeIndex = nil
	}
	maxInventoryAmmo := stream.Flow().ReadInt32()
	return WeaponProperties{
		Name:                        name,
		RoundsPerSecond:             roundsPerSecond,
		Spread:                      spread,
		AimTime:                     aimTime,
		AimFieldOfView:              aimFieldOfView,
		AimRotationSpeed:            aimRotationSpeed,
		AimMovementSpeedModifier:    aimMovementSpeedModifier,
		ProjectileSpeed:             projectileSpeed,
		ProjectileDamage:            projectileDamage,
		ProjectileLifeTime:          projectileLifeTime,
		ShotSoundTypeIndex:          shotSoundTypeIndex,
		ProjectileHitSoundTypeIndex: projectileHitSoundTypeIndex,
		MaxInventoryAmmo:            maxInventoryAmmo,
	}
}

// Write WeaponProperties to writer
func (weaponProperties WeaponProperties) Write() {
	name := weaponProperties.Name
	flow.WriteString(name)
	roundsPerSecond := weaponProperties.RoundsPerSecond
	flow.WriteFloat64(roundsPerSecond)
	spread := weaponProperties.Spread
	flow.WriteFloat64(spread)
	aimTime := weaponProperties.AimTime
	flow.WriteFloat64(aimTime)
	aimFieldOfView := weaponProperties.AimFieldOfView
	flow.WriteFloat64(aimFieldOfView)
	aimRotationSpeed := weaponProperties.AimRotationSpeed
	flow.WriteFloat64(aimRotationSpeed)
	aimMovementSpeedModifier := weaponProperties.AimMovementSpeedModifier
	flow.WriteFloat64(aimMovementSpeedModifier)
	projectileSpeed := weaponProperties.ProjectileSpeed
	flow.WriteFloat64(projectileSpeed)
	projectileDamage := weaponProperties.ProjectileDamage
	flow.WriteFloat64(projectileDamage)
	projectileLifeTime := weaponProperties.ProjectileLifeTime
	flow.WriteFloat64(projectileLifeTime)
	shotSoundTypeIndex := weaponProperties.ShotSoundTypeIndex
	if shotSoundTypeIndex == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		shotSoundTypeIndexValue := *shotSoundTypeIndex
		flow.WriteInt32(shotSoundTypeIndexValue)
	}
	projectileHitSoundTypeIndex := weaponProperties.ProjectileHitSoundTypeIndex
	if projectileHitSoundTypeIndex == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		projectileHitSoundTypeIndexValue := *projectileHitSoundTypeIndex
		flow.WriteInt32(projectileHitSoundTypeIndexValue)
	}
	maxInventoryAmmo := weaponProperties.MaxInventoryAmmo
	flow.WriteInt32(maxInventoryAmmo)
}

// Get string representation of WeaponProperties
func (weaponProperties WeaponProperties) String() string {
	stringResult := "{ "
	stringResult += "Name: "
	name := weaponProperties.Name
	stringResult += "\"" + name + "\""
	stringResult += ", "
	stringResult += "RoundsPerSecond: "
	roundsPerSecond := weaponProperties.RoundsPerSecond
	stringResult += fmt.Sprint(roundsPerSecond)
	stringResult += ", "
	stringResult += "Spread: "
	spread := weaponProperties.Spread
	stringResult += fmt.Sprint(spread)
	stringResult += ", "
	stringResult += "AimTime: "
	aimTime := weaponProperties.AimTime
	stringResult += fmt.Sprint(aimTime)
	stringResult += ", "
	stringResult += "AimFieldOfView: "
	aimFieldOfView := weaponProperties.AimFieldOfView
	stringResult += fmt.Sprint(aimFieldOfView)
	stringResult += ", "
	stringResult += "AimRotationSpeed: "
	aimRotationSpeed := weaponProperties.AimRotationSpeed
	stringResult += fmt.Sprint(aimRotationSpeed)
	stringResult += ", "
	stringResult += "AimMovementSpeedModifier: "
	aimMovementSpeedModifier := weaponProperties.AimMovementSpeedModifier
	stringResult += fmt.Sprint(aimMovementSpeedModifier)
	stringResult += ", "
	stringResult += "ProjectileSpeed: "
	projectileSpeed := weaponProperties.ProjectileSpeed
	stringResult += fmt.Sprint(projectileSpeed)
	stringResult += ", "
	stringResult += "ProjectileDamage: "
	projectileDamage := weaponProperties.ProjectileDamage
	stringResult += fmt.Sprint(projectileDamage)
	stringResult += ", "
	stringResult += "ProjectileLifeTime: "
	projectileLifeTime := weaponProperties.ProjectileLifeTime
	stringResult += fmt.Sprint(projectileLifeTime)
	stringResult += ", "
	stringResult += "ShotSoundTypeIndex: "
	shotSoundTypeIndex := weaponProperties.ShotSoundTypeIndex
	if shotSoundTypeIndex == nil {
		stringResult += "nil"
	} else {
		shotSoundTypeIndexValue := *shotSoundTypeIndex
		stringResult += fmt.Sprint(shotSoundTypeIndexValue)
	}
	stringResult += ", "
	stringResult += "ProjectileHitSoundTypeIndex: "
	projectileHitSoundTypeIndex := weaponProperties.ProjectileHitSoundTypeIndex
	if projectileHitSoundTypeIndex == nil {
		stringResult += "nil"
	} else {
		projectileHitSoundTypeIndexValue := *projectileHitSoundTypeIndex
		stringResult += fmt.Sprint(projectileHitSoundTypeIndexValue)
	}
	stringResult += ", "
	stringResult += "MaxInventoryAmmo: "
	maxInventoryAmmo := weaponProperties.MaxInventoryAmmo
	stringResult += fmt.Sprint(maxInventoryAmmo)
	stringResult += " }"
	return stringResult
}
