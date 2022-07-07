package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Current game's state
 */
public class Game {
    /**
     * Your player's id
     */
    private int myId;

    /**
     * Your player's id
     */
    public int getMyId() {
        return myId;
    }

    /**
     * Your player's id
     */
    public void setMyId(int value) {
        this.myId = value;
    }
    /**
     * List of players (teams)
     */
    private ai_cup_22.model.Player[] players;

    /**
     * List of players (teams)
     */
    public ai_cup_22.model.Player[] getPlayers() {
        return players;
    }

    /**
     * List of players (teams)
     */
    public void setPlayers(ai_cup_22.model.Player[] value) {
        this.players = value;
    }
    /**
     * Current tick
     */
    private int currentTick;

    /**
     * Current tick
     */
    public int getCurrentTick() {
        return currentTick;
    }

    /**
     * Current tick
     */
    public void setCurrentTick(int value) {
        this.currentTick = value;
    }
    /**
     * List of units visible by your team
     */
    private ai_cup_22.model.Unit[] units;

    /**
     * List of units visible by your team
     */
    public ai_cup_22.model.Unit[] getUnits() {
        return units;
    }

    /**
     * List of units visible by your team
     */
    public void setUnits(ai_cup_22.model.Unit[] value) {
        this.units = value;
    }
    /**
     * List of loot visible by your team
     */
    private ai_cup_22.model.Loot[] loot;

    /**
     * List of loot visible by your team
     */
    public ai_cup_22.model.Loot[] getLoot() {
        return loot;
    }

    /**
     * List of loot visible by your team
     */
    public void setLoot(ai_cup_22.model.Loot[] value) {
        this.loot = value;
    }
    /**
     * List of projectiles visible by your team
     */
    private ai_cup_22.model.Projectile[] projectiles;

    /**
     * List of projectiles visible by your team
     */
    public ai_cup_22.model.Projectile[] getProjectiles() {
        return projectiles;
    }

    /**
     * List of projectiles visible by your team
     */
    public void setProjectiles(ai_cup_22.model.Projectile[] value) {
        this.projectiles = value;
    }
    /**
     * Current state of game zone
     */
    private ai_cup_22.model.Zone zone;

    /**
     * Current state of game zone
     */
    public ai_cup_22.model.Zone getZone() {
        return zone;
    }

    /**
     * Current state of game zone
     */
    public void setZone(ai_cup_22.model.Zone value) {
        this.zone = value;
    }
    /**
     * List of sounds heard by your team during last tick
     */
    private ai_cup_22.model.Sound[] sounds;

    /**
     * List of sounds heard by your team during last tick
     */
    public ai_cup_22.model.Sound[] getSounds() {
        return sounds;
    }

    /**
     * List of sounds heard by your team during last tick
     */
    public void setSounds(ai_cup_22.model.Sound[] value) {
        this.sounds = value;
    }

    public Game(int myId, ai_cup_22.model.Player[] players, int currentTick, ai_cup_22.model.Unit[] units, ai_cup_22.model.Loot[] loot, ai_cup_22.model.Projectile[] projectiles, ai_cup_22.model.Zone zone, ai_cup_22.model.Sound[] sounds) {
        this.myId = myId;
        this.players = players;
        this.currentTick = currentTick;
        this.units = units;
        this.loot = loot;
        this.projectiles = projectiles;
        this.zone = zone;
        this.sounds = sounds;
    }

    /**
     * Read Game from input stream
     */
    public static Game readFrom(java.io.InputStream stream) throws java.io.IOException {
        int myId;
        myId = StreamUtil.readInt(stream);
        ai_cup_22.model.Player[] players;
        players = new ai_cup_22.model.Player[StreamUtil.readInt(stream)];
        for (int playersIndex = 0; playersIndex < players.length; playersIndex++) {
            ai_cup_22.model.Player playersElement;
            playersElement = ai_cup_22.model.Player.readFrom(stream);
            players[playersIndex] = playersElement;
        }
        int currentTick;
        currentTick = StreamUtil.readInt(stream);
        ai_cup_22.model.Unit[] units;
        units = new ai_cup_22.model.Unit[StreamUtil.readInt(stream)];
        for (int unitsIndex = 0; unitsIndex < units.length; unitsIndex++) {
            ai_cup_22.model.Unit unitsElement;
            unitsElement = ai_cup_22.model.Unit.readFrom(stream);
            units[unitsIndex] = unitsElement;
        }
        ai_cup_22.model.Loot[] loot;
        loot = new ai_cup_22.model.Loot[StreamUtil.readInt(stream)];
        for (int lootIndex = 0; lootIndex < loot.length; lootIndex++) {
            ai_cup_22.model.Loot lootElement;
            lootElement = ai_cup_22.model.Loot.readFrom(stream);
            loot[lootIndex] = lootElement;
        }
        ai_cup_22.model.Projectile[] projectiles;
        projectiles = new ai_cup_22.model.Projectile[StreamUtil.readInt(stream)];
        for (int projectilesIndex = 0; projectilesIndex < projectiles.length; projectilesIndex++) {
            ai_cup_22.model.Projectile projectilesElement;
            projectilesElement = ai_cup_22.model.Projectile.readFrom(stream);
            projectiles[projectilesIndex] = projectilesElement;
        }
        ai_cup_22.model.Zone zone;
        zone = ai_cup_22.model.Zone.readFrom(stream);
        ai_cup_22.model.Sound[] sounds;
        sounds = new ai_cup_22.model.Sound[StreamUtil.readInt(stream)];
        for (int soundsIndex = 0; soundsIndex < sounds.length; soundsIndex++) {
            ai_cup_22.model.Sound soundsElement;
            soundsElement = ai_cup_22.model.Sound.readFrom(stream);
            sounds[soundsIndex] = soundsElement;
        }
        return new Game(myId, players, currentTick, units, loot, projectiles, zone, sounds);
    }

