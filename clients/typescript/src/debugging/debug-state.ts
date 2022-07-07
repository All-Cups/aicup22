import { Camera } from "./camera";
import { Vec2 } from "../model/vec2";
import { Stream } from "../stream";

/**
 * Renderer's state
 */
export class DebugState {
    /**
     * Pressed keys
     */
    pressedKeys: Array<string>
    /**
     * Cursor's position in game coordinates
     */
    cursorWorldPosition: Vec2
    /**
     * Id of unit which is followed by the camera, or None
     */
    lockedUnit: number | null
    /**
     * Current camera state
     */
    camera: Camera

    constructor(pressedKeys: Array<string>, cursorWorldPosition: Vec2, lockedUnit: number | null, camera: Camera) {
        this.pressedKeys = pressedKeys;
        this.cursorWorldPosition = cursorWorldPosition;
        this.lockedUnit = lockedUnit;
        this.camera = camera;
    }

    /**
     * Read DebugState from input stream
     */
    static async readFrom(stream: Stream): Promise<DebugState> {
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
        return new DebugState(pressedKeys, cursorWorldPosition, lockedUnit, camera)
    }

    /**
     * Write DebugState to output stream
     */
    async writeTo(stream: Stream) {
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