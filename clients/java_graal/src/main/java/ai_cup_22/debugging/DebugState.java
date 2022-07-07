package ai_cup_22.debugging;

import ai_cup_22.util.StreamUtil;

/**
 * Renderer's state
 */
public class DebugState {
    /**
     * Pressed keys
     */
    private String[] pressedKeys;

    /**
     * Pressed keys
     */
    public String[] getPressedKeys() {
        return pressedKeys;
    }

    /**
     * Pressed keys
     */
    public void setPressedKeys(String[] value) {
        this.pressedKeys = value;
    }
    /**
     * Cursor's position in game coordinates
     */
    private ai_cup_22.model.Vec2 cursorWorldPosition;

    /**
     * Cursor's position in game coordinates
     */
    public ai_cup_22.model.Vec2 getCursorWorldPosition() {
        return cursorWorldPosition;
    }

    /**
     * Cursor's position in game coordinates
     */
    public void setCursorWorldPosition(ai_cup_22.model.Vec2 value) {
        this.cursorWorldPosition = value;
    }
    /**
     * Id of unit which is followed by the camera, or None
     */
    private Integer lockedUnit;

    /**
     * Id of unit which is followed by the camera, or None
     */
    public Integer getLockedUnit() {
        return lockedUnit;
    }

    /**
     * Id of unit which is followed by the camera, or None
     */
    public void setLockedUnit(Integer value) {
        this.lockedUnit = value;
    }
    /**
     * Current camera state
     */
    private ai_cup_22.debugging.Camera camera;

    /**
     * Current camera state
     */
    public ai_cup_22.debugging.Camera getCamera() {
        return camera;
    }

    /**
     * Current camera state
     */
    public void setCamera(ai_cup_22.debugging.Camera value) {
        this.camera = value;
    }

    public DebugState(String[] pressedKeys, ai_cup_22.model.Vec2 cursorWorldPosition, Integer lockedUnit, ai_cup_22.debugging.Camera camera) {
        this.pressedKeys = pressedKeys;
        this.cursorWorldPosition = cursorWorldPosition;
        this.lockedUnit = lockedUnit;
        this.camera = camera;
    }

    /**
     * Read DebugState from input stream
     */
    public static DebugState readFrom(java.io.InputStream stream) throws java.io.IOException {
        String[] pressedKeys;
        pressedKeys = new String[StreamUtil.readInt(stream)];
        for (int pressedKeysIndex = 0; pressedKeysIndex < pressedKeys.length; pressedKeysIndex++) {
            String pressedKeysElement;
            pressedKeysElement = StreamUtil.readString(stream);
            pressedKeys[pressedKeysIndex] = pressedKeysElement;
        }
        ai_cup_22.model.Vec2 cursorWorldPosition;
        cursorWorldPosition = ai_cup_22.model.Vec2.readFrom(stream);
        Integer lockedUnit;
        if (StreamUtil.readBoolean(stream)) {
            lockedUnit = StreamUtil.readInt(stream);
        } else {
            lockedUnit = null;
        }
        ai_cup_22.debugging.Camera camera;
        camera = ai_cup_22.debugging.Camera.readFrom(stream);
        return new DebugState(pressedKeys, cursorWorldPosition, lockedUnit, camera);
    }

    /**
     * Write DebugState to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeInt(stream, pressedKeys.length);
        for (String pressedKeysElement : pressedKeys) {
            StreamUtil.writeString(stream, pressedKeysElement);
        }
        cursorWorldPosition.writeTo(stream);
        if (lockedUnit == null) {
            StreamUtil.writeBoolean(stream, false);
        } else {
            StreamUtil.writeBoolean(stream, true);
            StreamUtil.writeInt(stream, lockedUnit);
        }
        camera.writeTo(stream);
    }

    /**
     * Get string representation of DebugState
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("DebugState { ");
        stringBuilder.append("pressedKeys: ");
        stringBuilder.append("[ ");
        for (int pressedKeysIndex = 0; pressedKeysIndex < pressedKeys.length; pressedKeysIndex++) {
            if (pressedKeysIndex != 0) {
                stringBuilder.append(", ");
            }
            String pressedKeysElement = pressedKeys[pressedKeysIndex];
            stringBuilder.append('"' + pressedKeysElement + '"');
        }
        stringBuilder.append(" ]");
        stringBuilder.append(", ");
        stringBuilder.append("cursorWorldPosition: ");
        stringBuilder.append(String.valueOf(cursorWorldPosition));
        stringBuilder.append(", ");
        stringBuilder.append("lockedUnit: ");
        stringBuilder.append(String.valueOf(lockedUnit));
        stringBuilder.append(", ");
        stringBuilder.append("camera: ");
        stringBuilder.append(String.valueOf(camera));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}