package model

import (
	"fmt"
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
func ReadGame() Game {
	myId := flow.ReadInt32()
	players := make([]Player, flow.ReadInt32())
	for playersIndex := range players {
		playersElement := ReadPlayer()
		players[playersIndex] = playersElement
	}
	currentTick := flow.ReadInt32()
	units := make([]Unit, flow.ReadInt32())
	for unitsIndex := range units {
		unitsElement := ReadUnit()
		units[unitsIndex] = unitsElement
	}
	loot := make([]Loot, flow.ReadInt32())
	for lootIndex := range loot {
		lootElement := ReadLoot()
		loot[lootIndex] = lootElement
	}
	projectiles := make([]Projectile, flow.ReadInt32())
	for projectilesIndex := range projectiles {
		projectilesElement := ReadProjectile()
		projectiles[projectilesIndex] = projectilesElement
	}
	zone := ReadZone()
	sounds := make([]Sound, flow.ReadInt32())
	for soundsIndex := range sounds {
		soundsElement := ReadSound()
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
func (sf Game) Write() {
	myId := sf.MyId
	flow.WriteInt32(myId)
	players := sf.Players
	flow.WriteInt32(int32(len(players)))
	for _, playersElement := range players {
		playersElement.Write()
	}
	currentTick := sf.CurrentTick
	flow.WriteInt32(currentTick)
	units := sf.Units
	flow.WriteInt32(int32(len(units)))
	for _, unitsElement := range units {
		unitsElement.Write()
	}
	loot := sf.Loot
	flow.WriteInt32(int32(len(loot)))
	for _, lootElement := range loot {
		lootElement.Write()
	}
	projectiles := sf.Projectiles
	flow.WriteInt32(int32(len(projectiles)))
	for _, projectilesElement := range projectiles {
		projectilesElement.Write()
	}
	zone := sf.Zone
	zone.Write()
	sounds := sf.Sounds
	flow.WriteInt32(int32(len(sounds)))
	for _, soundsElement := range sounds {
		soundsElement.Write()
	}
}

// Get string representation of Game
func (sf Game) String() string {
	stringResult := "{ "
	stringResult += "MyId: "
	myId := sf.MyId
	stringResult += fmt.Sprint(myId)
	stringResult += ", "
	stringResult += "Players: "
	players := sf.Players
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
	currentTick := sf.CurrentTick
	stringResult += fmt.Sprint(currentTick)
	stringResult += ", "
	stringResult += "Units: "
	units := sf.Units
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
	loot := sf.Loot
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
	projectiles := sf.Projectiles
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
	zone := sf.Zone
	stringResult += zone.String()
	stringResult += ", "
	stringResult += "Sounds: "
	sounds := sf.Sounds
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
