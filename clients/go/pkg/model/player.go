package model

import (
	"fmt"
)

// Game's participant (team of units)
type Player struct {
	// Unique id
	Id int32
	// Number of kills
	Kills int32
	// Total damage dealt to enemies
	Damage float64
	// Survival place (number of survivor teams currently/at the moment of death)
	Place int32
	// Team score
	Score float64
}

func NewPlayer(id, kills int32, damage float64, place int32, score float64) Player {
	return Player{
		Id:     id,
		Kills:  kills,
		Damage: damage,
		Place:  place,
		Score:  score,
	}
}

// Read Player from reader
func ReadPlayer() Player {
	id := flow.ReadInt32()
	kills := flow.ReadInt32()
	damage := flow.ReadFloat64()
	place := flow.ReadInt32()
	score := flow.ReadFloat64()
	return Player{
		Id:     id,
		Kills:  kills,
		Damage: damage,
		Place:  place,
		Score:  score,
	}
}

// Write Player to writer
func (player Player) Write() {
	id := player.Id
	flow.WriteInt32(id)
	kills := player.Kills
	flow.WriteInt32(kills)
	damage := player.Damage
	flow.WriteFloat64(damage)
	place := player.Place
	flow.WriteInt32(place)
	score := player.Score
	flow.WriteFloat64(score)
}

// Get string representation of Player
func (player Player) String() string {
	stringResult := "{ "
	stringResult += "Id: "
	id := player.Id
	stringResult += fmt.Sprint(id)
	stringResult += ", "
	stringResult += "Kills: "
	kills := player.Kills
	stringResult += fmt.Sprint(kills)
	stringResult += ", "
	stringResult += "Damage: "
	damage := player.Damage
	stringResult += fmt.Sprint(damage)
	stringResult += ", "
	stringResult += "Place: "
	place := player.Place
	stringResult += fmt.Sprint(place)
	stringResult += ", "
	stringResult += "Score: "
	score := player.Score
	stringResult += fmt.Sprint(score)
	stringResult += " }"
	return stringResult
}
