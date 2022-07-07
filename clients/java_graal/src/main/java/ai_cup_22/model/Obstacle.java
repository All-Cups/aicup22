package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * An obstacle on the map
 */
public class Obstacle {
    /**
     * Unique id
     */
    private int id;

    /**
     * Unique id
     */
    public int getId() {
        return id;
    }

    /**
     * Unique id
     */
    public void setId(int value) {
        this.id = value;
    }
    /**
     * Center position
     */
    private ai_cup_22.model.Vec2 position;

    /**
     * Center position
     */
    public ai_cup_22.model.Vec2 getPosition() {
        return position;
    }

    /**
     * Center position
     */
    public void setPosition(ai_cup_22.model.Vec2 value) {
        this.position = value;
    }
    /**
     * Obstacle's radius
     */
    private double radius;

    /**
     * Obstacle's radius
     */
    public double getRadius() {
        return radius;
    }

    /**
     * Obstacle's radius
     */
    public void setRadius(double value) {
        this.radius = value;
    }
    /**
     * Whether units can see through this obstacle, or it blocks the view
     */
    private boolean canSeeThrough;

    /**
     * Whether units can see through this obstacle, or it blocks the view
     */
    public boolean isCanSeeThrough() {
        return canSeeThrough;
    }

    /**
     * Whether units can see through this obstacle, or it blocks the view
     */
    public void setCanSeeThrough(boolean value) {
        this.canSeeThrough = value;
    }
    /**
     * Whether projectiles can go through this obstacle
     */
    private boolean canShootThrough;

    /**
     * Whether projectiles can go through this obstacle
     */
    public boolean isCanShootThrough() {
        return canShootThrough;
    }

    /**
     * Whether projectiles can go through this obstacle
     */
    public void setCanShootThrough(boolean value) {
        this.canShootThrough = value;
    }

    public Obstacle(int id, ai_cup_22.model.Vec2 position, double radius, boolean canSeeThrough, boolean canShootThrough) {
        this.id = id;
        this.position = position;
        this.radius = radius;
        this.canSeeThrough = canSeeThrough;
        this.canShootThrough = canShootThrough;
    }

    /**
     * Read Obstacle from input stream
     */
    public static Obstacle readFrom(java.io.InputStream stream) throws java.io.IOException {
        int id;
        id = StreamUtil.readInt(stream);
        ai_cup_22.model.Vec2 position;
        position = ai_cup_22.model.Vec2.readFrom(stream);
        double radius;
        radius = StreamUtil.readDouble(stream);
        boolean canSeeThrough;
        canSeeThrough = StreamUtil.readBoolean(stream);
        boolean canShootThrough;
        canShootThrough = StreamUtil.readBoolean(stream);
        return new Obstacle(id, position, radius, canSeeThrough, canShootThrough);
    }

    /**
     * Write Obstacle to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeInt(stream, id);
        position.writeTo(stream);
        StreamUtil.writeDouble(stream, radius);
        StreamUtil.writeBoolean(stream, canSeeThrough);
        StreamUtil.writeBoolean(stream, canShootThrough);
    }

    /**
     * Get string representation of Obstacle
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Obstacle { ");
        stringBuilder.append("id: ");
        stringBuilder.append(String.valueOf(id));
        stringBuilder.append(", ");
        stringBuilder.append("position: ");
        stringBuilder.append(String.valueOf(position));
        stringBuilder.append(", ");
        stringBuilder.append("radius: ");
        stringBuilder.append(String.valueOf(radius));
        stringBuilder.append(", ");
        stringBuilder.append("canSeeThrough: ");
        stringBuilder.append(String.valueOf(canSeeThrough));
        stringBuilder.append(", ");
        stringBuilder.append("canShootThrough: ");
        stringBuilder.append(String.valueOf(canShootThrough));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}