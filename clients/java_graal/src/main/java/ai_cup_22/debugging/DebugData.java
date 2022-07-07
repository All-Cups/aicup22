package ai_cup_22.debugging;

import ai_cup_22.util.StreamUtil;

/**
 * Data for debug rendering
 */
public abstract class DebugData {
    /**
     * Write DebugData to output stream
     */
    public abstract void writeTo(java.io.OutputStream stream) throws java.io.IOException;

    /**
     * Read DebugData from input stream
     */
    public static DebugData readFrom(java.io.InputStream stream) throws java.io.IOException {
        switch (StreamUtil.readInt(stream)) {
            case PlacedText.TAG:
                return PlacedText.readFrom(stream);
            case Circle.TAG:
                return Circle.readFrom(stream);
            case GradientCircle.TAG:
                return GradientCircle.readFrom(stream);
            case Ring.TAG:
                return Ring.readFrom(stream);
            case Pie.TAG:
                return Pie.readFrom(stream);
            case Arc.TAG:
                return Arc.readFrom(stream);
            case Rect.TAG:
                return Rect.readFrom(stream);
            case Polygon.TAG:
                return Polygon.readFrom(stream);
            case GradientPolygon.TAG:
                return GradientPolygon.readFrom(stream);
            case Segment.TAG:
                return Segment.readFrom(stream);
            case GradientSegment.TAG:
                return GradientSegment.readFrom(stream);
            case PolyLine.TAG:
                return PolyLine.readFrom(stream);
            case GradientPolyLine.TAG:
                return GradientPolyLine.readFrom(stream);
            default:
                throw new java.io.IOException("Unexpected tag value");
        }
    }

    /**
     * Text
     */
    public static class PlacedText extends DebugData {
        public static final int TAG = 0;
    
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
         * Text
         */
        private String text;
    
        /**
         * Text
         */
        public String getText() {
            return text;
        }
    
        /**
         * Text
         */
        public void setText(String value) {
            this.text = value;
        }
        /**
         * Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
         */
        private ai_cup_22.model.Vec2 alignment;
    
        /**
         * Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
         */
        public ai_cup_22.model.Vec2 getAlignment() {
            return alignment;
        }
    
        /**
         * Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
         */
        public void setAlignment(ai_cup_22.model.Vec2 value) {
            this.alignment = value;
        }
        /**
         * Size
         */
        private double size;
    
        /**
         * Size
         */
        public double getSize() {
            return size;
        }
    
        /**
         * Size
         */
        public void setSize(double value) {
            this.size = value;
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
    
        public PlacedText(ai_cup_22.model.Vec2 position, String text, ai_cup_22.model.Vec2 alignment, double size, ai_cup_22.debugging.Color color) {
            this.position = position;
            this.text = text;
            this.alignment = alignment;
            this.size = size;
            this.color = color;
        }
    
        /**
         * Read PlacedText from input stream
         */
        public static PlacedText readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Vec2 position;
            position = ai_cup_22.model.Vec2.readFrom(stream);
            String text;
            text = StreamUtil.readString(stream);
            ai_cup_22.model.Vec2 alignment;
            alignment = ai_cup_22.model.Vec2.readFrom(stream);
            double size;
            size = StreamUtil.readDouble(stream);
            ai_cup_22.debugging.Color color;
            color = ai_cup_22.debugging.Color.readFrom(stream);
            return new PlacedText(position, text, alignment, size, color);
        }
    
        /**
         * Write PlacedText to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            position.writeTo(stream);
            StreamUtil.writeString(stream, text);
            alignment.writeTo(stream);
            StreamUtil.writeDouble(stream, size);
            color.writeTo(stream);
        }
    
        /**
         * Get string representation of PlacedText
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("PlacedText { ");
            stringBuilder.append("position: ");
            stringBuilder.append(String.valueOf(position));
            stringBuilder.append(", ");
            stringBuilder.append("text: ");
            stringBuilder.append('"' + text + '"');
            stringBuilder.append(", ");
            stringBuilder.append("alignment: ");
            stringBuilder.append(String.valueOf(alignment));
            stringBuilder.append(", ");
            stringBuilder.append("size: ");
            stringBuilder.append(String.valueOf(size));
            stringBuilder.append(", ");
            stringBuilder.append("color: ");
            stringBuilder.append(String.valueOf(color));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Circle
     */
    public static class Circle extends DebugData {
        public static final int TAG = 1;
    
        /**
         * Position of the center
         */
        private ai_cup_22.model.Vec2 position;
    
