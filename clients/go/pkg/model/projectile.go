package model

import (
	"fmt"
	// "aicup22/pkg/stream"
)

// Weapon projectile
type Projectile struct {
	// Unique id
	Id int32
	// Index of the weapon this projectile was shot from (starts with 0)
	WeaponTypeIndex int32
	// Id of unit who made the shot
	ShooterId int32
	// Id of player (team), whose unit made the shot
	ShooterPlayerId int32
	// Current position
	Position Vec2
	// Projectile's velocity
	Velocity Vec2
	// Left time of projectile's life
	LifeTime float64
}

func NewProjectile(id, weaponTypeIndex, shooterId, shooterPlayerId int32, position, velocity Vec2, lifeTime float64) Projectile {
	return Projectile{
		Id:              id,
		WeaponTypeIndex: weaponTypeIndex,
		ShooterId:       shooterId,
		ShooterPlayerId: shooterPlayerId,
		Position:        position,
		Velocity:        velocity,
		LifeTime:        lifeTime,
	}
}

// Read Projectile from reader
func ReadProjectile() Projectile {
	id := flow.ReadInt32()
	weaponTypeIndex := flow.ReadInt32()
	shooterId := flow.ReadInt32()
	shooterPlayerId := flow.ReadInt32()
	position := ReadVec2()
	velocity := ReadVec2()
	lifeTime := flow.ReadFloat64()
	return Projectile{
		Id:              id,
		WeaponTypeIndex: weaponTypeIndex,
		ShooterId:       shooterId,
		ShooterPlayerId: shooterPlayerId,
		Position:        position,
		Velocity:        velocity,
		LifeTime:        lifeTime,
	}
}

// Write Projectile to writer
func (sf Projectile) Write() {
	id := sf.Id
	flow.WriteInt32(id)
	weaponTypeIndex := sf.WeaponTypeIndex
	flow.WriteInt32(weaponTypeIndex)
	shooterId := sf.ShooterId
	flow.WriteInt32(shooterId)
	shooterPlayerId := sf.ShooterPlayerId
	flow.WriteInt32(shooterPlayerId)
	position := sf.Position
	position.Write()
	velocity := sf.Velocity
	velocity.Write()
	lifeTime := sf.LifeTime
	flow.WriteFloat64(lifeTime)
}

// Get string representation of Projectile
func (sf Projectile) String() string {
	strRes := "{ "
	strRes += "Id: "
	id := sf.Id
	strRes += fmt.Sprint(id)
	strRes += ", "
	strRes += "WeaponTypeIndex: "
	weaponTypeIndex := sf.WeaponTypeIndex
	strRes += fmt.Sprint(weaponTypeIndex)
	strRes += ", "
	strRes += "ShooterId: "
	shooterId := sf.ShooterId
	strRes += fmt.Sprint(shooterId)
	strRes += ", "
	strRes += "ShooterPlayerId: "
	shooterPlayerId := sf.ShooterPlayerId
	strRes += fmt.Sprint(shooterPlayerId)
	strRes += ", "
	strRes += "Position: "
	position := sf.Position
	strRes += position.String()
	strRes += ", "
	strRes += "Velocity: "
	velocity := sf.Velocity
	strRes += velocity.String()
	strRes += ", "
	strRes += "LifeTime: "
	lifeTime := sf.LifeTime
	strRes += fmt.Sprint(lifeTime)
	strRes += " }"
	return strRes
}
