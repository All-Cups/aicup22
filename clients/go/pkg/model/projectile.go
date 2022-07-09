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
func (projectile Projectile) Write() {
	id := projectile.Id
	flow.WriteInt32(id)
	weaponTypeIndex := projectile.WeaponTypeIndex
	flow.WriteInt32(weaponTypeIndex)
	shooterId := projectile.ShooterId
	flow.WriteInt32(shooterId)
	shooterPlayerId := projectile.ShooterPlayerId
	flow.WriteInt32(shooterPlayerId)
	position := projectile.Position
	position.Write()
	velocity := projectile.Velocity
	velocity.Write()
	lifeTime := projectile.LifeTime
	flow.WriteFloat64(lifeTime)
}

// Get string representation of Projectile
func (projectile Projectile) String() string {
	stringResult := "{ "
	stringResult += "Id: "
	id := projectile.Id
	stringResult += fmt.Sprint(id)
	stringResult += ", "
	stringResult += "WeaponTypeIndex: "
	weaponTypeIndex := projectile.WeaponTypeIndex
	stringResult += fmt.Sprint(weaponTypeIndex)
	stringResult += ", "
	stringResult += "ShooterId: "
	shooterId := projectile.ShooterId
	stringResult += fmt.Sprint(shooterId)
	stringResult += ", "
	stringResult += "ShooterPlayerId: "
	shooterPlayerId := projectile.ShooterPlayerId
	stringResult += fmt.Sprint(shooterPlayerId)
	stringResult += ", "
	stringResult += "Position: "
	position := projectile.Position
	stringResult += position.String()
	stringResult += ", "
	stringResult += "Velocity: "
	velocity := projectile.Velocity
	stringResult += velocity.String()
	stringResult += ", "
	stringResult += "LifeTime: "
	lifeTime := projectile.LifeTime
	stringResult += fmt.Sprint(lifeTime)
	stringResult += " }"
	return stringResult
}