        /**
         * Position of the center
         */
        public ai_cup_22.model.Vec2 getPosition() {
            return position;
        }
    
        /**
         * Position of the center
         */
        public void setPosition(ai_cup_22.model.Vec2 value) {
            this.position = value;
        }
        /**
         * Radius
         */
        private double radius;
    
        /**
         * Radius
         */
        public double getRadius() {
            return radius;
        }
    
        /**
         * Radius
         */
        public void setRadius(double value) {
            this.radius = value;
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
    
        public Circle(ai_cup_22.model.Vec2 position, double radius, ai_cup_22.debugging.Color color) {
            this.position = position;
            this.radius = radius;
            this.color = color;
        }
    
        /**
         * Read Circle from input stream
         */
        public static Circle readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Vec2 position;
            position = ai_cup_22.model.Vec2.readFrom(stream);
            double radius;
            radius = StreamUtil.readDouble(stream);
            ai_cup_22.debugging.Color color;
            color = ai_cup_22.debugging.Color.readFrom(stream);
            return new Circle(position, radius, color);
        }
    
        /**
         * Write Circle to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            position.writeTo(stream);
            StreamUtil.writeDouble(stream, radius);
            color.writeTo(stream);
        }
    
        /**
         * Get string representation of Circle
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Circle { ");
            stringBuilder.append("position: ");
            stringBuilder.append(String.valueOf(position));
            stringBuilder.append(", ");
            stringBuilder.append("radius: ");
            stringBuilder.append(String.valueOf(radius));
            stringBuilder.append(", ");
            stringBuilder.append("color: ");
            stringBuilder.append(String.valueOf(color));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Circle with gradient fill
     */
    public static class GradientCircle extends DebugData {
        public static final int TAG = 2;
    
        /**
         * Position of the center
         */
        private ai_cup_22.model.Vec2 position;
    
        /**
         * Position of the center
         */
        public ai_cup_22.model.Vec2 getPosition() {
            return position;
        }
    
        /**
         * Position of the center
         */
        public void setPosition(ai_cup_22.model.Vec2 value) {
            this.position = value;
        }
        /**
         * Radius
         */
        private double radius;
    
        /**
         * Radius
         */
        public double getRadius() {
            return radius;
        }
    
        /**
         * Radius
         */
        public void setRadius(double value) {
            this.radius = value;
        }
        /**
         * Color of the center
         */
        private ai_cup_22.debugging.Color innerColor;
    
        /**
         * Color of the center
         */
        public ai_cup_22.debugging.Color getInnerColor() {
            return innerColor;
        }
    
        /**
         * Color of the center
         */
        public void setInnerColor(ai_cup_22.debugging.Color value) {
            this.innerColor = value;
        }
        /**
         * Color of the edge
         */
        private ai_cup_22.debugging.Color outerColor;
    
        /**
         * Color of the edge
         */
        public ai_cup_22.debugging.Color getOuterColor() {
            return outerColor;
        }
    
        /**
         * Color of the edge
         */
        public void setOuterColor(ai_cup_22.debugging.Color value) {
            this.outerColor = value;
        }
    
        public GradientCircle(ai_cup_22.model.Vec2 position, double radius, ai_cup_22.debugging.Color innerColor, ai_cup_22.debugging.Color outerColor) {
            this.position = position;
            this.radius = radius;
            this.innerColor = innerColor;
            this.outerColor = outerColor;
        }
    
        /**
         * Read GradientCircle from input stream
         */
        public static GradientCircle readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Vec2 position;
            position = ai_cup_22.model.Vec2.readFrom(stream);
            double radius;
            radius = StreamUtil.readDouble(stream);
            ai_cup_22.debugging.Color innerColor;
            innerColor = ai_cup_22.debugging.Color.readFrom(stream);
            ai_cup_22.debugging.Color outerColor;
            outerColor = ai_cup_22.debugging.Color.readFrom(stream);
            return new GradientCircle(position, radius, innerColor, outerColor);
        }
    
        /**
         * Write GradientCircle to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            position.writeTo(stream);
            StreamUtil.writeDouble(stream, radius);
            innerColor.writeTo(stream);
            outerColor.writeTo(stream);
        }
    
        /**
         * Get string representation of GradientCircle
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("GradientCircle { ");
            stringBuilder.append("position: ");
            stringBuilder.append(String.valueOf(position));
            stringBuilder.append(", ");
            stringBuilder.append("radius: ");
            stringBuilder.append(String.valueOf(radius));
            stringBuilder.append(", ");
            stringBuilder.append("innerColor: ");
            stringBuilder.append(String.valueOf(innerColor));
            stringBuilder.append(", ");
            stringBuilder.append("outerColor: ");
            stringBuilder.append(String.valueOf(outerColor));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Ring
     */
    public static class Ring extends DebugData {
        public static final int TAG = 3;
    
