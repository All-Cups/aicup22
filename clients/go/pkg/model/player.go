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
func (sf Player) Write() {
	id := sf.Id
	flow.WriteInt32(id)
	kills := sf.Kills
	flow.WriteInt32(kills)
	damage := sf.Damage
	flow.WriteFloat64(damage)
	place := sf.Place
	flow.WriteInt32(place)
	score := sf.Score
	flow.WriteFloat64(score)
}

// Get string representation of Player
func (sf Player) String() string {
	strRes := "{ "
	strRes += "Id: "
	id := sf.Id
	strRes += fmt.Sprint(id)
	strRes += ", "
	strRes += "Kills: "
	kills := sf.Kills
	strRes += fmt.Sprint(kills)
	strRes += ", "
	strRes += "Damage: "
	damage := sf.Damage
	strRes += fmt.Sprint(damage)
	strRes += ", "
	strRes += "Place: "
	place := sf.Place
	strRes += fmt.Sprint(place)
	strRes += ", "
	strRes += "Score: "
	score := sf.Score
	strRes += fmt.Sprint(score)
	strRes += " }"
	return strRes
}
