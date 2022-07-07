package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Current state of the game zone
 */
public class Zone {
    /**
     * Current center
     */
    private ai_cup_22.model.Vec2 currentCenter;

    /**
     * Current center
     */
    public ai_cup_22.model.Vec2 getCurrentCenter() {
        return currentCenter;
    }

    /**
     * Current center
     */
    public void setCurrentCenter(ai_cup_22.model.Vec2 value) {
        this.currentCenter = value;
    }
    /**
     * Current radius
     */
    private double currentRadius;

    /**
     * Current radius
     */
    public double getCurrentRadius() {
        return currentRadius;
    }

    /**
     * Current radius
     */
    public void setCurrentRadius(double value) {
        this.currentRadius = value;
    }
    /**
     * Next center
     */
    private ai_cup_22.model.Vec2 nextCenter;

    /**
     * Next center
     */
    public ai_cup_22.model.Vec2 getNextCenter() {
        return nextCenter;
    }

    /**
     * Next center
     */
    public void setNextCenter(ai_cup_22.model.Vec2 value) {
        this.nextCenter = value;
    }
    /**
     * Next radius
     */
    private double nextRadius;

    /**
     * Next radius
     */
    public double getNextRadius() {
        return nextRadius;
    }

    /**
     * Next radius
     */
    public void setNextRadius(double value) {
        this.nextRadius = value;
    }

    public Zone(ai_cup_22.model.Vec2 currentCenter, double currentRadius, ai_cup_22.model.Vec2 nextCenter, double nextRadius) {
        this.currentCenter = currentCenter;
        this.currentRadius = currentRadius;
        this.nextCenter = nextCenter;
        this.nextRadius = nextRadius;
    }

    /**
     * Read Zone from input stream
     */
    public static Zone readFrom(java.io.InputStream stream) throws java.io.IOException {
        ai_cup_22.model.Vec2 currentCenter;
        currentCenter = ai_cup_22.model.Vec2.readFrom(stream);
        double currentRadius;
        currentRadius = StreamUtil.readDouble(stream);
        ai_cup_22.model.Vec2 nextCenter;
        nextCenter = ai_cup_22.model.Vec2.readFrom(stream);
        double nextRadius;
        nextRadius = StreamUtil.readDouble(stream);
        return new Zone(currentCenter, currentRadius, nextCenter, nextRadius);
    }

    /**
     * Write Zone to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        currentCenter.writeTo(stream);
        StreamUtil.writeDouble(stream, currentRadius);
        nextCenter.writeTo(stream);
        StreamUtil.writeDouble(stream, nextRadius);
    }

    /**
     * Get string representation of Zone
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Zone { ");
        stringBuilder.append("currentCenter: ");
        stringBuilder.append(String.valueOf(currentCenter));
        stringBuilder.append(", ");
        stringBuilder.append("currentRadius: ");
        stringBuilder.append(String.valueOf(currentRadius));
        stringBuilder.append(", ");
        stringBuilder.append("nextCenter: ");
        stringBuilder.append(String.valueOf(nextCenter));
        stringBuilder.append(", ");
        stringBuilder.append("nextRadius: ");
        stringBuilder.append(String.valueOf(nextRadius));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}