        /**
         * Position of the center
         */
        private ai_cup_22.model.Vec2 position;
    
        /**
         * Position of the center
         */
        public ai_cup_22.model.Vec2 getPosition() {
            return position;
        }
    
        /**
         * Position of the center
         */
        public void setPosition(ai_cup_22.model.Vec2 value) {
            this.position = value;
        }
        /**
         * Radius
         */
        private double radius;
    
        /**
         * Radius
         */
        public double getRadius() {
            return radius;
        }
    
        /**
         * Radius
         */
        public void setRadius(double value) {
            this.radius = value;
        }
        /**
         * Width
         */
        private double width;
    
        /**
         * Width
         */
        public double getWidth() {
            return width;
        }
    
        /**
         * Width
         */
        public void setWidth(double value) {
            this.width = value;
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
    
        public Ring(ai_cup_22.model.Vec2 position, double radius, double width, ai_cup_22.debugging.Color color) {
            this.position = position;
            this.radius = radius;
            this.width = width;
            this.color = color;
        }
    
        /**
         * Read Ring from input stream
         */
        public static Ring readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Vec2 position;
            position = ai_cup_22.model.Vec2.readFrom(stream);
            double radius;
            radius = StreamUtil.readDouble(stream);
            double width;
            width = StreamUtil.readDouble(stream);
            ai_cup_22.debugging.Color color;
            color = ai_cup_22.debugging.Color.readFrom(stream);
            return new Ring(position, radius, width, color);
        }
    
        /**
         * Write Ring to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            position.writeTo(stream);
            StreamUtil.writeDouble(stream, radius);
            StreamUtil.writeDouble(stream, width);
            color.writeTo(stream);
        }
    
        /**
         * Get string representation of Ring
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Ring { ");
            stringBuilder.append("position: ");
            stringBuilder.append(String.valueOf(position));
            stringBuilder.append(", ");
            stringBuilder.append("radius: ");
            stringBuilder.append(String.valueOf(radius));
            stringBuilder.append(", ");
            stringBuilder.append("width: ");
            stringBuilder.append(String.valueOf(width));
            stringBuilder.append(", ");
            stringBuilder.append("color: ");
            stringBuilder.append(String.valueOf(color));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Sector of a circle
     */
    public static class Pie extends DebugData {
        public static final int TAG = 4;
    
        /**
         * Position of the center
         */
        private ai_cup_22.model.Vec2 position;
    
        /**
         * Position of the center
         */
        public ai_cup_22.model.Vec2 getPosition() {
            return position;
        }
    
        /**
         * Position of the center
         */
        public void setPosition(ai_cup_22.model.Vec2 value) {
            this.position = value;
        }
        /**
         * Radius
         */
        private double radius;
    
        /**
         * Radius
         */
        public double getRadius() {
            return radius;
        }
    
        /**
         * Radius
         */
        public void setRadius(double value) {
            this.radius = value;
        }
        /**
         * Start angle
         */
        private double startAngle;
    
        /**
         * Start angle
         */
        public double getStartAngle() {
            return startAngle;
        }
    
        /**
         * Start angle
         */
        public void setStartAngle(double value) {
            this.startAngle = value;
        }
        /**
         * End angle
         */
        private double endAngle;
    
        /**
         * End angle
         */
        public double getEndAngle() {
            return endAngle;
        }
    
        /**
         * End angle
         */
        public void setEndAngle(double value) {
            this.endAngle = value;
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
    
        public Pie(ai_cup_22.model.Vec2 position, double radius, double startAngle, double endAngle, ai_cup_22.debugging.Color color) {
            this.position = position;
            this.radius = radius;
            this.startAngle = startAngle;
            this.endAngle = endAngle;
            this.color = color;
        }
    
        /**
         * Read Pie from input stream
         */
        public static Pie readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Vec2 position;
            position = ai_cup_22.model.Vec2.readFrom(stream);
            double radius;
            radius = StreamUtil.readDouble(stream);
            double startAngle;
            startAngle = StreamUtil.readDouble(stream);
            double endAngle;
            endAngle = StreamUtil.readDouble(stream);
            ai_cup_22.debugging.Color color;
            color = ai_cup_22.debugging.Color.readFrom(stream);
            return new Pie(position, radius, startAngle, endAngle, color);
        }
    
