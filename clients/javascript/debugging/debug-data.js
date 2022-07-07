const Color = require.main.require('./debugging/color');
const ColoredVertex = require.main.require('./debugging/colored-vertex');
const Vec2 = require.main.require('./model/vec2');

/**
 * Data for debug rendering
 */
class DebugData {
    /**
     * Read DebugData from input stream
     */
    static async readFrom(stream) {
        let tag = await stream.readInt();
        if (tag == DebugData.PlacedText.TAG) {
            return await DebugData.PlacedText.readFrom(stream);
        }
        if (tag == DebugData.Circle.TAG) {
            return await DebugData.Circle.readFrom(stream);
        }
        if (tag == DebugData.GradientCircle.TAG) {
            return await DebugData.GradientCircle.readFrom(stream);
        }
        if (tag == DebugData.Ring.TAG) {
            return await DebugData.Ring.readFrom(stream);
        }
        if (tag == DebugData.Pie.TAG) {
            return await DebugData.Pie.readFrom(stream);
        }
        if (tag == DebugData.Arc.TAG) {
            return await DebugData.Arc.readFrom(stream);
        }
        if (tag == DebugData.Rect.TAG) {
            return await DebugData.Rect.readFrom(stream);
        }
        if (tag == DebugData.Polygon.TAG) {
            return await DebugData.Polygon.readFrom(stream);
        }
        if (tag == DebugData.GradientPolygon.TAG) {
            return await DebugData.GradientPolygon.readFrom(stream);
        }
        if (tag == DebugData.Segment.TAG) {
            return await DebugData.Segment.readFrom(stream);
        }
        if (tag == DebugData.GradientSegment.TAG) {
            return await DebugData.GradientSegment.readFrom(stream);
        }
        if (tag == DebugData.PolyLine.TAG) {
            return await DebugData.PolyLine.readFrom(stream);
        }
        if (tag == DebugData.GradientPolyLine.TAG) {
            return await DebugData.GradientPolyLine.readFrom(stream);
        }
        throw new Error("Unexpected tag value");
    }
}
/**
 * Text
 */
class PlacedText extends DebugData {
    /**
     * Position
     */
    position;
    /**
     * Text
     */
    text;
    /**
     * Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
     */
    alignment;
    /**
     * Size
     */
    size;
    /**
     * Color
     */
    color;

    constructor(position, text, alignment, size, color) {
        super();
        this.position = position;
        this.text = text;
        this.alignment = alignment;
        this.size = size;
        this.color = color;
    }

    /**
     * Read PlacedText from input stream
     */
    static async readFrom(stream) {
        let position;
        position = await Vec2.readFrom(stream);
        let text;
        text = await stream.readString();
        let alignment;
        alignment = await Vec2.readFrom(stream);
        let size;
        size = await stream.readDouble();
        let color;
        color = await Color.readFrom(stream);
        return new PlacedText(position, text, alignment, size, color);
    }

    /**
     * Write PlacedText to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(PlacedText.TAG);
        let position = this.position;
        await position.writeTo(stream);
        let text = this.text;
        await stream.writeString(text);
        let alignment = this.alignment;
        await alignment.writeTo(stream);
        let size = this.size;
        await stream.writeDouble(size);
        let color = this.color;
        await color.writeTo(stream);
    }
}

PlacedText.TAG = 0;
DebugData.PlacedText = PlacedText;
/**
 * Circle
 */
class Circle extends DebugData {
    /**
     * Position of the center
     */
    position;
    /**
     * Radius
     */
    radius;
    /**
     * Color
     */
    color;

    constructor(position, radius, color) {
        super();
        this.position = position;
        this.radius = radius;
        this.color = color;
    }

    /**
     * Read Circle from input stream
     */
    static async readFrom(stream) {
        let position;
        position = await Vec2.readFrom(stream);
        let radius;
        radius = await stream.readDouble();
        let color;
        color = await Color.readFrom(stream);
        return new Circle(position, radius, color);
    }

    /**
     * Write Circle to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Circle.TAG);
        let position = this.position;
        await position.writeTo(stream);
        let radius = this.radius;
        await stream.writeDouble(radius);
        let color = this.color;
        await color.writeTo(stream);
    }
}

Circle.TAG = 1;
DebugData.Circle = Circle;
/**
 * Circle with gradient fill
 */
class GradientCircle extends DebugData {
    /**
     * Position of the center
     */
    position;
    /**
     * Radius
     */
    radius;
    /**
     * Color of the center
     */
    innerColor;
    /**
     * Color of the edge
     */
    outerColor;

