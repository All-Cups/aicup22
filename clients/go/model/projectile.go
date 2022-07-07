package model

import "fmt"
import "io"
import . "ai_cup_22/stream"

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

func NewProjectile(id int32, weaponTypeIndex int32, shooterId int32, shooterPlayerId int32, position Vec2, velocity Vec2, lifeTime float64) Projectile {
    return Projectile {
        Id: id,
        WeaponTypeIndex: weaponTypeIndex,
        ShooterId: shooterId,
        ShooterPlayerId: shooterPlayerId,
        Position: position,
        Velocity: velocity,
        LifeTime: lifeTime,
    }
}

// Read Projectile from reader
func ReadProjectile(reader io.Reader) Projectile {
    var id int32
    id = ReadInt32(reader)
    var weaponTypeIndex int32
    weaponTypeIndex = ReadInt32(reader)
    var shooterId int32
    shooterId = ReadInt32(reader)
    var shooterPlayerId int32
    shooterPlayerId = ReadInt32(reader)
    var position Vec2
    position = ReadVec2(reader)
    var velocity Vec2
    velocity = ReadVec2(reader)
    var lifeTime float64
    lifeTime = ReadFloat64(reader)
    return Projectile {
        Id: id,
        WeaponTypeIndex: weaponTypeIndex,
        ShooterId: shooterId,
        ShooterPlayerId: shooterPlayerId,
        Position: position,
        Velocity: velocity,
        LifeTime: lifeTime,
    }
}

// Write Projectile to writer
func (projectile Projectile) Write(writer io.Writer) {
    id := projectile.Id
    WriteInt32(writer, id)
    weaponTypeIndex := projectile.WeaponTypeIndex
    WriteInt32(writer, weaponTypeIndex)
    shooterId := projectile.ShooterId
    WriteInt32(writer, shooterId)
    shooterPlayerId := projectile.ShooterPlayerId
    WriteInt32(writer, shooterPlayerId)
    position := projectile.Position
    position.Write(writer)
    velocity := projectile.Velocity
    velocity.Write(writer)
    lifeTime := projectile.LifeTime
    WriteFloat64(writer, lifeTime)
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