        /**
         * Write Pie to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            position.writeTo(stream);
            StreamUtil.writeDouble(stream, radius);
            StreamUtil.writeDouble(stream, startAngle);
            StreamUtil.writeDouble(stream, endAngle);
            color.writeTo(stream);
        }
    
        /**
         * Get string representation of Pie
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Pie { ");
            stringBuilder.append("position: ");
            stringBuilder.append(String.valueOf(position));
            stringBuilder.append(", ");
            stringBuilder.append("radius: ");
            stringBuilder.append(String.valueOf(radius));
            stringBuilder.append(", ");
            stringBuilder.append("startAngle: ");
            stringBuilder.append(String.valueOf(startAngle));
            stringBuilder.append(", ");
            stringBuilder.append("endAngle: ");
            stringBuilder.append(String.valueOf(endAngle));
            stringBuilder.append(", ");
            stringBuilder.append("color: ");
            stringBuilder.append(String.valueOf(color));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Arc
     */
    public static class Arc extends DebugData {
        public static final int TAG = 5;
    
        /**
         * Position of the center
         */
        private ai_cup_22.model.Vec2 position;
    
        /**
         * Position of the center
         */
        public ai_cup_22.model.Vec2 getPosition() {
            return position;
        }
    
        /**
         * Position of the center
         */
        public void setPosition(ai_cup_22.model.Vec2 value) {
            this.position = value;
        }
        /**
         * Radius
         */
        private double radius;
    
        /**
         * Radius
         */
        public double getRadius() {
            return radius;
        }
    
        /**
         * Radius
         */
        public void setRadius(double value) {
            this.radius = value;
        }
        /**
         * Width
         */
        private double width;
    
        /**
         * Width
         */
        public double getWidth() {
            return width;
        }
    
        /**
         * Width
         */
        public void setWidth(double value) {
            this.width = value;
        }
        /**
         * Start angle
         */
        private double startAngle;
    
        /**
         * Start angle
         */
        public double getStartAngle() {
            return startAngle;
        }
    
        /**
         * Start angle
         */
        public void setStartAngle(double value) {
            this.startAngle = value;
        }
        /**
         * End angle
         */
        private double endAngle;
    
        /**
         * End angle
         */
        public double getEndAngle() {
            return endAngle;
        }
    
        /**
         * End angle
         */
        public void setEndAngle(double value) {
            this.endAngle = value;
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
    
        public Arc(ai_cup_22.model.Vec2 position, double radius, double width, double startAngle, double endAngle, ai_cup_22.debugging.Color color) {
            this.position = position;
            this.radius = radius;
            this.width = width;
            this.startAngle = startAngle;
            this.endAngle = endAngle;
            this.color = color;
        }
    
        /**
         * Read Arc from input stream
         */
        public static Arc readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Vec2 position;
            position = ai_cup_22.model.Vec2.readFrom(stream);
            double radius;
            radius = StreamUtil.readDouble(stream);
            double width;
            width = StreamUtil.readDouble(stream);
            double startAngle;
            startAngle = StreamUtil.readDouble(stream);
            double endAngle;
            endAngle = StreamUtil.readDouble(stream);
            ai_cup_22.debugging.Color color;
            color = ai_cup_22.debugging.Color.readFrom(stream);
            return new Arc(position, radius, width, startAngle, endAngle, color);
        }
    
        /**
         * Write Arc to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            position.writeTo(stream);
            StreamUtil.writeDouble(stream, radius);
            StreamUtil.writeDouble(stream, width);
            StreamUtil.writeDouble(stream, startAngle);
            StreamUtil.writeDouble(stream, endAngle);
            color.writeTo(stream);
        }
    
        /**
         * Get string representation of Arc
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Arc { ");
            stringBuilder.append("position: ");
            stringBuilder.append(String.valueOf(position));
            stringBuilder.append(", ");
            stringBuilder.append("radius: ");
            stringBuilder.append(String.valueOf(radius));
            stringBuilder.append(", ");
            stringBuilder.append("width: ");
            stringBuilder.append(String.valueOf(width));
            stringBuilder.append(", ");
            stringBuilder.append("startAngle: ");
            stringBuilder.append(String.valueOf(startAngle));
            stringBuilder.append(", ");
            stringBuilder.append("endAngle: ");
            stringBuilder.append(String.valueOf(endAngle));
            stringBuilder.append(", ");
            stringBuilder.append("color: ");
            stringBuilder.append(String.valueOf(color));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Rectancle
     */
    public static class Rect extends DebugData {
        public static final int TAG = 6;
    
