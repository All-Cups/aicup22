module debugging.debug_data;

import stream;
import std.conv;
import std.typecons : Nullable;
import debugging.color;
import debugging.colored_vertex;
import model.vec2;

/// Data for debug rendering
abstract class DebugData {
    /// Write DebugData to writer
    abstract void writeTo(Stream writer) const;

    /// Read DebugData from reader
    static DebugData readFrom(Stream reader) {
        switch (reader.readInt()) {
            case PlacedText.TAG:
                return PlacedText.readFrom(reader);
            case Circle.TAG:
                return Circle.readFrom(reader);
            case GradientCircle.TAG:
                return GradientCircle.readFrom(reader);
            case Ring.TAG:
                return Ring.readFrom(reader);
            case Pie.TAG:
                return Pie.readFrom(reader);
            case Arc.TAG:
                return Arc.readFrom(reader);
            case Rect.TAG:
                return Rect.readFrom(reader);
            case Polygon.TAG:
                return Polygon.readFrom(reader);
            case GradientPolygon.TAG:
                return GradientPolygon.readFrom(reader);
            case Segment.TAG:
                return Segment.readFrom(reader);
            case GradientSegment.TAG:
                return GradientSegment.readFrom(reader);
            case PolyLine.TAG:
                return PolyLine.readFrom(reader);
            case GradientPolyLine.TAG:
                return GradientPolyLine.readFrom(reader);
            default:
                throw new Exception("Unexpected tag value");
        }
    }
    
    /// Text
    static class PlacedText : DebugData {
        static const int TAG = 0;
    
        /// Position
        model.Vec2 position;
        /// Text
        string text;
        /// Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
        model.Vec2 alignment;
        /// Size
        double size;
        /// Color
        debugging.Color color;
    
        this() {}
    
        this(model.Vec2 position, string text, model.Vec2 alignment, double size, debugging.Color color) {
            this.position = position;
            this.text = text;
            this.alignment = alignment;
            this.size = size;
            this.color = color;
        }
    
        /// Read PlacedText from reader
        static PlacedText readFrom(Stream reader) {
            model.Vec2 position;
            position = model.Vec2.readFrom(reader);
            string text;
            text = reader.readString();
            model.Vec2 alignment;
            alignment = model.Vec2.readFrom(reader);
            double size;
            size = reader.readDouble();
            debugging.Color color;
            color = debugging.Color.readFrom(reader);
            return new PlacedText(position, text, alignment, size, color);
        }
    
