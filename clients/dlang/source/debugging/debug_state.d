module debugging.debug_state;

import stream;
import std.conv;
import std.typecons : Nullable;
import debugging.camera;
import model.vec2;

/// Renderer's state
struct DebugState {
    /// Pressed keys
    string[] pressedKeys;
    /// Cursor's position in game coordinates
    model.Vec2 cursorWorldPosition;
    /// Id of unit which is followed by the camera, or None
    Nullable!(int) lockedUnit;
    /// Current camera state
    debugging.Camera camera;

    this(string[] pressedKeys, model.Vec2 cursorWorldPosition, Nullable!(int) lockedUnit, debugging.Camera camera) {
        this.pressedKeys = pressedKeys;
        this.cursorWorldPosition = cursorWorldPosition;
        this.lockedUnit = lockedUnit;
        this.camera = camera;
    }

    /// Read DebugState from reader
    static DebugState readFrom(Stream reader) {
        string[] pressedKeys;
        pressedKeys = new string[reader.readInt()];
        for (int pressedKeysIndex = 0; pressedKeysIndex < pressedKeys.length; pressedKeysIndex++) {
            string pressedKeysKey;
            pressedKeysKey = reader.readString();
            pressedKeys[pressedKeysIndex] = pressedKeysKey;
        }
        model.Vec2 cursorWorldPosition;
        cursorWorldPosition = model.Vec2.readFrom(reader);
        Nullable!(int) lockedUnit;
        if (reader.readBool()) {
            lockedUnit = reader.readInt();
        } else {
            lockedUnit.nullify();
        }
        debugging.Camera camera;
        camera = debugging.Camera.readFrom(reader);
        return DebugState(pressedKeys, cursorWorldPosition, lockedUnit, camera);
    }

    /// Write DebugState to writer
    void writeTo(Stream writer) const {
        writer.write(cast(int)(pressedKeys.length));
        foreach (pressedKeysElement; pressedKeys) {
            writer.write(pressedKeysElement);
        }
        cursorWorldPosition.writeTo(writer);
        if (lockedUnit.isNull()) {
            writer.write(false);
        } else {
            writer.write(true);
            auto lockedUnitValue = lockedUnit.get;
            writer.write(lockedUnitValue);
        }
        camera.writeTo(writer);
    }
}