        /**
         * Bottom left position
         */
        private ai_cup_22.model.Vec2 bottomLeft;
    
        /**
         * Bottom left position
         */
        public ai_cup_22.model.Vec2 getBottomLeft() {
            return bottomLeft;
        }
    
        /**
         * Bottom left position
         */
        public void setBottomLeft(ai_cup_22.model.Vec2 value) {
            this.bottomLeft = value;
        }
        /**
         * Size
         */
        private ai_cup_22.model.Vec2 size;
    
        /**
         * Size
         */
        public ai_cup_22.model.Vec2 getSize() {
            return size;
        }
    
        /**
         * Size
         */
        public void setSize(ai_cup_22.model.Vec2 value) {
            this.size = value;
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
    
        public Rect(ai_cup_22.model.Vec2 bottomLeft, ai_cup_22.model.Vec2 size, ai_cup_22.debugging.Color color) {
            this.bottomLeft = bottomLeft;
            this.size = size;
            this.color = color;
        }
    
        /**
         * Read Rect from input stream
         */
        public static Rect readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Vec2 bottomLeft;
            bottomLeft = ai_cup_22.model.Vec2.readFrom(stream);
            ai_cup_22.model.Vec2 size;
            size = ai_cup_22.model.Vec2.readFrom(stream);
            ai_cup_22.debugging.Color color;
            color = ai_cup_22.debugging.Color.readFrom(stream);
            return new Rect(bottomLeft, size, color);
        }
    
        /**
         * Write Rect to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            bottomLeft.writeTo(stream);
            size.writeTo(stream);
            color.writeTo(stream);
        }
    
        /**
         * Get string representation of Rect
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Rect { ");
            stringBuilder.append("bottomLeft: ");
            stringBuilder.append(String.valueOf(bottomLeft));
            stringBuilder.append(", ");
            stringBuilder.append("size: ");
            stringBuilder.append(String.valueOf(size));
            stringBuilder.append(", ");
            stringBuilder.append("color: ");
            stringBuilder.append(String.valueOf(color));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Polygon (convex)
     */
    public static class Polygon extends DebugData {
        public static final int TAG = 7;
    
        /**
         * Positions of vertices in order
         */
        private ai_cup_22.model.Vec2[] vertices;
    
        /**
         * Positions of vertices in order
         */
        public ai_cup_22.model.Vec2[] getVertices() {
            return vertices;
        }
    
        /**
         * Positions of vertices in order
         */
        public void setVertices(ai_cup_22.model.Vec2[] value) {
            this.vertices = value;
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
    
        public Polygon(ai_cup_22.model.Vec2[] vertices, ai_cup_22.debugging.Color color) {
            this.vertices = vertices;
            this.color = color;
        }
    
        /**
         * Read Polygon from input stream
         */
        public static Polygon readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Vec2[] vertices;
            vertices = new ai_cup_22.model.Vec2[StreamUtil.readInt(stream)];
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                ai_cup_22.model.Vec2 verticesElement;
                verticesElement = ai_cup_22.model.Vec2.readFrom(stream);
                vertices[verticesIndex] = verticesElement;
            }
            ai_cup_22.debugging.Color color;
            color = ai_cup_22.debugging.Color.readFrom(stream);
            return new Polygon(vertices, color);
        }
    
        /**
         * Write Polygon to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeInt(stream, vertices.length);
            for (ai_cup_22.model.Vec2 verticesElement : vertices) {
                verticesElement.writeTo(stream);
            }
            color.writeTo(stream);
        }
    
        /**
         * Get string representation of Polygon
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Polygon { ");
            stringBuilder.append("vertices: ");
            stringBuilder.append("[ ");
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                if (verticesIndex != 0) {
                    stringBuilder.append(", ");
                }
                ai_cup_22.model.Vec2 verticesElement = vertices[verticesIndex];
                stringBuilder.append(String.valueOf(verticesElement));
            }
            stringBuilder.append(" ]");
            stringBuilder.append(", ");
            stringBuilder.append("color: ");
            stringBuilder.append(String.valueOf(color));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Polygon with gradient fill
     */
    public static class GradientPolygon extends DebugData {
        public static final int TAG = 8;
    
        /**
         * List of vertices in order
         */
        private ai_cup_22.debugging.ColoredVertex[] vertices;
    
