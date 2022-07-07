package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * Renderer's state
 *
 * @param pressedKeys Pressed keys
 * @param cursorWorldPosition Cursor's position in game coordinates
 * @param lockedUnit Id of unit which is followed by the camera, or None
 * @param camera Current camera state
 */
case class DebugState(pressedKeys: Seq[String], cursorWorldPosition: ai_cup_22.model.Vec2, lockedUnit: Option[Int], camera: ai_cup_22.debugging.Camera) {
    /**
     * Write DebugState to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeInt(stream, pressedKeys.length)
        pressedKeys.foreach { value =>
            StreamUtil.writeString(stream, value)
        }
        cursorWorldPosition.writeTo(stream)
        lockedUnit match {
            case None => StreamUtil.writeBoolean(stream, false)
            case Some(value) => {
                StreamUtil.writeBoolean(stream, true)
                StreamUtil.writeInt(stream, value)
            }
        }
        camera.writeTo(stream)
    }

    /**
     * Get string representation of DebugState
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("DebugState { ")
        stringBuilder.append("pressedKeys: ")
        stringBuilder.append(pressedKeys)
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
        stringBuilder.toString()
    }
}

object DebugState {
    /**
     * Read DebugState from input stream
     */
    def readFrom(stream: java.io.InputStream): DebugState = DebugState(
        (0 until StreamUtil.readInt(stream)).map { _ =>
            StreamUtil.readString(stream)
        },
        ai_cup_22.model.Vec2.readFrom(stream),
        if (StreamUtil.readBoolean(stream)) Some(
            StreamUtil.readInt(stream)
        ) else None,
        ai_cup_22.debugging.Camera.readFrom(stream)
    )
}