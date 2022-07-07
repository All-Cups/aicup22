package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * Renderer's state
 */
class DebugState {
    /**
     * Pressed keys
     */
    var pressedKeys: Array<String>
    /**
     * Cursor's position in game coordinates
     */
    var cursorWorldPosition: ai_cup_22.model.Vec2
    /**
     * Id of unit which is followed by the camera, or None
     */
    var lockedUnit: Int?
    /**
     * Current camera state
     */
    var camera: ai_cup_22.debugging.Camera

    constructor(pressedKeys: Array<String>, cursorWorldPosition: ai_cup_22.model.Vec2, lockedUnit: Int?, camera: ai_cup_22.debugging.Camera) {
        this.pressedKeys = pressedKeys
        this.cursorWorldPosition = cursorWorldPosition
        this.lockedUnit = lockedUnit
        this.camera = camera
    }

    /**
     * Write DebugState to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeInt(stream, pressedKeys.size)
        for (pressedKeysElement in pressedKeys) {
            StreamUtil.writeString(stream, pressedKeysElement)
        }
        cursorWorldPosition.writeTo(stream)
        val lockedUnitValue = lockedUnit
        if (lockedUnitValue == null) {
            StreamUtil.writeBoolean(stream, false)
        } else {
            StreamUtil.writeBoolean(stream, true)
            StreamUtil.writeInt(stream, lockedUnitValue)
        }
        camera.writeTo(stream)
    }

    /**
     * Get string representation of DebugState
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("DebugState { ")
        stringBuilder.append("pressedKeys: ")
        stringBuilder.append("[ ")
        var pressedKeysIndex = 0
        for (pressedKeysElement in pressedKeys) {
            if (pressedKeysIndex != 0) {
                stringBuilder.append(", ")
            }
            stringBuilder.append('"' + pressedKeysElement + '"')
            pressedKeysIndex++
        }
        stringBuilder.append(" ]")
        stringBuilder.append(", ")
        stringBuilder.append("cursorWorldPosition: ")
        stringBuilder.append(cursorWorldPosition)
        stringBuilder.append(", ")
        stringBuilder.append("lockedUnit: ")
        stringBuilder.append(lockedUnit)
        stringBuilder.append(", ")
        stringBuilder.append("camera: ")
        stringBuilder.append(camera)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read DebugState from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): DebugState {
            var pressedKeys: Array<String>
            pressedKeys = Array(StreamUtil.readInt(stream), {
                var pressedKeysElement: String
                pressedKeysElement = StreamUtil.readString(stream)
                pressedKeysElement
            })
            var cursorWorldPosition: ai_cup_22.model.Vec2
            cursorWorldPosition = ai_cup_22.model.Vec2.readFrom(stream)
            var lockedUnit: Int?
            if (StreamUtil.readBoolean(stream)) {
                lockedUnit = StreamUtil.readInt(stream)
            } else {
                lockedUnit = null
            }
            var camera: ai_cup_22.debugging.Camera
            camera = ai_cup_22.debugging.Camera.readFrom(stream)
            return DebugState(pressedKeys, cursorWorldPosition, lockedUnit, camera)
        }
    }
}