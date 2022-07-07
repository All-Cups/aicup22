package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Sound heard by one of your units
 */
public class Sound {
    /**
     * Sound type index (starting with 0)
     */
    private int typeIndex;

    /**
     * Sound type index (starting with 0)
     */
    public int getTypeIndex() {
        return typeIndex;
    }

    /**
     * Sound type index (starting with 0)
     */
    public void setTypeIndex(int value) {
        this.typeIndex = value;
    }
    /**
     * Id of unit that heard this sound
     */
    private int unitId;

    /**
     * Id of unit that heard this sound
     */
    public int getUnitId() {
        return unitId;
    }

    /**
     * Id of unit that heard this sound
     */
    public void setUnitId(int value) {
        this.unitId = value;
    }
    /**
     * Position where sound was heard (different from sound source position)
     */
    private ai_cup_22.model.Vec2 position;

    /**
     * Position where sound was heard (different from sound source position)
     */
    public ai_cup_22.model.Vec2 getPosition() {
        return position;
    }

    /**
     * Position where sound was heard (different from sound source position)
     */
    public void setPosition(ai_cup_22.model.Vec2 value) {
        this.position = value;
    }

    public Sound(int typeIndex, int unitId, ai_cup_22.model.Vec2 position) {
        this.typeIndex = typeIndex;
        this.unitId = unitId;
        this.position = position;
    }

    /**
     * Read Sound from input stream
     */
    public static Sound readFrom(java.io.InputStream stream) throws java.io.IOException {
        int typeIndex;
        typeIndex = StreamUtil.readInt(stream);
        int unitId;
        unitId = StreamUtil.readInt(stream);
        ai_cup_22.model.Vec2 position;
        position = ai_cup_22.model.Vec2.readFrom(stream);
        return new Sound(typeIndex, unitId, position);
    }

    /**
     * Write Sound to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeInt(stream, typeIndex);
        StreamUtil.writeInt(stream, unitId);
        position.writeTo(stream);
    }

    /**
     * Get string representation of Sound
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Sound { ");
        stringBuilder.append("typeIndex: ");
        stringBuilder.append(String.valueOf(typeIndex));
        stringBuilder.append(", ");
        stringBuilder.append("unitId: ");
        stringBuilder.append(String.valueOf(unitId));
        stringBuilder.append(", ");
        stringBuilder.append("position: ");
        stringBuilder.append(String.valueOf(position));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}