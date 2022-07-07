package model

import "fmt"
import "io"
import . "ai_cup_22/stream"

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

func NewPlayer(id int32, kills int32, damage float64, place int32, score float64) Player {
    return Player {
        Id: id,
        Kills: kills,
        Damage: damage,
        Place: place,
        Score: score,
    }
}

// Read Player from reader
func ReadPlayer(reader io.Reader) Player {
    var id int32
    id = ReadInt32(reader)
    var kills int32
    kills = ReadInt32(reader)
    var damage float64
    damage = ReadFloat64(reader)
    var place int32
    place = ReadInt32(reader)
    var score float64
    score = ReadFloat64(reader)
    return Player {
        Id: id,
        Kills: kills,
        Damage: damage,
        Place: place,
        Score: score,
    }
}

// Write Player to writer
func (player Player) Write(writer io.Writer) {
    id := player.Id
    WriteInt32(writer, id)
    kills := player.Kills
    WriteInt32(writer, kills)
    damage := player.Damage
    WriteFloat64(writer, damage)
    place := player.Place
    WriteInt32(writer, place)
    score := player.Score
    WriteFloat64(writer, score)
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