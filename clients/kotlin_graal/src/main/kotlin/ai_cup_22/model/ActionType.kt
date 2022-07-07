package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Type of action a unit is currently performing
 */
enum class ActionType private constructor(val tag: Int) {
    /**
     * Picking up or dropping loot
     */
    LOOTING(0),
    /**
     * Using a shield potion
     */
    USE_SHIELD_POTION(1);

    companion object {
        /**
         * Read ActionType from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): ActionType {
            return when (StreamUtil.readInt(stream)) {
            LOOTING.tag -> LOOTING
            USE_SHIELD_POTION.tag -> USE_SHIELD_POTION
            else -> throw java.io.IOException("Unexpected tag value")
            }
        }
    }
}