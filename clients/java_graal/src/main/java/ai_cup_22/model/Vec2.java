package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * 2 dimensional vector.
 */
public class Vec2 {
    /**
     * `x` coordinate of the vector
     */
    private double x;

    /**
     * `x` coordinate of the vector
     */
    public double getX() {
        return x;
    }

    /**
     * `x` coordinate of the vector
     */
    public void setX(double value) {
        this.x = value;
    }
    /**
     * `y` coordinate of the vector
     */
    private double y;

    /**
     * `y` coordinate of the vector
     */
    public double getY() {
        return y;
    }

    /**
     * `y` coordinate of the vector
     */
    public void setY(double value) {
        this.y = value;
    }

    public Vec2(double x, double y) {
        this.x = x;
        this.y = y;
    }

    /**
     * Read Vec2 from input stream
     */
    public static Vec2 readFrom(java.io.InputStream stream) throws java.io.IOException {
        double x;
        x = StreamUtil.readDouble(stream);
        double y;
        y = StreamUtil.readDouble(stream);
        return new Vec2(x, y);
    }

    /**
     * Write Vec2 to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeDouble(stream, x);
        StreamUtil.writeDouble(stream, y);
    }

    /**
     * Get string representation of Vec2
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Vec2 { ");
        stringBuilder.append("x: ");
        stringBuilder.append(String.valueOf(x));
        stringBuilder.append(", ");
        stringBuilder.append("y: ");
        stringBuilder.append(String.valueOf(y));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}