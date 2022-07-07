import { Color } from "./color";
import { ColoredVertex } from "./colored-vertex";
import { Vec2 } from "../model/vec2";
import { Stream } from "../stream";

/**
 * Data for debug rendering
 */
export abstract class DebugData {
    /**
     * Write DebugData to output stream
     */
    abstract writeTo(stream: Stream): Promise<void>;

    /**
     * Read DebugData from input stream
     */
    static async readFrom(stream: Stream): Promise<DebugData> {
        const tag = await stream.readInt();
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

export namespace DebugData {
    /**
     * Text
     */
    export class PlacedText extends DebugData {
        /**
         * Position
         */
        position: Vec2
        /**
         * Text
         */
        text: string
        /**
         * Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
         */
        alignment: Vec2
        /**
         * Size
         */
        size: number
        /**
         * Color
         */
        color: Color
    
        constructor(position: Vec2, text: string, alignment: Vec2, size: number, color: Color) {
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
        static async readFrom(stream: Stream): Promise<DebugData.PlacedText> {
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
            return new PlacedText(position, text, alignment, size, color)
        }
    
        /**
         * Write PlacedText to output stream
         */
        async writeTo(stream: Stream) {
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
    
    export namespace PlacedText {
        export const TAG = 0;
    }
    /**
     * Circle
     */
    export class Circle extends DebugData {
        /**
         * Position of the center
         */
        position: Vec2
        /**
         * Radius
         */
        radius: number
        /**
         * Color
         */
        color: Color
    
        constructor(position: Vec2, radius: number, color: Color) {
            super();
            this.position = position;
            this.radius = radius;
            this.color = color;
        }
    
        /**
         * Read Circle from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugData.Circle> {
            let position;
            position = await Vec2.readFrom(stream);
            let radius;
            radius = await stream.readDouble();
            let color;
            color = await Color.readFrom(stream);
            return new Circle(position, radius, color)
        }
    
        /**
         * Write Circle to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(Circle.TAG);
            let position = this.position;
            await position.writeTo(stream);
            let radius = this.radius;
            await stream.writeDouble(radius);
            let color = this.color;
            await color.writeTo(stream);
        }
    }
    
    export namespace Circle {
        export const TAG = 1;
    }
    /**
     * Circle with gradient fill
     */
    export class GradientCircle extends DebugData {
        /**
         * Position of the center
         */
        position: Vec2
        /**
         * Radius
         */
        radius: number
        /**
         * Color of the center
         */
        innerColor: Color
        /**
         * Color of the edge
         */
        outerColor: Color
    
        constructor(position: Vec2, radius: number, innerColor: Color, outerColor: Color) {
            super();
            this.position = position;
            this.radius = radius;
            this.innerColor = innerColor;
            this.outerColor = outerColor;
        }
    
        /**
         * Read GradientCircle from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugData.GradientCircle> {
            let position;
            position = await Vec2.readFrom(stream);
            let radius;
            radius = await stream.readDouble();
            let innerColor;
            innerColor = await Color.readFrom(stream);
            let outerColor;
            outerColor = await Color.readFrom(stream);
            return new GradientCircle(position, radius, innerColor, outerColor)
        }
    
        /**
         * Write GradientCircle to output stream
         */
        async writeTo(stream: Stream) {
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
    
    export namespace GradientCircle {
        export const TAG = 2;
    }
    /**
     * Ring
     */
    export class Ring extends DebugData {
        /**
         * Position of the center
         */
        position: Vec2
        /**
         * Radius
         */
        radius: number
        /**
         * Width
         */
        width: number
        /**
         * Color
         */
        color: Color
    
        constructor(position: Vec2, radius: number, width: number, color: Color) {
            super();
            this.position = position;
            this.radius = radius;
            this.width = width;
            this.color = color;
        }
    
        /**
         * Read Ring from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugData.Ring> {
            let position;
            position = await Vec2.readFrom(stream);
            let radius;
            radius = await stream.readDouble();
            let width;
            width = await stream.readDouble();
            let color;
            color = await Color.readFrom(stream);
            return new Ring(position, radius, width, color)
        }
    
        /**
         * Write Ring to output stream
         */
        async writeTo(stream: Stream) {
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
    
    export namespace Ring {
        export const TAG = 3;
    }
    /**
     * Sector of a circle
     */
    export class Pie extends DebugData {
        /**
         * Position of the center
         */
        position: Vec2
        /**
         * Radius
         */
        radius: number
        /**
         * Start angle
         */
        startAngle: number
        /**
         * End angle
         */
        endAngle: number
        /**
         * Color
         */
        color: Color
    
        constructor(position: Vec2, radius: number, startAngle: number, endAngle: number, color: Color) {
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
        static async readFrom(stream: Stream): Promise<DebugData.Pie> {
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
            return new Pie(position, radius, startAngle, endAngle, color)
        }
    
        /**
         * Write Pie to output stream
         */
        async writeTo(stream: Stream) {
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
    
    export namespace Pie {
        export const TAG = 4;
    }
    /**
     * Arc
     */
    export class Arc extends DebugData {
        /**
         * Position of the center
         */
        position: Vec2
        /**
         * Radius
         */
        radius: number
        /**
         * Width
         */
        width: number
        /**
         * Start angle
         */
        startAngle: number
        /**
         * End angle
         */
        endAngle: number
        /**
         * Color
         */
        color: Color
    
        constructor(position: Vec2, radius: number, width: number, startAngle: number, endAngle: number, color: Color) {
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
        static async readFrom(stream: Stream): Promise<DebugData.Arc> {
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
            return new Arc(position, radius, width, startAngle, endAngle, color)
        }
    
        /**
         * Write Arc to output stream
         */
        async writeTo(stream: Stream) {
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
    
    export namespace Arc {
        export const TAG = 5;
    }
    /**
     * Rectancle
     */
    export class Rect extends DebugData {
        /**
         * Bottom left position
         */
        bottomLeft: Vec2
        /**
         * Size
         */
        size: Vec2
        /**
         * Color
         */
        color: Color
    
        constructor(bottomLeft: Vec2, size: Vec2, color: Color) {
            super();
            this.bottomLeft = bottomLeft;
            this.size = size;
            this.color = color;
        }
    
        /**
         * Read Rect from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugData.Rect> {
            let bottomLeft;
            bottomLeft = await Vec2.readFrom(stream);
            let size;
            size = await Vec2.readFrom(stream);
            let color;
            color = await Color.readFrom(stream);
            return new Rect(bottomLeft, size, color)
        }
    
        /**
         * Write Rect to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(Rect.TAG);
            let bottomLeft = this.bottomLeft;
            await bottomLeft.writeTo(stream);
            let size = this.size;
            await size.writeTo(stream);
            let color = this.color;
            await color.writeTo(stream);
        }
    }
    
    export namespace Rect {
        export const TAG = 6;
    }
    /**
     * Polygon (convex)
     */
    export class Polygon extends DebugData {
        /**
         * Positions of vertices in order
         */
        vertices: Array<Vec2>
        /**
         * Color
         */
        color: Color
    
        constructor(vertices: Array<Vec2>, color: Color) {
            super();
            this.vertices = vertices;
            this.color = color;
        }
    
        /**
         * Read Polygon from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugData.Polygon> {
            let vertices;
            vertices = [];
            for (let verticesCount = await stream.readInt(); verticesCount > 0; verticesCount--) {
                let verticesElement;
                verticesElement = await Vec2.readFrom(stream);
                vertices.push(verticesElement);
            }
            let color;
            color = await Color.readFrom(stream);
            return new Polygon(vertices, color)
        }
    
        /**
         * Write Polygon to output stream
         */
        async writeTo(stream: Stream) {
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
    
    export namespace Polygon {
        export const TAG = 7;
    }
    /**
     * Polygon with gradient fill
     */
    export class GradientPolygon extends DebugData {
        /**
         * List of vertices in order
         */
        vertices: Array<ColoredVertex>
    
        constructor(vertices: Array<ColoredVertex>) {
            super();
            this.vertices = vertices;
        }
    
        /**
         * Read GradientPolygon from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugData.GradientPolygon> {
            let vertices;
            vertices = [];
            for (let verticesCount = await stream.readInt(); verticesCount > 0; verticesCount--) {
                let verticesElement;
                verticesElement = await ColoredVertex.readFrom(stream);
                vertices.push(verticesElement);
            }
            return new GradientPolygon(vertices)
        }
    
        /**
         * Write GradientPolygon to output stream
         */
        async writeTo(stream: Stream) {
            await stream.writeInt(GradientPolygon.TAG);
            let vertices = this.vertices;
            await stream.writeInt(vertices.length);
            for (let verticesElement of vertices) {
                await verticesElement.writeTo(stream);
            }
        }
    }
    
    export namespace GradientPolygon {
        export const TAG = 8;
    }
    /**
     * Segment
     */
    export class Segment extends DebugData {
        /**
         * Position of the first end
         */
        firstEnd: Vec2
        /**
         * Position of the second end
         */
        secondEnd: Vec2
        /**
         * Width
         */
        width: number
        /**
         * Color
         */
        color: Color
    
        constructor(firstEnd: Vec2, secondEnd: Vec2, width: number, color: Color) {
            super();
            this.firstEnd = firstEnd;
            this.secondEnd = secondEnd;
            this.width = width;
            this.color = color;
        }
    
        /**
         * Read Segment from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugData.Segment> {
            let firstEnd;
            firstEnd = await Vec2.readFrom(stream);
            let secondEnd;
            secondEnd = await Vec2.readFrom(stream);
            let width;
            width = await stream.readDouble();
            let color;
            color = await Color.readFrom(stream);
            return new Segment(firstEnd, secondEnd, width, color)
        }
    
        /**
         * Write Segment to output stream
         */
        async writeTo(stream: Stream) {
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
    
    export namespace Segment {
        export const TAG = 9;
    }
    /**
     * Segment with gradient fill
     */
    export class GradientSegment extends DebugData {
        /**
         * Position of the first end
         */
        firstEnd: Vec2
        /**
         * Color of the first end
         */
        firstColor: Color
        /**
         * Position of the second end
         */
        secondEnd: Vec2
        /**
         * Color of the second end
         */
        secondColor: Color
        /**
         * Width
         */
        width: number
    
        constructor(firstEnd: Vec2, firstColor: Color, secondEnd: Vec2, secondColor: Color, width: number) {
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
        static async readFrom(stream: Stream): Promise<DebugData.GradientSegment> {
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
            return new GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width)
        }
    
        /**
         * Write GradientSegment to output stream
         */
        async writeTo(stream: Stream) {
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
    
    export namespace GradientSegment {
        export const TAG = 10;
    }
    /**
     * Poly line
     */
    export class PolyLine extends DebugData {
        /**
         * List of points in order
         */
        vertices: Array<Vec2>
        /**
         * Width
         */
        width: number
        /**
         * Color
         */
        color: Color
    
        constructor(vertices: Array<Vec2>, width: number, color: Color) {
            super();
            this.vertices = vertices;
            this.width = width;
            this.color = color;
        }
    
        /**
         * Read PolyLine from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugData.PolyLine> {
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
            return new PolyLine(vertices, width, color)
        }
    
        /**
         * Write PolyLine to output stream
         */
        async writeTo(stream: Stream) {
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
    
    export namespace PolyLine {
        export const TAG = 11;
    }
    /**
     * Poly line with gradient fill
     */
    export class GradientPolyLine extends DebugData {
        /**
         * List of points and colors in order
         */
        vertices: Array<ColoredVertex>
        /**
         * Width
         */
        width: number
    
        constructor(vertices: Array<ColoredVertex>, width: number) {
            super();
            this.vertices = vertices;
            this.width = width;
        }
    
        /**
         * Read GradientPolyLine from input stream
         */
        static async readFrom(stream: Stream): Promise<DebugData.GradientPolyLine> {
            let vertices;
            vertices = [];
            for (let verticesCount = await stream.readInt(); verticesCount > 0; verticesCount--) {
                let verticesElement;
                verticesElement = await ColoredVertex.readFrom(stream);
                vertices.push(verticesElement);
            }
            let width;
            width = await stream.readDouble();
            return new GradientPolyLine(vertices, width)
        }
    
        /**
         * Write GradientPolyLine to output stream
         */
        async writeTo(stream: Stream) {
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
    
    export namespace GradientPolyLine {
        export const TAG = 12;
    }
}