    constructor(position, radius, innerColor, outerColor) {
        super();
        this.position = position;
        this.radius = radius;
        this.innerColor = innerColor;
        this.outerColor = outerColor;
    }

    /**
     * Read GradientCircle from input stream
     */
    static async readFrom(stream) {
        let position;
        position = await Vec2.readFrom(stream);
        let radius;
        radius = await stream.readDouble();
        let innerColor;
        innerColor = await Color.readFrom(stream);
        let outerColor;
        outerColor = await Color.readFrom(stream);
        return new GradientCircle(position, radius, innerColor, outerColor);
    }

    /**
     * Write GradientCircle to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(GradientCircle.TAG);
        let position = this.position;
        await position.writeTo(stream);
        let radius = this.radius;
        await stream.writeDouble(radius);
        let innerColor = this.innerColor;
        await innerColor.writeTo(stream);
        let outerColor = this.outerColor;
        await outerColor.writeTo(stream);
    }
}

GradientCircle.TAG = 2;
DebugData.GradientCircle = GradientCircle;
/**
 * Ring
 */
class Ring extends DebugData {
    /**
     * Position of the center
     */
    position;
    /**
     * Radius
     */
    radius;
    /**
     * Width
     */
    width;
    /**
     * Color
     */
    color;

    constructor(position, radius, width, color) {
        super();
        this.position = position;
        this.radius = radius;
        this.width = width;
        this.color = color;
    }

    /**
     * Read Ring from input stream
     */
    static async readFrom(stream) {
        let position;
        position = await Vec2.readFrom(stream);
        let radius;
        radius = await stream.readDouble();
        let width;
        width = await stream.readDouble();
        let color;
        color = await Color.readFrom(stream);
        return new Ring(position, radius, width, color);
    }

    /**
     * Write Ring to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Ring.TAG);
        let position = this.position;
        await position.writeTo(stream);
        let radius = this.radius;
        await stream.writeDouble(radius);
        let width = this.width;
        await stream.writeDouble(width);
        let color = this.color;
        await color.writeTo(stream);
    }
}

Ring.TAG = 3;
DebugData.Ring = Ring;
/**
 * Sector of a circle
 */
class Pie extends DebugData {
    /**
     * Position of the center
     */
    position;
    /**
     * Radius
     */
    radius;
    /**
     * Start angle
     */
    startAngle;
    /**
     * End angle
     */
    endAngle;
    /**
     * Color
     */
    color;

    constructor(position, radius, startAngle, endAngle, color) {
        super();
        this.position = position;
        this.radius = radius;
        this.startAngle = startAngle;
        this.endAngle = endAngle;
        this.color = color;
    }

    /**
     * Read Pie from input stream
     */
    static async readFrom(stream) {
        let position;
        position = await Vec2.readFrom(stream);
        let radius;
        radius = await stream.readDouble();
        let startAngle;
        startAngle = await stream.readDouble();
        let endAngle;
        endAngle = await stream.readDouble();
        let color;
        color = await Color.readFrom(stream);
        return new Pie(position, radius, startAngle, endAngle, color);
    }

    /**
     * Write Pie to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Pie.TAG);
        let position = this.position;
        await position.writeTo(stream);
        let radius = this.radius;
        await stream.writeDouble(radius);
        let startAngle = this.startAngle;
        await stream.writeDouble(startAngle);
        let endAngle = this.endAngle;
        await stream.writeDouble(endAngle);
        let color = this.color;
        await color.writeTo(stream);
    }
}

Pie.TAG = 4;
DebugData.Pie = Pie;
/**
 * Arc
 */
class Arc extends DebugData {
    /**
     * Position of the center
     */
    position;
    /**
     * Radius
     */
    radius;
    /**
     * Width
     */
    width;
    /**
     * Start angle
     */
    startAngle;
    /**
     * End angle
     */
    endAngle;
    /**
     * Color
     */
    color;

