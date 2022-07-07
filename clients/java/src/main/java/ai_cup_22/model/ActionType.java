package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Type of action a unit is currently performing
 */
public enum ActionType {
    /**
     * Picking up or dropping loot
     */
    LOOTING(0),
    /**
     * Using a shield potion
     */
    USE_SHIELD_POTION(1);

    public int tag;

    ActionType(int tag) {
        this.tag = tag;
    }

    /**
     * Read ActionType from input stream
     */
    public static ActionType readFrom(java.io.InputStream stream) throws java.io.IOException {
        switch (StreamUtil.readInt(stream)) {
        case 0:
            return LOOTING;
        case 1:
            return USE_SHIELD_POTION;
        default:
            throw new java.io.IOException("Unexpected tag value");
        }
    }
}