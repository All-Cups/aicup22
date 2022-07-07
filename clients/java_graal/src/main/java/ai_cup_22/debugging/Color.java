package ai_cup_22.debugging;

import ai_cup_22.util.StreamUtil;

/**
 * RGBA Color
 */
public class Color {
    /**
     * Red component
     */
    private double r;

    /**
     * Red component
     */
    public double getR() {
        return r;
    }

    /**
     * Red component
     */
    public void setR(double value) {
        this.r = value;
    }
    /**
     * Green component
     */
    private double g;

    /**
     * Green component
     */
    public double getG() {
        return g;
    }

    /**
     * Green component
     */
    public void setG(double value) {
        this.g = value;
    }
    /**
     * Blue component
     */
    private double b;

    /**
     * Blue component
     */
    public double getB() {
        return b;
    }

    /**
     * Blue component
     */
    public void setB(double value) {
        this.b = value;
    }
    /**
     * Alpha (opacity) component
     */
    private double a;

    /**
     * Alpha (opacity) component
     */
    public double getA() {
        return a;
    }

    /**
     * Alpha (opacity) component
     */
    public void setA(double value) {
        this.a = value;
    }

    public Color(double r, double g, double b, double a) {
        this.r = r;
        this.g = g;
        this.b = b;
        this.a = a;
    }

    /**
     * Read Color from input stream
     */
    public static Color readFrom(java.io.InputStream stream) throws java.io.IOException {
        double r;
        r = StreamUtil.readDouble(stream);
        double g;
        g = StreamUtil.readDouble(stream);
        double b;
        b = StreamUtil.readDouble(stream);
        double a;
        a = StreamUtil.readDouble(stream);
        return new Color(r, g, b, a);
    }

    /**
     * Write Color to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeDouble(stream, r);
        StreamUtil.writeDouble(stream, g);
        StreamUtil.writeDouble(stream, b);
        StreamUtil.writeDouble(stream, a);
    }

    /**
     * Get string representation of Color
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Color { ");
        stringBuilder.append("r: ");
        stringBuilder.append(String.valueOf(r));
        stringBuilder.append(", ");
        stringBuilder.append("g: ");
        stringBuilder.append(String.valueOf(g));
        stringBuilder.append(", ");
        stringBuilder.append("b: ");
        stringBuilder.append(String.valueOf(b));
        stringBuilder.append(", ");
        stringBuilder.append("a: ");
        stringBuilder.append(String.valueOf(a));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}