        /**
         * List of vertices in order
         */
        public ai_cup_22.debugging.ColoredVertex[] getVertices() {
            return vertices;
        }
    
        /**
         * List of vertices in order
         */
        public void setVertices(ai_cup_22.debugging.ColoredVertex[] value) {
            this.vertices = value;
        }
    
        public GradientPolygon(ai_cup_22.debugging.ColoredVertex[] vertices) {
            this.vertices = vertices;
        }
    
        /**
         * Read GradientPolygon from input stream
         */
        public static GradientPolygon readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.debugging.ColoredVertex[] vertices;
            vertices = new ai_cup_22.debugging.ColoredVertex[StreamUtil.readInt(stream)];
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                ai_cup_22.debugging.ColoredVertex verticesElement;
                verticesElement = ai_cup_22.debugging.ColoredVertex.readFrom(stream);
                vertices[verticesIndex] = verticesElement;
            }
            return new GradientPolygon(vertices);
        }
    
        /**
         * Write GradientPolygon to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeInt(stream, vertices.length);
            for (ai_cup_22.debugging.ColoredVertex verticesElement : vertices) {
                verticesElement.writeTo(stream);
            }
        }
    
        /**
         * Get string representation of GradientPolygon
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("GradientPolygon { ");
            stringBuilder.append("vertices: ");
            stringBuilder.append("[ ");
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                if (verticesIndex != 0) {
                    stringBuilder.append(", ");
                }
                ai_cup_22.debugging.ColoredVertex verticesElement = vertices[verticesIndex];
                stringBuilder.append(String.valueOf(verticesElement));
            }
            stringBuilder.append(" ]");
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Segment
     */
    public static class Segment extends DebugData {
        public static final int TAG = 9;
    
        /**
         * Position of the first end
         */
        private ai_cup_22.model.Vec2 firstEnd;
    
        /**
         * Position of the first end
         */
        public ai_cup_22.model.Vec2 getFirstEnd() {
            return firstEnd;
        }
    
        /**
         * Position of the first end
         */
        public void setFirstEnd(ai_cup_22.model.Vec2 value) {
            this.firstEnd = value;
        }
        /**
         * Position of the second end
         */
        private ai_cup_22.model.Vec2 secondEnd;
    
        /**
         * Position of the second end
         */
        public ai_cup_22.model.Vec2 getSecondEnd() {
            return secondEnd;
        }
    
        /**
         * Position of the second end
         */
        public void setSecondEnd(ai_cup_22.model.Vec2 value) {
            this.secondEnd = value;
        }
        /**
         * Width
         */
        private double width;
    
        /**
         * Width
         */
        public double getWidth() {
            return width;
        }
    
        /**
         * Width
         */
        public void setWidth(double value) {
            this.width = value;
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
    
        public Segment(ai_cup_22.model.Vec2 firstEnd, ai_cup_22.model.Vec2 secondEnd, double width, ai_cup_22.debugging.Color color) {
            this.firstEnd = firstEnd;
            this.secondEnd = secondEnd;
            this.width = width;
            this.color = color;
        }
    
        /**
         * Read Segment from input stream
         */
        public static Segment readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Vec2 firstEnd;
            firstEnd = ai_cup_22.model.Vec2.readFrom(stream);
            ai_cup_22.model.Vec2 secondEnd;
            secondEnd = ai_cup_22.model.Vec2.readFrom(stream);
            double width;
            width = StreamUtil.readDouble(stream);
            ai_cup_22.debugging.Color color;
            color = ai_cup_22.debugging.Color.readFrom(stream);
            return new Segment(firstEnd, secondEnd, width, color);
        }
    
        /**
         * Write Segment to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            firstEnd.writeTo(stream);
            secondEnd.writeTo(stream);
            StreamUtil.writeDouble(stream, width);
            color.writeTo(stream);
        }
    
        /**
         * Get string representation of Segment
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("Segment { ");
            stringBuilder.append("firstEnd: ");
            stringBuilder.append(String.valueOf(firstEnd));
            stringBuilder.append(", ");
            stringBuilder.append("secondEnd: ");
            stringBuilder.append(String.valueOf(secondEnd));
            stringBuilder.append(", ");
            stringBuilder.append("width: ");
            stringBuilder.append(String.valueOf(width));
            stringBuilder.append(", ");
            stringBuilder.append("color: ");
            stringBuilder.append(String.valueOf(color));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Segment with gradient fill
     */
    public static class GradientSegment extends DebugData {
        public static final int TAG = 10;
    
        /**
         * Position of the first end
         */
        private ai_cup_22.model.Vec2 firstEnd;
    