        /// Write PlacedText to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            position.writeTo(writer);
            writer.write(text);
            alignment.writeTo(writer);
            writer.write(size);
            color.writeTo(writer);
        }
    }
    
    /// Circle
    static class Circle : DebugData {
        static const int TAG = 1;
    
        /// Position of the center
        model.Vec2 position;
        /// Radius
        double radius;
        /// Color
        debugging.Color color;
    
        this() {}
    
        this(model.Vec2 position, double radius, debugging.Color color) {
            this.position = position;
            this.radius = radius;
            this.color = color;
        }
    
        /// Read Circle from reader
        static Circle readFrom(Stream reader) {
            model.Vec2 position;
            position = model.Vec2.readFrom(reader);
            double radius;
            radius = reader.readDouble();
            debugging.Color color;
            color = debugging.Color.readFrom(reader);
            return new Circle(position, radius, color);
        }
    
        /// Write Circle to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            position.writeTo(writer);
            writer.write(radius);
            color.writeTo(writer);
        }
    }
    
    /// Circle with gradient fill
    static class GradientCircle : DebugData {
        static const int TAG = 2;
    
        /// Position of the center
        model.Vec2 position;
        /// Radius
        double radius;
        /// Color of the center
        debugging.Color innerColor;
        /// Color of the edge
        debugging.Color outerColor;
    
        this() {}
    
        this(model.Vec2 position, double radius, debugging.Color innerColor, debugging.Color outerColor) {
            this.position = position;
            this.radius = radius;
            this.innerColor = innerColor;
            this.outerColor = outerColor;
        }
    
        /// Read GradientCircle from reader
        static GradientCircle readFrom(Stream reader) {
            model.Vec2 position;
            position = model.Vec2.readFrom(reader);
            double radius;
            radius = reader.readDouble();
            debugging.Color innerColor;
            innerColor = debugging.Color.readFrom(reader);
            debugging.Color outerColor;
            outerColor = debugging.Color.readFrom(reader);
            return new GradientCircle(position, radius, innerColor, outerColor);
        }
    
        /// Write GradientCircle to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            position.writeTo(writer);
            writer.write(radius);
            innerColor.writeTo(writer);
            outerColor.writeTo(writer);
        }
    }
    
    /// Ring
    static class Ring : DebugData {
        static const int TAG = 3;
    
        /// Position of the center
        model.Vec2 position;
        /// Radius
        double radius;
        /// Width
        double width;
        /// Color
        debugging.Color color;
    
        this() {}
    
        this(model.Vec2 position, double radius, double width, debugging.Color color) {
            this.position = position;
            this.radius = radius;
            this.width = width;
            this.color = color;
        }
    
        /// Read Ring from reader
        static Ring readFrom(Stream reader) {
            model.Vec2 position;
            position = model.Vec2.readFrom(reader);
            double radius;
            radius = reader.readDouble();
            double width;
            width = reader.readDouble();
            debugging.Color color;
            color = debugging.Color.readFrom(reader);
            return new Ring(position, radius, width, color);
        }
    
        /// Write Ring to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            position.writeTo(writer);
            writer.write(radius);
            writer.write(width);
            color.writeTo(writer);
        }
    }
    
    /// Sector of a circle
    static class Pie : DebugData {
        static const int TAG = 4;
    
        /// Position of the center
        model.Vec2 position;
        /// Radius
        double radius;
        /// Start angle
        double startAngle;
        /// End angle
        double endAngle;
        /// Color
        debugging.Color color;
    
        this() {}
    
        this(model.Vec2 position, double radius, double startAngle, double endAngle, debugging.Color color) {
            this.position = position;
            this.radius = radius;
            this.startAngle = startAngle;
            this.endAngle = endAngle;
            this.color = color;
        }
    
        /// Read Pie from reader
        static Pie readFrom(Stream reader) {
            model.Vec2 position;
            position = model.Vec2.readFrom(reader);
            double radius;
            radius = reader.readDouble();
            double startAngle;
            startAngle = reader.readDouble();
            double endAngle;
            endAngle = reader.readDouble();
            debugging.Color color;
            color = debugging.Color.readFrom(reader);
            return new Pie(position, radius, startAngle, endAngle, color);
        }
    
        /// Write Pie to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            position.writeTo(writer);
            writer.write(radius);
            writer.write(startAngle);
            writer.write(endAngle);
            color.writeTo(writer);
        }
    }
    
    /// Arc
    static class Arc : DebugData {
        static const int TAG = 5;
    
        /// Position of the center
        model.Vec2 position;
        /// Radius
        double radius;
        /// Width
        double width;
        /// Start angle
        double startAngle;
        /// End angle
        double endAngle;
        /// Color
        debugging.Color color;
    
        this() {}
    
        this(model.Vec2 position, double radius, double width, double startAngle, double endAngle, debugging.Color color) {
            this.position = position;
            this.radius = radius;
            this.width = width;
            this.startAngle = startAngle;
            this.endAngle = endAngle;
            this.color = color;
        }
    
        /// Read Arc from reader
        static Arc readFrom(Stream reader) {
            model.Vec2 position;
            position = model.Vec2.readFrom(reader);
            double radius;
            radius = reader.readDouble();
            double width;
            width = reader.readDouble();
            double startAngle;
            startAngle = reader.readDouble();
            double endAngle;
            endAngle = reader.readDouble();
            debugging.Color color;
            color = debugging.Color.readFrom(reader);
            return new Arc(position, radius, width, startAngle, endAngle, color);
        }
    
        /// Write Arc to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            position.writeTo(writer);
            writer.write(radius);
            writer.write(width);
            writer.write(startAngle);
            writer.write(endAngle);
            color.writeTo(writer);
        }
    }
    
    /// Rectancle
    static class Rect : DebugData {
        static const int TAG = 6;
    
        /// Bottom left position
        model.Vec2 bottomLeft;
        /// Size
        model.Vec2 size;
        /// Color
        debugging.Color color;
    
        this() {}
    
        this(model.Vec2 bottomLeft, model.Vec2 size, debugging.Color color) {
            this.bottomLeft = bottomLeft;
            this.size = size;
            this.color = color;
        }
    
        /// Read Rect from reader
        static Rect readFrom(Stream reader) {
            model.Vec2 bottomLeft;
            bottomLeft = model.Vec2.readFrom(reader);
            model.Vec2 size;
            size = model.Vec2.readFrom(reader);
            debugging.Color color;
            color = debugging.Color.readFrom(reader);
            return new Rect(bottomLeft, size, color);
        }
    
        /// Write Rect to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            bottomLeft.writeTo(writer);
            size.writeTo(writer);
            color.writeTo(writer);
        }
    }
    
    /// Polygon (convex)
    static class Polygon : DebugData {
        static const int TAG = 7;
    
        /// Positions of vertices in order
        model.Vec2[] vertices;
        /// Color
        debugging.Color color;
    
        this() {}
    
        this(model.Vec2[] vertices, debugging.Color color) {
            this.vertices = vertices;
            this.color = color;
        }
    
        /// Read Polygon from reader
        static Polygon readFrom(Stream reader) {
            model.Vec2[] vertices;
            vertices = new model.Vec2[reader.readInt()];
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                model.Vec2 verticesKey;
                verticesKey = model.Vec2.readFrom(reader);
                vertices[verticesIndex] = verticesKey;
            }
            debugging.Color color;
            color = debugging.Color.readFrom(reader);
            return new Polygon(vertices, color);
        }
    
        /// Write Polygon to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(cast(int)(vertices.length));
            foreach (verticesElement; vertices) {
                verticesElement.writeTo(writer);
            }
            color.writeTo(writer);
        }
    }
    
    /// Polygon with gradient fill
    static class GradientPolygon : DebugData {
        static const int TAG = 8;
    
        /// List of vertices in order
        debugging.ColoredVertex[] vertices;
    
        this() {}
    
        this(debugging.ColoredVertex[] vertices) {
            this.vertices = vertices;
        }
    
        /// Read GradientPolygon from reader
        static GradientPolygon readFrom(Stream reader) {
            debugging.ColoredVertex[] vertices;
            vertices = new debugging.ColoredVertex[reader.readInt()];
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                debugging.ColoredVertex verticesKey;
                verticesKey = debugging.ColoredVertex.readFrom(reader);
                vertices[verticesIndex] = verticesKey;
            }
            return new GradientPolygon(vertices);
        }
    
        /// Write GradientPolygon to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(cast(int)(vertices.length));
            foreach (verticesElement; vertices) {
                verticesElement.writeTo(writer);
            }
        }
    }
    
    /// Segment
    static class Segment : DebugData {
        static const int TAG = 9;
    
        /// Position of the first end
        model.Vec2 firstEnd;
        /// Position of the second end
        model.Vec2 secondEnd;
        /// Width
        double width;
        /// Color
        debugging.Color color;
    
        this() {}
    
        this(model.Vec2 firstEnd, model.Vec2 secondEnd, double width, debugging.Color color) {
            this.firstEnd = firstEnd;
            this.secondEnd = secondEnd;
            this.width = width;
            this.color = color;
        }
    
        /// Read Segment from reader
        static Segment readFrom(Stream reader) {
            model.Vec2 firstEnd;
            firstEnd = model.Vec2.readFrom(reader);
            model.Vec2 secondEnd;
            secondEnd = model.Vec2.readFrom(reader);
            double width;
            width = reader.readDouble();
            debugging.Color color;
            color = debugging.Color.readFrom(reader);
            return new Segment(firstEnd, secondEnd, width, color);
        }
    
        /// Write Segment to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            firstEnd.writeTo(writer);
            secondEnd.writeTo(writer);
            writer.write(width);
            color.writeTo(writer);
        }
    }
    
    /// Segment with gradient fill
    static class GradientSegment : DebugData {
        static const int TAG = 10;
    
        /// Position of the first end
        model.Vec2 firstEnd;
        /// Color of the first end
        debugging.Color firstColor;
        /// Position of the second end
        model.Vec2 secondEnd;
        /// Color of the second end
        debugging.Color secondColor;
        /// Width
        double width;
    
        this() {}
    
        this(model.Vec2 firstEnd, debugging.Color firstColor, model.Vec2 secondEnd, debugging.Color secondColor, double width) {
            this.firstEnd = firstEnd;
            this.firstColor = firstColor;
            this.secondEnd = secondEnd;
            this.secondColor = secondColor;
            this.width = width;
        }
    
        /// Read GradientSegment from reader
        static GradientSegment readFrom(Stream reader) {
            model.Vec2 firstEnd;
            firstEnd = model.Vec2.readFrom(reader);
            debugging.Color firstColor;
            firstColor = debugging.Color.readFrom(reader);
            model.Vec2 secondEnd;
            secondEnd = model.Vec2.readFrom(reader);
            debugging.Color secondColor;
            secondColor = debugging.Color.readFrom(reader);
            double width;
            width = reader.readDouble();
            return new GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width);
        }
    
        /// Write GradientSegment to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            firstEnd.writeTo(writer);
            firstColor.writeTo(writer);
            secondEnd.writeTo(writer);
            secondColor.writeTo(writer);
            writer.write(width);
        }
    }
    
    /// Poly line
    static class PolyLine : DebugData {
        static const int TAG = 11;
    
        /// List of points in order
        model.Vec2[] vertices;
        /// Width
        double width;
        /// Color
        debugging.Color color;
    
        this() {}
    
        this(model.Vec2[] vertices, double width, debugging.Color color) {
            this.vertices = vertices;
            this.width = width;
            this.color = color;
        }
    
        /// Read PolyLine from reader
        static PolyLine readFrom(Stream reader) {
            model.Vec2[] vertices;
            vertices = new model.Vec2[reader.readInt()];
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                model.Vec2 verticesKey;
                verticesKey = model.Vec2.readFrom(reader);
                vertices[verticesIndex] = verticesKey;
            }
            double width;
            width = reader.readDouble();
            debugging.Color color;
            color = debugging.Color.readFrom(reader);
            return new PolyLine(vertices, width, color);
        }
    
        /// Write PolyLine to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(cast(int)(vertices.length));
            foreach (verticesElement; vertices) {
                verticesElement.writeTo(writer);
            }
            writer.write(width);
            color.writeTo(writer);
        }
    }
    
    /// Poly line with gradient fill
    static class GradientPolyLine : DebugData {
        static const int TAG = 12;
    
        /// List of points and colors in order
        debugging.ColoredVertex[] vertices;
        /// Width
        double width;
    
        this() {}
    
        this(debugging.ColoredVertex[] vertices, double width) {
            this.vertices = vertices;
            this.width = width;
        }
    
        /// Read GradientPolyLine from reader
        static GradientPolyLine readFrom(Stream reader) {
            debugging.ColoredVertex[] vertices;
            vertices = new debugging.ColoredVertex[reader.readInt()];
            for (int verticesIndex = 0; verticesIndex < vertices.length; verticesIndex++) {
                debugging.ColoredVertex verticesKey;
                verticesKey = debugging.ColoredVertex.readFrom(reader);
                vertices[verticesIndex] = verticesKey;
            }
            double width;
            width = reader.readDouble();
            return new GradientPolyLine(vertices, width);
        }
    
        /// Write GradientPolyLine to writer
        override void writeTo(Stream writer) const {
            writer.write(TAG);
            writer.write(cast(int)(vertices.length));
            foreach (verticesElement; vertices) {
                verticesElement.writeTo(writer);
            }
            writer.write(width);
        }
    }
}