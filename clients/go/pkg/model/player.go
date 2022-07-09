package model

import (
	"fmt"
	"io"

	"aicup22/pkg/stream"
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
func ReadPlayer(reader io.Reader) Player {
	id := stream.Flow().ReadInt32()
	kills := stream.Flow().ReadInt32()
	damage := stream.ReadFloat64(reader)
	place := stream.Flow().ReadInt32()
	score := stream.ReadFloat64(reader)
	return Player{
		Id:     id,
		Kills:  kills,
		Damage: damage,
		Place:  place,
		Score:  score,
	}
}

// Write Player to writer
func (player Player) Write(writer io.Writer) {
	id := player.Id
	stream.WriteInt32(writer, id)
	kills := player.Kills
	stream.WriteInt32(writer, kills)
	damage := player.Damage
	stream.WriteFloat64(writer, damage)
	place := player.Place
	stream.WriteInt32(writer, place)
	score := player.Score
	stream.WriteFloat64(writer, score)
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
