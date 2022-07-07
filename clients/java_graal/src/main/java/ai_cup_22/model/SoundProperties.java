package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Sound properties
 */
public class SoundProperties {
    /**
     * Name
     */
    private String name;

    /**
     * Name
     */
    public String getName() {
        return name;
    }

    /**
     * Name
     */
    public void setName(String value) {
        this.name = value;
    }
    /**
     * Distance from which the sound can be heard
     */
    private double distance;

    /**
     * Distance from which the sound can be heard
     */
    public double getDistance() {
        return distance;
    }

    /**
     * Distance from which the sound can be heard
     */
    public void setDistance(double value) {
        this.distance = value;
    }
    /**
     * Offset modifier
     */
    private double offset;

    /**
     * Offset modifier
     */
    public double getOffset() {
        return offset;
    }

    /**
     * Offset modifier
     */
    public void setOffset(double value) {
        this.offset = value;
    }

    public SoundProperties(String name, double distance, double offset) {
        this.name = name;
        this.distance = distance;
        this.offset = offset;
    }

    /**
     * Read SoundProperties from input stream
     */
    public static SoundProperties readFrom(java.io.InputStream stream) throws java.io.IOException {
        String name;
        name = StreamUtil.readString(stream);
        double distance;
        distance = StreamUtil.readDouble(stream);
        double offset;
        offset = StreamUtil.readDouble(stream);
        return new SoundProperties(name, distance, offset);
    }

    /**
     * Write SoundProperties to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeString(stream, name);
        StreamUtil.writeDouble(stream, distance);
        StreamUtil.writeDouble(stream, offset);
    }

    /**
     * Get string representation of SoundProperties
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("SoundProperties { ");
        stringBuilder.append("name: ");
        stringBuilder.append('"' + name + '"');
        stringBuilder.append(", ");
        stringBuilder.append("distance: ");
        stringBuilder.append(String.valueOf(distance));
        stringBuilder.append(", ");
        stringBuilder.append("offset: ");
        stringBuilder.append(String.valueOf(offset));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}