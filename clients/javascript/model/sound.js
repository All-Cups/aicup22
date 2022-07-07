const Vec2 = require.main.require('./model/vec2');
/**
 * Sound heard by one of your units
 */
class Sound {
    /**
     * Sound type index (starting with 0)
     */
    typeIndex;
    /**
     * Id of unit that heard this sound
     */
    unitId;
    /**
     * Position where sound was heard (different from sound source position)
     */
    position;

    constructor(typeIndex, unitId, position) {
        this.typeIndex = typeIndex;
        this.unitId = unitId;
        this.position = position;
    }

    /**
     * Read Sound from input stream
     */
    static async readFrom(stream) {
        let typeIndex;
        typeIndex = await stream.readInt();
        let unitId;
        unitId = await stream.readInt();
        let position;
        position = await Vec2.readFrom(stream);
        return new Sound(typeIndex, unitId, position);
    }

    /**
     * Write Sound to output stream
     */
    async writeTo(stream) {
        let typeIndex = this.typeIndex;
        await stream.writeInt(typeIndex);
        let unitId = this.unitId;
        await stream.writeInt(unitId);
        let position = this.position;
        await position.writeTo(stream);
    }
}
module.exports = Sound