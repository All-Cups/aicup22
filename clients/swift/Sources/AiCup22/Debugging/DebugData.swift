/// Data for debug rendering
enum DebugData {
    /// Text
    ///
    /// - position: Position
    /// - text: Text
    /// - alignment: Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
    /// - size: Size
    /// - color: Color
    case placedText(position: Vec2, text: String, alignment: Vec2, size: Double, color: Color)

    /// Circle
    ///
    /// - position: Position of the center
    /// - radius: Radius
    /// - color: Color
    case circle(position: Vec2, radius: Double, color: Color)

    /// Circle with gradient fill
    ///
    /// - position: Position of the center
    /// - radius: Radius
    /// - innerColor: Color of the center
    /// - outerColor: Color of the edge
    case gradientCircle(position: Vec2, radius: Double, innerColor: Color, outerColor: Color)

    /// Ring
    ///
    /// - position: Position of the center
    /// - radius: Radius
    /// - width: Width
    /// - color: Color
    case ring(position: Vec2, radius: Double, width: Double, color: Color)

    /// Sector of a circle
    ///
    /// - position: Position of the center
    /// - radius: Radius
    /// - startAngle: Start angle
    /// - endAngle: End angle
    /// - color: Color
    case pie(position: Vec2, radius: Double, startAngle: Double, endAngle: Double, color: Color)

    /// Arc
    ///
    /// - position: Position of the center
    /// - radius: Radius
    /// - width: Width
    /// - startAngle: Start angle
    /// - endAngle: End angle
    /// - color: Color
    case arc(position: Vec2, radius: Double, width: Double, startAngle: Double, endAngle: Double, color: Color)

    /// Rectancle
    ///
    /// - bottomLeft: Bottom left position
    /// - size: Size
    /// - color: Color
    case rect(bottomLeft: Vec2, size: Vec2, color: Color)

    /// Polygon (convex)
    ///
    /// - vertices: Positions of vertices in order
    /// - color: Color
    case polygon(vertices: [Vec2], color: Color)

    /// Polygon with gradient fill
    ///
    /// - vertices: List of vertices in order
    case gradientPolygon(vertices: [ColoredVertex])

    /// Segment
    ///
    /// - firstEnd: Position of the first end
    /// - secondEnd: Position of the second end
    /// - width: Width
    /// - color: Color
    case segment(firstEnd: Vec2, secondEnd: Vec2, width: Double, color: Color)

    /// Segment with gradient fill
    ///
    /// - firstEnd: Position of the first end
    /// - firstColor: Color of the first end
    /// - secondEnd: Position of the second end
    /// - secondColor: Color of the second end
    /// - width: Width
    case gradientSegment(firstEnd: Vec2, firstColor: Color, secondEnd: Vec2, secondColor: Color, width: Double)

    /// Poly line
    ///
    /// - vertices: List of points in order
    /// - width: Width
    /// - color: Color
    case polyLine(vertices: [Vec2], width: Double, color: Color)

    /// Poly line with gradient fill
    ///
    /// - vertices: List of points and colors in order
    /// - width: Width
    case gradientPolyLine(vertices: [ColoredVertex], width: Double)