        /**
         * Position of the first end
         */
        public ai_cup_22.model.Vec2 getFirstEnd() {
            return firstEnd;
        }
    
        /**
         * Position of the first end
         */
        public void setFirstEnd(ai_cup_22.model.Vec2 value) {
            this.firstEnd = value;
        }
        /**
         * Color of the first end
         */
        private ai_cup_22.debugging.Color firstColor;
    
        /**
         * Color of the first end
         */
        public ai_cup_22.debugging.Color getFirstColor() {
            return firstColor;
        }
    
        /**
         * Color of the first end
         */
        public void setFirstColor(ai_cup_22.debugging.Color value) {
            this.firstColor = value;
        }
        /**
         * Position of the second end
         */
        private ai_cup_22.model.Vec2 secondEnd;
    
        /**
         * Position of the second end
         */
        public ai_cup_22.model.Vec2 getSecondEnd() {
            return secondEnd;
        }
    
        /**
         * Position of the second end
         */
        public void setSecondEnd(ai_cup_22.model.Vec2 value) {
            this.secondEnd = value;
        }
        /**
         * Color of the second end
         */
        private ai_cup_22.debugging.Color secondColor;
    
        /**
         * Color of the second end
         */
        public ai_cup_22.debugging.Color getSecondColor() {
            return secondColor;
        }
    
        /**
         * Color of the second end
         */
        public void setSecondColor(ai_cup_22.debugging.Color value) {
            this.secondColor = value;
        }
        /**
         * Width
         */
        private double width;
    
        /**
         * Width
         */
        public double getWidth() {
            return width;
        }
    
        /**
         * Width
         */
        public void setWidth(double value) {
            this.width = value;
        }
    
        public GradientSegment(ai_cup_22.model.Vec2 firstEnd, ai_cup_22.debugging.Color firstColor, ai_cup_22.model.Vec2 secondEnd, ai_cup_22.debugging.Color secondColor, double width) {
            this.firstEnd = firstEnd;
            this.firstColor = firstColor;
            this.secondEnd = secondEnd;
            this.secondColor = secondColor;
            this.width = width;
        }
    
        /**
         * Read GradientSegment from input stream
         */
        public static GradientSegment readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Vec2 firstEnd;
            firstEnd = ai_cup_22.model.Vec2.readFrom(stream);
            ai_cup_22.debugging.Color firstColor;
            firstColor = ai_cup_22.debugging.Color.readFrom(stream);
            ai_cup_22.model.Vec2 secondEnd;
            secondEnd = ai_cup_22.model.Vec2.readFrom(stream);
            ai_cup_22.debugging.Color secondColor;
            secondColor = ai_cup_22.debugging.Color.readFrom(stream);
            double width;
            width = StreamUtil.readDouble(stream);
            return new GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width);
        }
    
        /**
         * Write GradientSegment to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            firstEnd.writeTo(stream);
            firstColor.writeTo(stream);
            secondEnd.writeTo(stream);
            secondColor.writeTo(stream);
            StreamUtil.writeDouble(stream, width);
        }
    
        /**
         * Get string representation of GradientSegment
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("GradientSegment { ");
            stringBuilder.append("firstEnd: ");
            stringBuilder.append(String.valueOf(firstEnd));
            stringBuilder.append(", ");
            stringBuilder.append("firstColor: ");
            stringBuilder.append(String.valueOf(firstColor));
            stringBuilder.append(", ");
            stringBuilder.append("secondEnd: ");
            stringBuilder.append(String.valueOf(secondEnd));
            stringBuilder.append(", ");
            stringBuilder.append("secondColor: ");
            stringBuilder.append(String.valueOf(secondColor));
            stringBuilder.append(", ");
            stringBuilder.append("width: ");
            stringBuilder.append(String.valueOf(width));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Poly line
     */
    public static class PolyLine extends DebugData {
        public static final int TAG = 11;
    
        /**
         * List of points in order
         */
        private ai_cup_22.model.Vec2[] vertices;
    
        /**
         * List of points in order
         */
        public ai_cup_22.model.Vec2[] getVertices() {
            return vertices;
        }
    
        /**
         * List of points in order
         */
        public void setVertices(ai_cup_22.model.Vec2[] value) {
            this.vertices = value;
        }
        /**
         * Width
         */
        private double width;
    
        /**
         * Width
         */
        public double getWidth() {
            return width;
        }
    
