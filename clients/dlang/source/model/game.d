module model.game;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.loot;
import model.player;
import model.projectile;
import model.sound;
import model.unit;
import model.zone;

/// Current game's state
struct Game {
    /// Your player's id
    int myId;
    /// List of players (teams)
    model.Player[] players;
    /// Current tick
    int currentTick;
    /// List of units visible by your team
    model.Unit[] units;
    /// List of loot visible by your team
    model.Loot[] loot;
    /// List of projectiles visible by your team
    model.Projectile[] projectiles;
    /// Current state of game zone
    model.Zone zone;
    /// List of sounds heard by your team during last tick
    model.Sound[] sounds;

    this(int myId, model.Player[] players, int currentTick, model.Unit[] units, model.Loot[] loot, model.Projectile[] projectiles, model.Zone zone, model.Sound[] sounds) {
        this.myId = myId;
        this.players = players;
        this.currentTick = currentTick;
        this.units = units;
        this.loot = loot;
        this.projectiles = projectiles;
        this.zone = zone;
        this.sounds = sounds;
    }

    /// Read Game from reader
    static Game readFrom(Stream reader) {
        int myId;
        myId = reader.readInt();
        model.Player[] players;
        players = new model.Player[reader.readInt()];
        for (int playersIndex = 0; playersIndex < players.length; playersIndex++) {
            model.Player playersKey;
            playersKey = model.Player.readFrom(reader);
            players[playersIndex] = playersKey;
        }
        int currentTick;
        currentTick = reader.readInt();
        model.Unit[] units;
        units = new model.Unit[reader.readInt()];
        for (int unitsIndex = 0; unitsIndex < units.length; unitsIndex++) {
            model.Unit unitsKey;
            unitsKey = model.Unit.readFrom(reader);
            units[unitsIndex] = unitsKey;
        }
        model.Loot[] loot;
        loot = new model.Loot[reader.readInt()];
        for (int lootIndex = 0; lootIndex < loot.length; lootIndex++) {
            model.Loot lootKey;
            lootKey = model.Loot.readFrom(reader);
            loot[lootIndex] = lootKey;
        }
        model.Projectile[] projectiles;
        projectiles = new model.Projectile[reader.readInt()];
        for (int projectilesIndex = 0; projectilesIndex < projectiles.length; projectilesIndex++) {
            model.Projectile projectilesKey;
            projectilesKey = model.Projectile.readFrom(reader);
            projectiles[projectilesIndex] = projectilesKey;
        }
        model.Zone zone;
        zone = model.Zone.readFrom(reader);
        model.Sound[] sounds;
        sounds = new model.Sound[reader.readInt()];
        for (int soundsIndex = 0; soundsIndex < sounds.length; soundsIndex++) {
            model.Sound soundsKey;
            soundsKey = model.Sound.readFrom(reader);
            sounds[soundsIndex] = soundsKey;
        }
        return Game(myId, players, currentTick, units, loot, projectiles, zone, sounds);
    }

    /// Write Game to writer
    void writeTo(Stream writer) const {
        writer.write(myId);
        writer.write(cast(int)(players.length));
        foreach (playersElement; players) {
            playersElement.writeTo(writer);
        }
        writer.write(currentTick);
        writer.write(cast(int)(units.length));
        foreach (unitsElement; units) {
            unitsElement.writeTo(writer);
        }
        writer.write(cast(int)(loot.length));
        foreach (lootElement; loot) {
            lootElement.writeTo(writer);
        }
        writer.write(cast(int)(projectiles.length));
        foreach (projectilesElement; projectiles) {
            projectilesElement.writeTo(writer);
        }
        zone.writeTo(writer);
        writer.write(cast(int)(sounds.length));
        foreach (soundsElement; sounds) {
            soundsElement.writeTo(writer);
        }
    }
}