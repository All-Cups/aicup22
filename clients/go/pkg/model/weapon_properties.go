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
func (sf WeaponProperties) Write() {
	name := sf.Name
	flow.WriteString(name)
	roundsPerSecond := sf.RoundsPerSecond
	flow.WriteFloat64(roundsPerSecond)
	spread := sf.Spread
	flow.WriteFloat64(spread)
	aimTime := sf.AimTime
	flow.WriteFloat64(aimTime)
	aimFieldOfView := sf.AimFieldOfView
	flow.WriteFloat64(aimFieldOfView)
	aimRotationSpeed := sf.AimRotationSpeed
	flow.WriteFloat64(aimRotationSpeed)
	aimMovementSpeedModifier := sf.AimMovementSpeedModifier
	flow.WriteFloat64(aimMovementSpeedModifier)
	projectileSpeed := sf.ProjectileSpeed
	flow.WriteFloat64(projectileSpeed)
	projectileDamage := sf.ProjectileDamage
	flow.WriteFloat64(projectileDamage)
	projectileLifeTime := sf.ProjectileLifeTime
	flow.WriteFloat64(projectileLifeTime)
	shotSoundTypeIndex := sf.ShotSoundTypeIndex
	if shotSoundTypeIndex == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		shotSoundTypeIndexValue := *shotSoundTypeIndex
		flow.WriteInt32(shotSoundTypeIndexValue)
	}
	projectileHitSoundTypeIndex := sf.ProjectileHitSoundTypeIndex
	if projectileHitSoundTypeIndex == nil {
		flow.WriteBool(false)
	} else {
		flow.WriteBool(true)
		projectileHitSoundTypeIndexValue := *projectileHitSoundTypeIndex
		flow.WriteInt32(projectileHitSoundTypeIndexValue)
	}
	maxInventoryAmmo := sf.MaxInventoryAmmo
	flow.WriteInt32(maxInventoryAmmo)
}

// Get string representation of WeaponProperties
func (sf WeaponProperties) String() string {
	strRes := "{ "
	strRes += "Name: "
	name := sf.Name
	strRes += "\"" + name + "\""
	strRes += ", "
	strRes += "RoundsPerSecond: "
	roundsPerSecond := sf.RoundsPerSecond
	strRes += fmt.Sprint(roundsPerSecond)
	strRes += ", "
	strRes += "Spread: "
	spread := sf.Spread
	strRes += fmt.Sprint(spread)
	strRes += ", "
	strRes += "AimTime: "
	aimTime := sf.AimTime
	strRes += fmt.Sprint(aimTime)
	strRes += ", "
	strRes += "AimFieldOfView: "
	aimFieldOfView := sf.AimFieldOfView
	strRes += fmt.Sprint(aimFieldOfView)
	strRes += ", "
	strRes += "AimRotationSpeed: "
	aimRotationSpeed := sf.AimRotationSpeed
	strRes += fmt.Sprint(aimRotationSpeed)
	strRes += ", "
	strRes += "AimMovementSpeedModifier: "
	aimMovementSpeedModifier := sf.AimMovementSpeedModifier
	strRes += fmt.Sprint(aimMovementSpeedModifier)
	strRes += ", "
	strRes += "ProjectileSpeed: "
	projectileSpeed := sf.ProjectileSpeed
	strRes += fmt.Sprint(projectileSpeed)
	strRes += ", "
	strRes += "ProjectileDamage: "
	projectileDamage := sf.ProjectileDamage
	strRes += fmt.Sprint(projectileDamage)
	strRes += ", "
	strRes += "ProjectileLifeTime: "
	projectileLifeTime := sf.ProjectileLifeTime
	strRes += fmt.Sprint(projectileLifeTime)
	strRes += ", "
	strRes += "ShotSoundTypeIndex: "
	shotSoundTypeIndex := sf.ShotSoundTypeIndex
	if shotSoundTypeIndex == nil {
		strRes += "nil"
	} else {
		shotSoundTypeIndexValue := *shotSoundTypeIndex
		strRes += fmt.Sprint(shotSoundTypeIndexValue)
	}
	strRes += ", "
	strRes += "ProjectileHitSoundTypeIndex: "
	projectileHitSoundTypeIndex := sf.ProjectileHitSoundTypeIndex
	if projectileHitSoundTypeIndex == nil {
		strRes += "nil"
	} else {
		projectileHitSoundTypeIndexValue := *projectileHitSoundTypeIndex
		strRes += fmt.Sprint(projectileHitSoundTypeIndexValue)
	}
	strRes += ", "
	strRes += "MaxInventoryAmmo: "
	maxInventoryAmmo := sf.MaxInventoryAmmo
	strRes += fmt.Sprint(maxInventoryAmmo)
	strRes += " }"
	return strRes
}