        /**
         * Width
         */
        public void setWidth(double value) {
            this.width = value;
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
    
        public PolyLine(ai_cup_22.model.Vec2[] vertices, double width, ai_cup_22.debugging.Color color) {
            this.vertices = vertices;
            this.width = width;
            this.color = color;
        }
    
        /**
         * Read PolyLine from input stream
         */
        public static PolyLine readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.model.Vec2[] vertices;
            vertices = new ai_cup_22.model.Vec2[StreamUtil.readInt(stream)];
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                ai_cup_22.model.Vec2 verticesElement;
                verticesElement = ai_cup_22.model.Vec2.readFrom(stream);
                vertices[verticesIndex] = verticesElement;
            }
            double width;
            width = StreamUtil.readDouble(stream);
            ai_cup_22.debugging.Color color;
            color = ai_cup_22.debugging.Color.readFrom(stream);
            return new PolyLine(vertices, width, color);
        }
    
        /**
         * Write PolyLine to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeInt(stream, vertices.length);
            for (ai_cup_22.model.Vec2 verticesElement : vertices) {
                verticesElement.writeTo(stream);
            }
            StreamUtil.writeDouble(stream, width);
            color.writeTo(stream);
        }
    
        /**
         * Get string representation of PolyLine
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("PolyLine { ");
            stringBuilder.append("vertices: ");
            stringBuilder.append("[ ");
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                if (verticesIndex != 0) {
                    stringBuilder.append(", ");
                }
                ai_cup_22.model.Vec2 verticesElement = vertices[verticesIndex];
                stringBuilder.append(String.valueOf(verticesElement));
            }
            stringBuilder.append(" ]");
            stringBuilder.append(", ");
            stringBuilder.append("width: ");
            stringBuilder.append(String.valueOf(width));
            stringBuilder.append(", ");
            stringBuilder.append("color: ");
            stringBuilder.append(String.valueOf(color));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }

    /**
     * Poly line with gradient fill
     */
    public static class GradientPolyLine extends DebugData {
        public static final int TAG = 12;
    
        /**
         * List of points and colors in order
         */
        private ai_cup_22.debugging.ColoredVertex[] vertices;
    
        /**
         * List of points and colors in order
         */
        public ai_cup_22.debugging.ColoredVertex[] getVertices() {
            return vertices;
        }
    
        /**
         * List of points and colors in order
         */
        public void setVertices(ai_cup_22.debugging.ColoredVertex[] value) {
            this.vertices = value;
        }
        /**
         * Width
         */
        private double width;
    
        /**
         * Width
         */
        public double getWidth() {
            return width;
        }
    
        /**
         * Width
         */
        public void setWidth(double value) {
            this.width = value;
        }
    
        public GradientPolyLine(ai_cup_22.debugging.ColoredVertex[] vertices, double width) {
            this.vertices = vertices;
            this.width = width;
        }
    
        /**
         * Read GradientPolyLine from input stream
         */
        public static GradientPolyLine readFrom(java.io.InputStream stream) throws java.io.IOException {
            ai_cup_22.debugging.ColoredVertex[] vertices;
            vertices = new ai_cup_22.debugging.ColoredVertex[StreamUtil.readInt(stream)];
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                ai_cup_22.debugging.ColoredVertex verticesElement;
                verticesElement = ai_cup_22.debugging.ColoredVertex.readFrom(stream);
                vertices[verticesIndex] = verticesElement;
            }
            double width;
            width = StreamUtil.readDouble(stream);
            return new GradientPolyLine(vertices, width);
        }
    
        /**
         * Write GradientPolyLine to output stream
         */
        @Override
        public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
            StreamUtil.writeInt(stream, TAG);
            StreamUtil.writeInt(stream, vertices.length);
            for (ai_cup_22.debugging.ColoredVertex verticesElement : vertices) {
                verticesElement.writeTo(stream);
            }
            StreamUtil.writeDouble(stream, width);
        }
    
        /**
         * Get string representation of GradientPolyLine
         */
        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("GradientPolyLine { ");
            stringBuilder.append("vertices: ");
            stringBuilder.append("[ ");
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                if (verticesIndex != 0) {
                    stringBuilder.append(", ");
                }
                ai_cup_22.debugging.ColoredVertex verticesElement = vertices[verticesIndex];
                stringBuilder.append(String.valueOf(verticesElement));
            }
            stringBuilder.append(" ]");
            stringBuilder.append(", ");
            stringBuilder.append("width: ");
            stringBuilder.append(String.valueOf(width));
            stringBuilder.append(" }");
            return stringBuilder.toString();
        }
    }
}