package model

import (
	"fmt"
	"io"

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
func ReadWeaponProperties(reader io.Reader) WeaponProperties {
	name := stream.ReadString(reader)
	roundsPerSecond := stream.ReadFloat64(reader)
	spread := stream.ReadFloat64(reader)
	aimTime := stream.ReadFloat64(reader)
	aimFieldOfView := stream.ReadFloat64(reader)
	aimRotationSpeed := stream.ReadFloat64(reader)
	aimMovementSpeedModifier := stream.ReadFloat64(reader)
	projectileSpeed := stream.ReadFloat64(reader)
	projectileDamage := stream.ReadFloat64(reader)
	projectileLifeTime := stream.ReadFloat64(reader)
	var shotSoundTypeIndex *int32
	if stream.ReadBool(reader) {
		shotSoundTypeIndexValue := stream.ReadInt32(reader)
		shotSoundTypeIndex = &shotSoundTypeIndexValue
	} else {
		shotSoundTypeIndex = nil
	}
	var projectileHitSoundTypeIndex *int32
	if stream.ReadBool(reader) {
		projectileHitSoundTypeIndexValue := stream.ReadInt32(reader)
		projectileHitSoundTypeIndex = &projectileHitSoundTypeIndexValue
	} else {
		projectileHitSoundTypeIndex = nil
	}
	maxInventoryAmmo := stream.ReadInt32(reader)
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
func (weaponProperties WeaponProperties) Write(writer io.Writer) {
	name := weaponProperties.Name
	stream.WriteString(writer, name)
	roundsPerSecond := weaponProperties.RoundsPerSecond
	stream.WriteFloat64(writer, roundsPerSecond)
	spread := weaponProperties.Spread
	stream.WriteFloat64(writer, spread)
	aimTime := weaponProperties.AimTime
	stream.WriteFloat64(writer, aimTime)
	aimFieldOfView := weaponProperties.AimFieldOfView
	stream.WriteFloat64(writer, aimFieldOfView)
	aimRotationSpeed := weaponProperties.AimRotationSpeed
	stream.WriteFloat64(writer, aimRotationSpeed)
	aimMovementSpeedModifier := weaponProperties.AimMovementSpeedModifier
	stream.WriteFloat64(writer, aimMovementSpeedModifier)
	projectileSpeed := weaponProperties.ProjectileSpeed
	stream.WriteFloat64(writer, projectileSpeed)
	projectileDamage := weaponProperties.ProjectileDamage
	stream.WriteFloat64(writer, projectileDamage)
	projectileLifeTime := weaponProperties.ProjectileLifeTime
	stream.WriteFloat64(writer, projectileLifeTime)
	shotSoundTypeIndex := weaponProperties.ShotSoundTypeIndex
	if shotSoundTypeIndex == nil {
		stream.WriteBool(writer, false)
	} else {
		stream.WriteBool(writer, true)
		shotSoundTypeIndexValue := *shotSoundTypeIndex
		stream.WriteInt32(writer, shotSoundTypeIndexValue)
	}
	projectileHitSoundTypeIndex := weaponProperties.ProjectileHitSoundTypeIndex
	if projectileHitSoundTypeIndex == nil {
		stream.WriteBool(writer, false)
	} else {
		stream.WriteBool(writer, true)
		projectileHitSoundTypeIndexValue := *projectileHitSoundTypeIndex
		stream.WriteInt32(writer, projectileHitSoundTypeIndexValue)
	}
	maxInventoryAmmo := weaponProperties.MaxInventoryAmmo
	stream.WriteInt32(writer, maxInventoryAmmo)
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
