package ai_cup_22.debugging;

import ai_cup_22.util.StreamUtil;

/**
 * Point + color
 */
public class ColoredVertex {
    /**
     * Position
     */
    private ai_cup_22.model.Vec2 position;

    /**
     * Position
     */
    public ai_cup_22.model.Vec2 getPosition() {
        return position;
    }

    /**
     * Position
     */
    public void setPosition(ai_cup_22.model.Vec2 value) {
        this.position = value;
    }
    /**
     * Color
     */
    private ai_cup_22.debugging.Color color;

    /**
     * Color
     */
    public ai_cup_22.debugging.Color getColor() {
        return color;
    }

    /**
     * Color
     */
    public void setColor(ai_cup_22.debugging.Color value) {
        this.color = value;
    }

    public ColoredVertex(ai_cup_22.model.Vec2 position, ai_cup_22.debugging.Color color) {
        this.position = position;
        this.color = color;
    }

    /**
     * Read ColoredVertex from input stream
     */
    public static ColoredVertex readFrom(java.io.InputStream stream) throws java.io.IOException {
        ai_cup_22.model.Vec2 position;
        position = ai_cup_22.model.Vec2.readFrom(stream);
        ai_cup_22.debugging.Color color;
        color = ai_cup_22.debugging.Color.readFrom(stream);
        return new ColoredVertex(position, color);
    }

    /**
     * Write ColoredVertex to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        position.writeTo(stream);
        color.writeTo(stream);
    }

    /**
     * Get string representation of ColoredVertex
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("ColoredVertex { ");
        stringBuilder.append("position: ");
        stringBuilder.append(String.valueOf(position));
        stringBuilder.append(", ");
        stringBuilder.append("color: ");
        stringBuilder.append(String.valueOf(color));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}