/**
 * Game's participant (team of units)
 */
class Player {
    /**
     * Unique id
     */
    id;
    /**
     * Number of kills
     */
    kills;
    /**
     * Total damage dealt to enemies
     */
    damage;
    /**
     * Survival place (number of survivor teams currently/at the moment of death)
     */
    place;
    /**
     * Team score
     */
    score;

    constructor(id, kills, damage, place, score) {
        this.id = id;
        this.kills = kills;
        this.damage = damage;
        this.place = place;
        this.score = score;
    }

    /**
     * Read Player from input stream
     */
    static async readFrom(stream) {
        let id;
        id = await stream.readInt();
        let kills;
        kills = await stream.readInt();
        let damage;
        damage = await stream.readDouble();
        let place;
        place = await stream.readInt();
        let score;
        score = await stream.readDouble();
        return new Player(id, kills, damage, place, score);
    }

    /**
     * Write Player to output stream
     */
    async writeTo(stream) {
        let id = this.id;
        await stream.writeInt(id);
        let kills = this.kills;
        await stream.writeInt(kills);
        let damage = this.damage;
        await stream.writeDouble(damage);
        let place = this.place;
        await stream.writeInt(place);
        let score = this.score;
        await stream.writeDouble(score);
    }
}
module.exports = Player