    /**
     * Write Game to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeInt(stream, myId);
        StreamUtil.writeInt(stream, players.length);
        for (ai_cup_22.model.Player playersElement : players) {
            playersElement.writeTo(stream);
        }
        StreamUtil.writeInt(stream, currentTick);
        StreamUtil.writeInt(stream, units.length);
        for (ai_cup_22.model.Unit unitsElement : units) {
            unitsElement.writeTo(stream);
        }
        StreamUtil.writeInt(stream, loot.length);
        for (ai_cup_22.model.Loot lootElement : loot) {
            lootElement.writeTo(stream);
        }
        StreamUtil.writeInt(stream, projectiles.length);
        for (ai_cup_22.model.Projectile projectilesElement : projectiles) {
            projectilesElement.writeTo(stream);
        }
        zone.writeTo(stream);
        StreamUtil.writeInt(stream, sounds.length);
        for (ai_cup_22.model.Sound soundsElement : sounds) {
            soundsElement.writeTo(stream);
        }
    }

    /**
     * Get string representation of Game
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Game { ");
        stringBuilder.append("myId: ");
        stringBuilder.append(String.valueOf(myId));
        stringBuilder.append(", ");
        stringBuilder.append("players: ");
        stringBuilder.append("[ ");
        for (int playersIndex = 0; playersIndex < players.length; playersIndex++) {
            if (playersIndex != 0) {
                stringBuilder.append(", ");
            }
            ai_cup_22.model.Player playersElement = players[playersIndex];
            stringBuilder.append(String.valueOf(playersElement));
        }
        stringBuilder.append(" ]");
        stringBuilder.append(", ");
        stringBuilder.append("currentTick: ");
        stringBuilder.append(String.valueOf(currentTick));
        stringBuilder.append(", ");
        stringBuilder.append("units: ");
        stringBuilder.append("[ ");
        for (int unitsIndex = 0; unitsIndex < units.length; unitsIndex++) {
            if (unitsIndex != 0) {
                stringBuilder.append(", ");
            }
            ai_cup_22.model.Unit unitsElement = units[unitsIndex];
            stringBuilder.append(String.valueOf(unitsElement));
        }
        stringBuilder.append(" ]");
        stringBuilder.append(", ");
        stringBuilder.append("loot: ");
        stringBuilder.append("[ ");
        for (int lootIndex = 0; lootIndex < loot.length; lootIndex++) {
            if (lootIndex != 0) {
                stringBuilder.append(", ");
            }
            ai_cup_22.model.Loot lootElement = loot[lootIndex];
            stringBuilder.append(String.valueOf(lootElement));
        }
        stringBuilder.append(" ]");
        stringBuilder.append(", ");
        stringBuilder.append("projectiles: ");
        stringBuilder.append("[ ");
        for (int projectilesIndex = 0; projectilesIndex < projectiles.length; projectilesIndex++) {
            if (projectilesIndex != 0) {
                stringBuilder.append(", ");
            }
            ai_cup_22.model.Projectile projectilesElement = projectiles[projectilesIndex];
            stringBuilder.append(String.valueOf(projectilesElement));
        }
        stringBuilder.append(" ]");
        stringBuilder.append(", ");
        stringBuilder.append("zone: ");
        stringBuilder.append(String.valueOf(zone));
        stringBuilder.append(", ");
        stringBuilder.append("sounds: ");
        stringBuilder.append("[ ");
        for (int soundsIndex = 0; soundsIndex < sounds.length; soundsIndex++) {
            if (soundsIndex != 0) {
                stringBuilder.append(", ");
            }
            ai_cup_22.model.Sound soundsElement = sounds[soundsIndex];
            stringBuilder.append(String.valueOf(soundsElement));
        }
        stringBuilder.append(" ]");
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}