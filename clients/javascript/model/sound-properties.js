/**
 * Sound properties
 */
class SoundProperties {
    /**
     * Name
     */
    name;
    /**
     * Distance from which the sound can be heard
     */
    distance;
    /**
     * Offset modifier
     */
    offset;

    constructor(name, distance, offset) {
        this.name = name;
        this.distance = distance;
        this.offset = offset;
    }

    /**
     * Read SoundProperties from input stream
     */
    static async readFrom(stream) {
        let name;
        name = await stream.readString();
        let distance;
        distance = await stream.readDouble();
        let offset;
        offset = await stream.readDouble();
        return new SoundProperties(name, distance, offset);
    }

    /**
     * Write SoundProperties to output stream
     */
    async writeTo(stream) {
        let name = this.name;
        await stream.writeString(name);
        let distance = this.distance;
        await stream.writeDouble(distance);
        let offset = this.offset;
        await stream.writeDouble(offset);
    }
}
module.exports = SoundProperties