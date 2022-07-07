package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Type of action a unit is currently performing
 */
sealed abstract class ActionType (val tag: Int) {
    /**
     * Write ActionType to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeInt(stream, tag)
    }
}

object ActionType {
    /**
     * Picking up or dropping loot
     */
    case object LOOTING extends ActionType(0)
    /**
     * Using a shield potion
     */
    case object USE_SHIELD_POTION extends ActionType(1)

    /**
     * Read ActionType from input stream
     */
    def readFrom(stream: java.io.InputStream): ActionType =
        StreamUtil.readInt(stream) match {
            case LOOTING.tag => LOOTING
            case USE_SHIELD_POTION.tag => USE_SHIELD_POTION
            case _ => throw new java.io.IOException("Unexpected tag value")
        }
}