    constructor(position, radius, width, startAngle, endAngle, color) {
        super();
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
    static async readFrom(stream) {
        let position;
        position = await Vec2.readFrom(stream);
        let radius;
        radius = await stream.readDouble();
        let width;
        width = await stream.readDouble();
        let startAngle;
        startAngle = await stream.readDouble();
        let endAngle;
        endAngle = await stream.readDouble();
        let color;
        color = await Color.readFrom(stream);
        return new Arc(position, radius, width, startAngle, endAngle, color);
    }

    /**
     * Write Arc to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Arc.TAG);
        let position = this.position;
        await position.writeTo(stream);
        let radius = this.radius;
        await stream.writeDouble(radius);
        let width = this.width;
        await stream.writeDouble(width);
        let startAngle = this.startAngle;
        await stream.writeDouble(startAngle);
        let endAngle = this.endAngle;
        await stream.writeDouble(endAngle);
        let color = this.color;
        await color.writeTo(stream);
    }
}

Arc.TAG = 5;
DebugData.Arc = Arc;
/**
 * Rectancle
 */
class Rect extends DebugData {
    /**
     * Bottom left position
     */
    bottomLeft;
    /**
     * Size
     */
    size;
    /**
     * Color
     */
    color;

    constructor(bottomLeft, size, color) {
        super();
        this.bottomLeft = bottomLeft;
        this.size = size;
        this.color = color;
    }

    /**
     * Read Rect from input stream
     */
    static async readFrom(stream) {
        let bottomLeft;
        bottomLeft = await Vec2.readFrom(stream);
        let size;
        size = await Vec2.readFrom(stream);
        let color;
        color = await Color.readFrom(stream);
        return new Rect(bottomLeft, size, color);
    }

    /**
     * Write Rect to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Rect.TAG);
        let bottomLeft = this.bottomLeft;
        await bottomLeft.writeTo(stream);
        let size = this.size;
        await size.writeTo(stream);
        let color = this.color;
        await color.writeTo(stream);
    }
}

Rect.TAG = 6;
DebugData.Rect = Rect;
/**
 * Polygon (convex)
 */
class Polygon extends DebugData {
    /**
     * Positions of vertices in order
     */
    vertices;
    /**
     * Color
     */
    color;

    constructor(vertices, color) {
        super();
        this.vertices = vertices;
        this.color = color;
    }

    /**
     * Read Polygon from input stream
     */
    static async readFrom(stream) {
        let vertices;
        vertices = [];
        for (let verticesCount = await stream.readInt(); verticesCount > 0; verticesCount--) {
            let verticesElement;
            verticesElement = await Vec2.readFrom(stream);
            vertices.push(verticesElement);
        }
        let color;
        color = await Color.readFrom(stream);
        return new Polygon(vertices, color);
    }

    /**
     * Write Polygon to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Polygon.TAG);
        let vertices = this.vertices;
        await stream.writeInt(vertices.length);
        for (let verticesElement of vertices) {
            await verticesElement.writeTo(stream);
        }
        let color = this.color;
        await color.writeTo(stream);
    }
}

Polygon.TAG = 7;
DebugData.Polygon = Polygon;
/**
 * Polygon with gradient fill
 */
class GradientPolygon extends DebugData {
    /**
     * List of vertices in order
     */
    vertices;

    constructor(vertices) {
        super();
        this.vertices = vertices;
    }

    /**
     * Read GradientPolygon from input stream
     */
    static async readFrom(stream) {
        let vertices;
        vertices = [];
        for (let verticesCount = await stream.readInt(); verticesCount > 0; verticesCount--) {
            let verticesElement;
            verticesElement = await ColoredVertex.readFrom(stream);
            vertices.push(verticesElement);
        }
        return new GradientPolygon(vertices);
    }

    /**
     * Write GradientPolygon to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(GradientPolygon.TAG);
        let vertices = this.vertices;
        await stream.writeInt(vertices.length);
        for (let verticesElement of vertices) {
            await verticesElement.writeTo(stream);
        }
    }
}

GradientPolygon.TAG = 8;
DebugData.GradientPolygon = GradientPolygon;
/**
 * Segment
 */
class Segment extends DebugData {
    /**
     * Position of the first end
     */
    firstEnd;
    /**
     * Position of the second end
     */
    secondEnd;
    /**
     * Width
     */
    width;
    /**
     * Color
     */
    color;

    constructor(firstEnd, secondEnd, width, color) {
        super();
        this.firstEnd = firstEnd;
        this.secondEnd = secondEnd;
        this.width = width;
        this.color = color;
    }

    /**
     * Read Segment from input stream
     */
    static async readFrom(stream) {
        let firstEnd;
        firstEnd = await Vec2.readFrom(stream);
        let secondEnd;
        secondEnd = await Vec2.readFrom(stream);
        let width;
        width = await stream.readDouble();
        let color;
        color = await Color.readFrom(stream);
        return new Segment(firstEnd, secondEnd, width, color);
    }

    /**
     * Write Segment to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(Segment.TAG);
        let firstEnd = this.firstEnd;
        await firstEnd.writeTo(stream);
        let secondEnd = this.secondEnd;
        await secondEnd.writeTo(stream);
        let width = this.width;
        await stream.writeDouble(width);
        let color = this.color;
        await color.writeTo(stream);
    }
}

Segment.TAG = 9;
DebugData.Segment = Segment;
/**
 * Segment with gradient fill
 */
class GradientSegment extends DebugData {
    /**
     * Position of the first end
     */
    firstEnd;
    /**
     * Color of the first end
     */
    firstColor;
    /**
     * Position of the second end
     */
    secondEnd;
    /**
     * Color of the second end
     */
    secondColor;
    /**
     * Width
     */
    width;

    constructor(firstEnd, firstColor, secondEnd, secondColor, width) {
        super();
        this.firstEnd = firstEnd;
        this.firstColor = firstColor;
        this.secondEnd = secondEnd;
        this.secondColor = secondColor;
        this.width = width;
    }

    /**
     * Read GradientSegment from input stream
     */
    static async readFrom(stream) {
        let firstEnd;
        firstEnd = await Vec2.readFrom(stream);
        let firstColor;
        firstColor = await Color.readFrom(stream);
        let secondEnd;
        secondEnd = await Vec2.readFrom(stream);
        let secondColor;
        secondColor = await Color.readFrom(stream);
        let width;
        width = await stream.readDouble();
        return new GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width);
    }

    /**
     * Write GradientSegment to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(GradientSegment.TAG);
        let firstEnd = this.firstEnd;
        await firstEnd.writeTo(stream);
        let firstColor = this.firstColor;
        await firstColor.writeTo(stream);
        let secondEnd = this.secondEnd;
        await secondEnd.writeTo(stream);
        let secondColor = this.secondColor;
        await secondColor.writeTo(stream);
        let width = this.width;
        await stream.writeDouble(width);
    }
}

GradientSegment.TAG = 10;
DebugData.GradientSegment = GradientSegment;
/**
 * Poly line
 */
class PolyLine extends DebugData {
    /**
     * List of points in order
     */
    vertices;
    /**
     * Width
     */
    width;
    /**
     * Color
     */
    color;

    constructor(vertices, width, color) {
        super();
        this.vertices = vertices;
        this.width = width;
        this.color = color;
    }

    /**
     * Read PolyLine from input stream
     */
    static async readFrom(stream) {
        let vertices;
        vertices = [];
        for (let verticesCount = await stream.readInt(); verticesCount > 0; verticesCount--) {
            let verticesElement;
            verticesElement = await Vec2.readFrom(stream);
            vertices.push(verticesElement);
        }
        let width;
        width = await stream.readDouble();
        let color;
        color = await Color.readFrom(stream);
        return new PolyLine(vertices, width, color);
    }

    /**
     * Write PolyLine to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(PolyLine.TAG);
        let vertices = this.vertices;
        await stream.writeInt(vertices.length);
        for (let verticesElement of vertices) {
            await verticesElement.writeTo(stream);
        }
        let width = this.width;
        await stream.writeDouble(width);
        let color = this.color;
        await color.writeTo(stream);
    }
}

PolyLine.TAG = 11;
DebugData.PolyLine = PolyLine;
/**
 * Poly line with gradient fill
 */
class GradientPolyLine extends DebugData {
    /**
     * List of points and colors in order
     */
    vertices;
    /**
     * Width
     */
    width;

    constructor(vertices, width) {
        super();
        this.vertices = vertices;
        this.width = width;
    }

    /**
     * Read GradientPolyLine from input stream
     */
    static async readFrom(stream) {
        let vertices;
        vertices = [];
        for (let verticesCount = await stream.readInt(); verticesCount > 0; verticesCount--) {
            let verticesElement;
            verticesElement = await ColoredVertex.readFrom(stream);
            vertices.push(verticesElement);
        }
        let width;
        width = await stream.readDouble();
        return new GradientPolyLine(vertices, width);
    }

    /**
     * Write GradientPolyLine to output stream
     */
    async writeTo(stream) {
        await stream.writeInt(GradientPolyLine.TAG);
        let vertices = this.vertices;
        await stream.writeInt(vertices.length);
        for (let verticesElement of vertices) {
            await verticesElement.writeTo(stream);
        }
        let width = this.width;
        await stream.writeDouble(width);
    }
}

GradientPolyLine.TAG = 12;
DebugData.GradientPolyLine = GradientPolyLine;
module.exports = DebugData;