    /// Read DebugData from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> DebugData {
        switch stream.readInt32() {
            case 0:
                var position: Vec2
                position = Vec2.readFrom(stream)
                var text: String
                text = stream.readString()
                var alignment: Vec2
                alignment = Vec2.readFrom(stream)
                var size: Double
                size = stream.readDouble()
                var color: Color
                color = Color.readFrom(stream)
                return DebugData.placedText(position: position, text: text, alignment: alignment, size: size, color: color)
            case 1:
                var position: Vec2
                position = Vec2.readFrom(stream)
                var radius: Double
                radius = stream.readDouble()
                var color: Color
                color = Color.readFrom(stream)
                return DebugData.circle(position: position, radius: radius, color: color)
            case 2:
                var position: Vec2
                position = Vec2.readFrom(stream)
                var radius: Double
                radius = stream.readDouble()
                var innerColor: Color
                innerColor = Color.readFrom(stream)
                var outerColor: Color
                outerColor = Color.readFrom(stream)
                return DebugData.gradientCircle(position: position, radius: radius, innerColor: innerColor, outerColor: outerColor)
            case 3:
                var position: Vec2
                position = Vec2.readFrom(stream)
                var radius: Double
                radius = stream.readDouble()
                var width: Double
                width = stream.readDouble()
                var color: Color
                color = Color.readFrom(stream)
                return DebugData.ring(position: position, radius: radius, width: width, color: color)
            case 4:
                var position: Vec2
                position = Vec2.readFrom(stream)
                var radius: Double
                radius = stream.readDouble()
                var startAngle: Double
                startAngle = stream.readDouble()
                var endAngle: Double
                endAngle = stream.readDouble()
                var color: Color
                color = Color.readFrom(stream)
                return DebugData.pie(position: position, radius: radius, startAngle: startAngle, endAngle: endAngle, color: color)
            case 5:
                var position: Vec2
                position = Vec2.readFrom(stream)
                var radius: Double
                radius = stream.readDouble()
                var width: Double
                width = stream.readDouble()
                var startAngle: Double
                startAngle = stream.readDouble()
                var endAngle: Double
                endAngle = stream.readDouble()
                var color: Color
                color = Color.readFrom(stream)
                return DebugData.arc(position: position, radius: radius, width: width, startAngle: startAngle, endAngle: endAngle, color: color)
            case 6:
                var bottomLeft: Vec2
                bottomLeft = Vec2.readFrom(stream)
                var size: Vec2
                size = Vec2.readFrom(stream)
                var color: Color
                color = Color.readFrom(stream)
                return DebugData.rect(bottomLeft: bottomLeft, size: size, color: color)
            case 7:
                var vertices: [Vec2]
                let verticesSize = stream.readInt32()
                vertices = (0..<verticesSize).map{ _ in
                    var verticesSize: Vec2
                    verticesSize = Vec2.readFrom(stream)
                    return verticesSize
                }
                var color: Color
                color = Color.readFrom(stream)
                return DebugData.polygon(vertices: vertices, color: color)
            case 8:
                var vertices: [ColoredVertex]
                let verticesSize = stream.readInt32()
                vertices = (0..<verticesSize).map{ _ in
                    var verticesSize: ColoredVertex
                    verticesSize = ColoredVertex.readFrom(stream)
                    return verticesSize
                }
                return DebugData.gradientPolygon(vertices: vertices)
            case 9:
                var firstEnd: Vec2
                firstEnd = Vec2.readFrom(stream)
                var secondEnd: Vec2
                secondEnd = Vec2.readFrom(stream)
                var width: Double
                width = stream.readDouble()
                var color: Color
                color = Color.readFrom(stream)
                return DebugData.segment(firstEnd: firstEnd, secondEnd: secondEnd, width: width, color: color)
            case 10:
                var firstEnd: Vec2
                firstEnd = Vec2.readFrom(stream)
                var firstColor: Color
                firstColor = Color.readFrom(stream)
                var secondEnd: Vec2
                secondEnd = Vec2.readFrom(stream)
                var secondColor: Color
                secondColor = Color.readFrom(stream)
                var width: Double
                width = stream.readDouble()
                return DebugData.gradientSegment(firstEnd: firstEnd, firstColor: firstColor, secondEnd: secondEnd, secondColor: secondColor, width: width)
            case 11:
                var vertices: [Vec2]
                let verticesSize = stream.readInt32()
                vertices = (0..<verticesSize).map{ _ in
                    var verticesSize: Vec2
                    verticesSize = Vec2.readFrom(stream)
                    return verticesSize
                }
                var width: Double
                width = stream.readDouble()
                var color: Color
                color = Color.readFrom(stream)
                return DebugData.polyLine(vertices: vertices, width: width, color: color)
            case 12:
                var vertices: [ColoredVertex]
                let verticesSize = stream.readInt32()
                vertices = (0..<verticesSize).map{ _ in
                    var verticesSize: ColoredVertex
                    verticesSize = ColoredVertex.readFrom(stream)
                    return verticesSize
                }
                var width: Double
                width = stream.readDouble()
                return DebugData.gradientPolyLine(vertices: vertices, width: width)
            default:
                fatalError("Unexpected tag value")
        }
    }

    /// Write DebugData to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        switch self {
            case let .placedText(position, text, alignment, size, color):
                stream.writeInt32(0)
                position.writeTo(stream)
                stream.writeString(text)
                alignment.writeTo(stream)
                stream.writeDouble(size)
                color.writeTo(stream)
            case let .circle(position, radius, color):
                stream.writeInt32(1)
                position.writeTo(stream)
                stream.writeDouble(radius)
                color.writeTo(stream)
            case let .gradientCircle(position, radius, innerColor, outerColor):
                stream.writeInt32(2)
                position.writeTo(stream)
                stream.writeDouble(radius)
                innerColor.writeTo(stream)
                outerColor.writeTo(stream)
            case let .ring(position, radius, width, color):
                stream.writeInt32(3)
                position.writeTo(stream)
                stream.writeDouble(radius)
                stream.writeDouble(width)
                color.writeTo(stream)
            case let .pie(position, radius, startAngle, endAngle, color):
                stream.writeInt32(4)
                position.writeTo(stream)
                stream.writeDouble(radius)
                stream.writeDouble(startAngle)
                stream.writeDouble(endAngle)
                color.writeTo(stream)
            case let .arc(position, radius, width, startAngle, endAngle, color):
                stream.writeInt32(5)
                position.writeTo(stream)
                stream.writeDouble(radius)
                stream.writeDouble(width)
                stream.writeDouble(startAngle)
                stream.writeDouble(endAngle)
                color.writeTo(stream)
            case let .rect(bottomLeft, size, color):
                stream.writeInt32(6)
                bottomLeft.writeTo(stream)
                size.writeTo(stream)
                color.writeTo(stream)
            case let .polygon(vertices, color):
                stream.writeInt32(7)
                stream.writeInt32(Int32(vertices.count))
                for verticesElement in vertices {
                    verticesElement.writeTo(stream)
                }
                color.writeTo(stream)
            case let .gradientPolygon(vertices):
                stream.writeInt32(8)
                stream.writeInt32(Int32(vertices.count))
                for verticesElement in vertices {
                    verticesElement.writeTo(stream)
                }
            case let .segment(firstEnd, secondEnd, width, color):
                stream.writeInt32(9)
                firstEnd.writeTo(stream)
                secondEnd.writeTo(stream)
                stream.writeDouble(width)
                color.writeTo(stream)
            case let .gradientSegment(firstEnd, firstColor, secondEnd, secondColor, width):
                stream.writeInt32(10)
                firstEnd.writeTo(stream)
                firstColor.writeTo(stream)
                secondEnd.writeTo(stream)
                secondColor.writeTo(stream)
                stream.writeDouble(width)
            case let .polyLine(vertices, width, color):
                stream.writeInt32(11)
                stream.writeInt32(Int32(vertices.count))
                for verticesElement in vertices {
                    verticesElement.writeTo(stream)
                }
                stream.writeDouble(width)
                color.writeTo(stream)
            case let .gradientPolyLine(vertices, width):
                stream.writeInt32(12)
                stream.writeInt32(Int32(vertices.count))
                for verticesElement in vertices {
                    verticesElement.writeTo(stream)
                }
                stream.writeDouble(width)
        }
    }
}
