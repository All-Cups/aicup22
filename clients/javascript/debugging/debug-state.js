const Camera = require.main.require('./debugging/camera');
const Vec2 = require.main.require('./model/vec2');
/**
 * Renderer's state
 */
class DebugState {
    /**
     * Pressed keys
     */
    pressedKeys;
    /**
     * Cursor's position in game coordinates
     */
    cursorWorldPosition;
    /**
     * Id of unit which is followed by the camera, or None
     */
    lockedUnit;
    /**
     * Current camera state
     */
    camera;

    constructor(pressedKeys, cursorWorldPosition, lockedUnit, camera) {
        this.pressedKeys = pressedKeys;
        this.cursorWorldPosition = cursorWorldPosition;
        this.lockedUnit = lockedUnit;
        this.camera = camera;
    }

    /**
     * Read DebugState from input stream
     */
    static async readFrom(stream) {
        let pressedKeys;
        pressedKeys = [];
        for (let pressedKeysCount = await stream.readInt(); pressedKeysCount > 0; pressedKeysCount--) {
            let pressedKeysElement;
            pressedKeysElement = await stream.readString();
            pressedKeys.push(pressedKeysElement);
        }
        let cursorWorldPosition;
        cursorWorldPosition = await Vec2.readFrom(stream);
        let lockedUnit;
        if (await stream.readBool()) {
            lockedUnit = await stream.readInt();
        } else {
            lockedUnit = null;
        }
        let camera;
        camera = await Camera.readFrom(stream);
        return new DebugState(pressedKeys, cursorWorldPosition, lockedUnit, camera);
    }

    /**
     * Write DebugState to output stream
     */
    async writeTo(stream) {
        let pressedKeys = this.pressedKeys;
        await stream.writeInt(pressedKeys.length);
        for (let pressedKeysElement of pressedKeys) {
            await stream.writeString(pressedKeysElement);
        }
        let cursorWorldPosition = this.cursorWorldPosition;
        await cursorWorldPosition.writeTo(stream);
        let lockedUnit = this.lockedUnit;
        if (lockedUnit === null) {
            await stream.writeBool(false);
        } else {
            await stream.writeBool(true);
            await stream.writeInt(lockedUnit);
        }
        let camera = this.camera;
        await camera.writeTo(stream);
    }
}
module.exports = DebugState