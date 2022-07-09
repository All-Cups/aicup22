package model

import (
	"fmt"
	"io"

	"aicup22/pkg/stream"
)

// Current game's state
type Game struct {
	// Your player's id
	MyId int32
	// List of players (teams)
	Players []Player
	// Current tick
	CurrentTick int32
	// List of units visible by your team
	Units []Unit
	// List of loot visible by your team
	Loot []Loot
	// List of projectiles visible by your team
	Projectiles []Projectile
	// Current state of game zone
	Zone Zone
	// List of sounds heard by your team during last tick
	Sounds []Sound
}

func NewGame(myId int32, players []Player, currentTick int32, units []Unit, loot []Loot, projectiles []Projectile, zone Zone, sounds []Sound) Game {
	return Game{
		MyId:        myId,
		Players:     players,
		CurrentTick: currentTick,
		Units:       units,
		Loot:        loot,
		Projectiles: projectiles,
		Zone:        zone,
		Sounds:      sounds,
	}
}

// Read Game from reader
func ReadGame(reader io.Reader) Game {
	myId := stream.ReadInt32(reader)
	players := make([]Player, stream.ReadInt32(reader))
	for playersIndex := range players {
		playersElement := ReadPlayer(reader)
		players[playersIndex] = playersElement
	}
	currentTick := stream.ReadInt32(reader)
	units := make([]Unit, stream.ReadInt32(reader))
	for unitsIndex := range units {
		unitsElement := ReadUnit(reader)
		units[unitsIndex] = unitsElement
	}
	loot := make([]Loot, stream.ReadInt32(reader))
	for lootIndex := range loot {
		lootElement := ReadLoot(reader)
		loot[lootIndex] = lootElement
	}
	projectiles := make([]Projectile, stream.ReadInt32(reader))
	for projectilesIndex := range projectiles {
		projectilesElement := ReadProjectile(reader)
		projectiles[projectilesIndex] = projectilesElement
	}
	zone := ReadZone(reader)
	sounds := make([]Sound, stream.ReadInt32(reader))
	for soundsIndex := range sounds {
		soundsElement := ReadSound(reader)
		sounds[soundsIndex] = soundsElement
	}
	return Game{
		MyId:        myId,
		Players:     players,
		CurrentTick: currentTick,
		Units:       units,
		Loot:        loot,
		Projectiles: projectiles,
		Zone:        zone,
		Sounds:      sounds,
	}
}

// Write Game to writer
func (game Game) Write(writer io.Writer) {
	myId := game.MyId
	stream.WriteInt32(writer, myId)
	players := game.Players
	stream.WriteInt32(writer, int32(len(players)))
	for _, playersElement := range players {
		playersElement.Write(writer)
	}
	currentTick := game.CurrentTick
	stream.WriteInt32(writer, currentTick)
	units := game.Units
	stream.WriteInt32(writer, int32(len(units)))
	for _, unitsElement := range units {
		unitsElement.Write(writer)
	}
	loot := game.Loot
	stream.WriteInt32(writer, int32(len(loot)))
	for _, lootElement := range loot {
		lootElement.Write(writer)
	}
	projectiles := game.Projectiles
	stream.WriteInt32(writer, int32(len(projectiles)))
	for _, projectilesElement := range projectiles {
		projectilesElement.Write(writer)
	}
	zone := game.Zone
	zone.Write(writer)
	sounds := game.Sounds
	stream.WriteInt32(writer, int32(len(sounds)))
	for _, soundsElement := range sounds {
		soundsElement.Write(writer)
	}
}

// Get string representation of Game
func (game Game) String() string {
	stringResult := "{ "
	stringResult += "MyId: "
	myId := game.MyId
	stringResult += fmt.Sprint(myId)
	stringResult += ", "
	stringResult += "Players: "
	players := game.Players
	stringResult += "[ "
	for playersIndex, playersElement := range players {
		if playersIndex != 0 {
			stringResult += ", "
		}
		stringResult += playersElement.String()
	}
	stringResult += " ]"
	stringResult += ", "
	stringResult += "CurrentTick: "
	currentTick := game.CurrentTick
	stringResult += fmt.Sprint(currentTick)
	stringResult += ", "
	stringResult += "Units: "
	units := game.Units
	stringResult += "[ "
	for unitsIndex, unitsElement := range units {
		if unitsIndex != 0 {
			stringResult += ", "
		}
		stringResult += unitsElement.String()
	}
	stringResult += " ]"
	stringResult += ", "
	stringResult += "Loot: "
	loot := game.Loot
	stringResult += "[ "
	for lootIndex, lootElement := range loot {
		if lootIndex != 0 {
			stringResult += ", "
		}
		stringResult += lootElement.String()
	}
	stringResult += " ]"
	stringResult += ", "
	stringResult += "Projectiles: "
	projectiles := game.Projectiles
	stringResult += "[ "
	for projectilesIndex, projectilesElement := range projectiles {
		if projectilesIndex != 0 {
			stringResult += ", "
		}
		stringResult += projectilesElement.String()
	}
	stringResult += " ]"
	stringResult += ", "
	stringResult += "Zone: "
	zone := game.Zone
	stringResult += zone.String()
	stringResult += ", "
	stringResult += "Sounds: "
	sounds := game.Sounds
	stringResult += "[ "
	for soundsIndex, soundsElement := range sounds {
		if soundsIndex != 0 {
			stringResult += ", "
		}
		stringResult += soundsElement.String()
	}
	stringResult += " ]"
	stringResult += " }"
	return stringResult
}
