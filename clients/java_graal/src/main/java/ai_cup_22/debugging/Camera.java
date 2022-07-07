package ai_cup_22.debugging;

import ai_cup_22.util.StreamUtil;

/**
 * Camera state
 */
public class Camera {
    /**
     * Center
     */
    private ai_cup_22.model.Vec2 center;

    /**
     * Center
     */
    public ai_cup_22.model.Vec2 getCenter() {
        return center;
    }

    /**
     * Center
     */
    public void setCenter(ai_cup_22.model.Vec2 value) {
        this.center = value;
    }
    /**
     * Rotation
     */
    private double rotation;

    /**
     * Rotation
     */
    public double getRotation() {
        return rotation;
    }

    /**
     * Rotation
     */
    public void setRotation(double value) {
        this.rotation = value;
    }
    /**
     * Attack angle
     */
    private double attack;

    /**
     * Attack angle
     */
    public double getAttack() {
        return attack;
    }

    /**
     * Attack angle
     */
    public void setAttack(double value) {
        this.attack = value;
    }
    /**
     * Vertical field of view
     */
    private double fov;

    /**
     * Vertical field of view
     */
    public double getFov() {
        return fov;
    }

    /**
     * Vertical field of view
     */
    public void setFov(double value) {
        this.fov = value;
    }

    public Camera(ai_cup_22.model.Vec2 center, double rotation, double attack, double fov) {
        this.center = center;
        this.rotation = rotation;
        this.attack = attack;
        this.fov = fov;
    }

    /**
     * Read Camera from input stream
     */
    public static Camera readFrom(java.io.InputStream stream) throws java.io.IOException {
        ai_cup_22.model.Vec2 center;
        center = ai_cup_22.model.Vec2.readFrom(stream);
        double rotation;
        rotation = StreamUtil.readDouble(stream);
        double attack;
        attack = StreamUtil.readDouble(stream);
        double fov;
        fov = StreamUtil.readDouble(stream);
        return new Camera(center, rotation, attack, fov);
    }

    /**
     * Write Camera to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        center.writeTo(stream);
        StreamUtil.writeDouble(stream, rotation);
        StreamUtil.writeDouble(stream, attack);
        StreamUtil.writeDouble(stream, fov);
    }

    /**
     * Get string representation of Camera
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Camera { ");
        stringBuilder.append("center: ");
        stringBuilder.append(String.valueOf(center));
        stringBuilder.append(", ");
        stringBuilder.append("rotation: ");
        stringBuilder.append(String.valueOf(rotation));
        stringBuilder.append(", ");
        stringBuilder.append("attack: ");
        stringBuilder.append(String.valueOf(attack));
        stringBuilder.append(", ");
        stringBuilder.append("fov: ");
        stringBuilder.append(String.valueOf(fov));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}