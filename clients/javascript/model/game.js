const Loot = require.main.require('./model/loot');
const Player = require.main.require('./model/player');
const Projectile = require.main.require('./model/projectile');
const Sound = require.main.require('./model/sound');
const Unit = require.main.require('./model/unit');
const Zone = require.main.require('./model/zone');
/**
 * Current game's state
 */
class Game {
    /**
     * Your player's id
     */
    myId;
    /**
     * List of players (teams)
     */
    players;
    /**
     * Current tick
     */
    currentTick;
    /**
     * List of units visible by your team
     */
    units;
    /**
     * List of loot visible by your team
     */
    loot;
    /**
     * List of projectiles visible by your team
     */
    projectiles;
    /**
     * Current state of game zone
     */
    zone;
    /**
     * List of sounds heard by your team during last tick
     */
    sounds;

    constructor(myId, players, currentTick, units, loot, projectiles, zone, sounds) {
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
    static async readFrom(stream) {
        let myId;
        myId = await stream.readInt();
        let players;
        players = [];
        for (let playersCount = await stream.readInt(); playersCount > 0; playersCount--) {
            let playersElement;
            playersElement = await Player.readFrom(stream);
            players.push(playersElement);
        }
        let currentTick;
        currentTick = await stream.readInt();
        let units;
        units = [];
        for (let unitsCount = await stream.readInt(); unitsCount > 0; unitsCount--) {
            let unitsElement;
            unitsElement = await Unit.readFrom(stream);
            units.push(unitsElement);
        }
        let loot;
        loot = [];
        for (let lootCount = await stream.readInt(); lootCount > 0; lootCount--) {
            let lootElement;
            lootElement = await Loot.readFrom(stream);
            loot.push(lootElement);
        }
        let projectiles;
        projectiles = [];
        for (let projectilesCount = await stream.readInt(); projectilesCount > 0; projectilesCount--) {
            let projectilesElement;
            projectilesElement = await Projectile.readFrom(stream);
            projectiles.push(projectilesElement);
        }
        let zone;
        zone = await Zone.readFrom(stream);
        let sounds;
        sounds = [];
        for (let soundsCount = await stream.readInt(); soundsCount > 0; soundsCount--) {
            let soundsElement;
            soundsElement = await Sound.readFrom(stream);
            sounds.push(soundsElement);
        }
        return new Game(myId, players, currentTick, units, loot, projectiles, zone, sounds);
    }

    /**
     * Write Game to output stream
     */
    async writeTo(stream) {
        let myId = this.myId;
        await stream.writeInt(myId);
        let players = this.players;
        await stream.writeInt(players.length);
        for (let playersElement of players) {
            await playersElement.writeTo(stream);
        }
        let currentTick = this.currentTick;
        await stream.writeInt(currentTick);
        let units = this.units;
        await stream.writeInt(units.length);
        for (let unitsElement of units) {
            await unitsElement.writeTo(stream);
        }
        let loot = this.loot;
        await stream.writeInt(loot.length);
        for (let lootElement of loot) {
            await lootElement.writeTo(stream);
        }
        let projectiles = this.projectiles;
        await stream.writeInt(projectiles.length);
        for (let projectilesElement of projectiles) {
            await projectilesElement.writeTo(stream);
        }
        let zone = this.zone;
        await zone.writeTo(stream);
        let sounds = this.sounds;
        await stream.writeInt(sounds.length);
        for (let soundsElement of sounds) {
            await soundsElement.writeTo(stream);
        }
    }
}
module.exports = Game