package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * Data for debug rendering
 */
sealed trait DebugData {
    /**
     * Write DebugData to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit
}

object DebugData {
    /**
     * Text
     *
     * @param position Position
     * @param text Text
     * @param alignment Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
     * @param size Size
     * @param color Color
     */
    case class PlacedText(position: ai_cup_22.model.Vec2, text: String, alignment: ai_cup_22.model.Vec2, size: Double, color: ai_cup_22.debugging.Color) extends DebugData {
        /**
         * Write PlacedText to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, PlacedText.TAG)
            position.writeTo(stream)
            StreamUtil.writeString(stream, text)
            alignment.writeTo(stream)
            StreamUtil.writeDouble(stream, size)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of PlacedText
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("PlacedText { ")
            stringBuilder.append("position: ")
            stringBuilder.append(position)
            stringBuilder.append(", ")
            stringBuilder.append("text: ")
            stringBuilder.append('"' + text + '"')
            stringBuilder.append(", ")
            stringBuilder.append("alignment: ")
            stringBuilder.append(alignment)
            stringBuilder.append(", ")
            stringBuilder.append("size: ")
            stringBuilder.append(size)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object PlacedText {
        val TAG: Int = 0
    
        /**
         * Read PlacedText from input stream
         */
        def readFrom(stream: java.io.InputStream): PlacedText = PlacedText(
            ai_cup_22.model.Vec2.readFrom(stream),
            StreamUtil.readString(stream),
            ai_cup_22.model.Vec2.readFrom(stream),
            StreamUtil.readDouble(stream),
            ai_cup_22.debugging.Color.readFrom(stream)
        )
    }

    /**
     * Circle
     *
     * @param position Position of the center
     * @param radius Radius
     * @param color Color
     */
    case class Circle(position: ai_cup_22.model.Vec2, radius: Double, color: ai_cup_22.debugging.Color) extends DebugData {
        /**
         * Write Circle to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Circle.TAG)
            position.writeTo(stream)
            StreamUtil.writeDouble(stream, radius)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Circle
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Circle { ")
            stringBuilder.append("position: ")
            stringBuilder.append(position)
            stringBuilder.append(", ")
            stringBuilder.append("radius: ")
            stringBuilder.append(radius)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Circle {
        val TAG: Int = 1
    
        /**
         * Read Circle from input stream
         */
        def readFrom(stream: java.io.InputStream): Circle = Circle(
            ai_cup_22.model.Vec2.readFrom(stream),
            StreamUtil.readDouble(stream),
            ai_cup_22.debugging.Color.readFrom(stream)
        )
    }

    /**
     * Circle with gradient fill
     *
     * @param position Position of the center
     * @param radius Radius
     * @param innerColor Color of the center
     * @param outerColor Color of the edge
     */
    case class GradientCircle(position: ai_cup_22.model.Vec2, radius: Double, innerColor: ai_cup_22.debugging.Color, outerColor: ai_cup_22.debugging.Color) extends DebugData {
        /**
         * Write GradientCircle to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, GradientCircle.TAG)
            position.writeTo(stream)
            StreamUtil.writeDouble(stream, radius)
            innerColor.writeTo(stream)
            outerColor.writeTo(stream)
        }
    
        /**
         * Get string representation of GradientCircle
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("GradientCircle { ")
            stringBuilder.append("position: ")
            stringBuilder.append(position)
            stringBuilder.append(", ")
            stringBuilder.append("radius: ")
            stringBuilder.append(radius)
            stringBuilder.append(", ")
            stringBuilder.append("innerColor: ")
            stringBuilder.append(innerColor)
            stringBuilder.append(", ")
            stringBuilder.append("outerColor: ")
            stringBuilder.append(outerColor)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object GradientCircle {
        val TAG: Int = 2
    
        /**
         * Read GradientCircle from input stream
         */
        def readFrom(stream: java.io.InputStream): GradientCircle = GradientCircle(
            ai_cup_22.model.Vec2.readFrom(stream),
            StreamUtil.readDouble(stream),
            ai_cup_22.debugging.Color.readFrom(stream),
            ai_cup_22.debugging.Color.readFrom(stream)
        )
    }

    /**
     * Ring
     *
     * @param position Position of the center
     * @param radius Radius
     * @param width Width
     * @param color Color
     */
    case class Ring(position: ai_cup_22.model.Vec2, radius: Double, width: Double, color: ai_cup_22.debugging.Color) extends DebugData {
        /**
         * Write Ring to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Ring.TAG)
            position.writeTo(stream)
            StreamUtil.writeDouble(stream, radius)
            StreamUtil.writeDouble(stream, width)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Ring
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Ring { ")
            stringBuilder.append("position: ")
            stringBuilder.append(position)
            stringBuilder.append(", ")
            stringBuilder.append("radius: ")
            stringBuilder.append(radius)
            stringBuilder.append(", ")
            stringBuilder.append("width: ")
            stringBuilder.append(width)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Ring {
        val TAG: Int = 3
    
        /**
         * Read Ring from input stream
         */
        def readFrom(stream: java.io.InputStream): Ring = Ring(
            ai_cup_22.model.Vec2.readFrom(stream),
            StreamUtil.readDouble(stream),
            StreamUtil.readDouble(stream),
            ai_cup_22.debugging.Color.readFrom(stream)
        )
    }

    /**
     * Sector of a circle
     *
     * @param position Position of the center
     * @param radius Radius
     * @param startAngle Start angle
     * @param endAngle End angle
     * @param color Color
     */
    case class Pie(position: ai_cup_22.model.Vec2, radius: Double, startAngle: Double, endAngle: Double, color: ai_cup_22.debugging.Color) extends DebugData {
        /**
         * Write Pie to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Pie.TAG)
            position.writeTo(stream)
            StreamUtil.writeDouble(stream, radius)
            StreamUtil.writeDouble(stream, startAngle)
            StreamUtil.writeDouble(stream, endAngle)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Pie
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Pie { ")
            stringBuilder.append("position: ")
            stringBuilder.append(position)
            stringBuilder.append(", ")
            stringBuilder.append("radius: ")
            stringBuilder.append(radius)
            stringBuilder.append(", ")
            stringBuilder.append("startAngle: ")
            stringBuilder.append(startAngle)
            stringBuilder.append(", ")
            stringBuilder.append("endAngle: ")
            stringBuilder.append(endAngle)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Pie {
        val TAG: Int = 4
    
        /**
         * Read Pie from input stream
         */
        def readFrom(stream: java.io.InputStream): Pie = Pie(
            ai_cup_22.model.Vec2.readFrom(stream),
            StreamUtil.readDouble(stream),
            StreamUtil.readDouble(stream),
            StreamUtil.readDouble(stream),
            ai_cup_22.debugging.Color.readFrom(stream)
        )
    }

    /**
     * Arc
     *
     * @param position Position of the center
     * @param radius Radius
     * @param width Width
     * @param startAngle Start angle
     * @param endAngle End angle
     * @param color Color
     */
    case class Arc(position: ai_cup_22.model.Vec2, radius: Double, width: Double, startAngle: Double, endAngle: Double, color: ai_cup_22.debugging.Color) extends DebugData {
        /**
         * Write Arc to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Arc.TAG)
            position.writeTo(stream)
            StreamUtil.writeDouble(stream, radius)
            StreamUtil.writeDouble(stream, width)
            StreamUtil.writeDouble(stream, startAngle)
            StreamUtil.writeDouble(stream, endAngle)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Arc
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Arc { ")
            stringBuilder.append("position: ")
            stringBuilder.append(position)
            stringBuilder.append(", ")
            stringBuilder.append("radius: ")
            stringBuilder.append(radius)
            stringBuilder.append(", ")
            stringBuilder.append("width: ")
            stringBuilder.append(width)
            stringBuilder.append(", ")
            stringBuilder.append("startAngle: ")
            stringBuilder.append(startAngle)
            stringBuilder.append(", ")
            stringBuilder.append("endAngle: ")
            stringBuilder.append(endAngle)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Arc {
        val TAG: Int = 5
    
        /**
         * Read Arc from input stream
         */
        def readFrom(stream: java.io.InputStream): Arc = Arc(
            ai_cup_22.model.Vec2.readFrom(stream),
            StreamUtil.readDouble(stream),
            StreamUtil.readDouble(stream),
            StreamUtil.readDouble(stream),
            StreamUtil.readDouble(stream),
            ai_cup_22.debugging.Color.readFrom(stream)
        )
    }

    /**
     * Rectancle
     *
     * @param bottomLeft Bottom left position
     * @param size Size
     * @param color Color
     */
    case class Rect(bottomLeft: ai_cup_22.model.Vec2, size: ai_cup_22.model.Vec2, color: ai_cup_22.debugging.Color) extends DebugData {
        /**
         * Write Rect to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Rect.TAG)
            bottomLeft.writeTo(stream)
            size.writeTo(stream)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Rect
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Rect { ")
            stringBuilder.append("bottomLeft: ")
            stringBuilder.append(bottomLeft)
            stringBuilder.append(", ")
            stringBuilder.append("size: ")
            stringBuilder.append(size)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Rect {
        val TAG: Int = 6
    
        /**
         * Read Rect from input stream
         */
        def readFrom(stream: java.io.InputStream): Rect = Rect(
            ai_cup_22.model.Vec2.readFrom(stream),
            ai_cup_22.model.Vec2.readFrom(stream),
            ai_cup_22.debugging.Color.readFrom(stream)
        )
    }

    /**
     * Polygon (convex)
     *
     * @param vertices Positions of vertices in order
     * @param color Color
     */
    case class Polygon(vertices: Seq[ai_cup_22.model.Vec2], color: ai_cup_22.debugging.Color) extends DebugData {
        /**
         * Write Polygon to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Polygon.TAG)
            StreamUtil.writeInt(stream, vertices.length)
            vertices.foreach { value =>
                value.writeTo(stream)
            }
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Polygon
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Polygon { ")
            stringBuilder.append("vertices: ")
            stringBuilder.append(vertices)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Polygon {
        val TAG: Int = 7
    
        /**
         * Read Polygon from input stream
         */
        def readFrom(stream: java.io.InputStream): Polygon = Polygon(
            (0 until StreamUtil.readInt(stream)).map { _ =>
                ai_cup_22.model.Vec2.readFrom(stream)
            },
            ai_cup_22.debugging.Color.readFrom(stream)
        )
    }

    /**
     * Polygon with gradient fill
     *
     * @param vertices List of vertices in order
     */
    case class GradientPolygon(vertices: Seq[ai_cup_22.debugging.ColoredVertex]) extends DebugData {
        /**
         * Write GradientPolygon to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, GradientPolygon.TAG)
            StreamUtil.writeInt(stream, vertices.length)
            vertices.foreach { value =>
                value.writeTo(stream)
            }
        }
    
        /**
         * Get string representation of GradientPolygon
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("GradientPolygon { ")
            stringBuilder.append("vertices: ")
            stringBuilder.append(vertices)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object GradientPolygon {
        val TAG: Int = 8
    
        /**
         * Read GradientPolygon from input stream
         */
        def readFrom(stream: java.io.InputStream): GradientPolygon = GradientPolygon(
            (0 until StreamUtil.readInt(stream)).map { _ =>
                ai_cup_22.debugging.ColoredVertex.readFrom(stream)
            }
        )
    }

    /**
     * Segment
     *
     * @param firstEnd Position of the first end
     * @param secondEnd Position of the second end
     * @param width Width
     * @param color Color
     */
    case class Segment(firstEnd: ai_cup_22.model.Vec2, secondEnd: ai_cup_22.model.Vec2, width: Double, color: ai_cup_22.debugging.Color) extends DebugData {
        /**
         * Write Segment to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, Segment.TAG)
            firstEnd.writeTo(stream)
            secondEnd.writeTo(stream)
            StreamUtil.writeDouble(stream, width)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Segment
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("Segment { ")
            stringBuilder.append("firstEnd: ")
            stringBuilder.append(firstEnd)
            stringBuilder.append(", ")
            stringBuilder.append("secondEnd: ")
            stringBuilder.append(secondEnd)
            stringBuilder.append(", ")
            stringBuilder.append("width: ")
            stringBuilder.append(width)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object Segment {
        val TAG: Int = 9
    
        /**
         * Read Segment from input stream
         */
        def readFrom(stream: java.io.InputStream): Segment = Segment(
            ai_cup_22.model.Vec2.readFrom(stream),
            ai_cup_22.model.Vec2.readFrom(stream),
            StreamUtil.readDouble(stream),
            ai_cup_22.debugging.Color.readFrom(stream)
        )
    }

    /**
     * Segment with gradient fill
     *
     * @param firstEnd Position of the first end
     * @param firstColor Color of the first end
     * @param secondEnd Position of the second end
     * @param secondColor Color of the second end
     * @param width Width
     */
    case class GradientSegment(firstEnd: ai_cup_22.model.Vec2, firstColor: ai_cup_22.debugging.Color, secondEnd: ai_cup_22.model.Vec2, secondColor: ai_cup_22.debugging.Color, width: Double) extends DebugData {
        /**
         * Write GradientSegment to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, GradientSegment.TAG)
            firstEnd.writeTo(stream)
            firstColor.writeTo(stream)
            secondEnd.writeTo(stream)
            secondColor.writeTo(stream)
            StreamUtil.writeDouble(stream, width)
        }
    
        /**
         * Get string representation of GradientSegment
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("GradientSegment { ")
            stringBuilder.append("firstEnd: ")
            stringBuilder.append(firstEnd)
            stringBuilder.append(", ")
            stringBuilder.append("firstColor: ")
            stringBuilder.append(firstColor)
            stringBuilder.append(", ")
            stringBuilder.append("secondEnd: ")
            stringBuilder.append(secondEnd)
            stringBuilder.append(", ")
            stringBuilder.append("secondColor: ")
            stringBuilder.append(secondColor)
            stringBuilder.append(", ")
            stringBuilder.append("width: ")
            stringBuilder.append(width)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object GradientSegment {
        val TAG: Int = 10
    
        /**
         * Read GradientSegment from input stream
         */
        def readFrom(stream: java.io.InputStream): GradientSegment = GradientSegment(
            ai_cup_22.model.Vec2.readFrom(stream),
            ai_cup_22.debugging.Color.readFrom(stream),
            ai_cup_22.model.Vec2.readFrom(stream),
            ai_cup_22.debugging.Color.readFrom(stream),
            StreamUtil.readDouble(stream)
        )
    }

    /**
     * Poly line
     *
     * @param vertices List of points in order
     * @param width Width
     * @param color Color
     */
    case class PolyLine(vertices: Seq[ai_cup_22.model.Vec2], width: Double, color: ai_cup_22.debugging.Color) extends DebugData {
        /**
         * Write PolyLine to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, PolyLine.TAG)
            StreamUtil.writeInt(stream, vertices.length)
            vertices.foreach { value =>
                value.writeTo(stream)
            }
            StreamUtil.writeDouble(stream, width)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of PolyLine
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("PolyLine { ")
            stringBuilder.append("vertices: ")
            stringBuilder.append(vertices)
            stringBuilder.append(", ")
            stringBuilder.append("width: ")
            stringBuilder.append(width)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object PolyLine {
        val TAG: Int = 11
    
        /**
         * Read PolyLine from input stream
         */
        def readFrom(stream: java.io.InputStream): PolyLine = PolyLine(
            (0 until StreamUtil.readInt(stream)).map { _ =>
                ai_cup_22.model.Vec2.readFrom(stream)
            },
            StreamUtil.readDouble(stream),
            ai_cup_22.debugging.Color.readFrom(stream)
        )
    }

    /**
     * Poly line with gradient fill
     *
     * @param vertices List of points and colors in order
     * @param width Width
     */
    case class GradientPolyLine(vertices: Seq[ai_cup_22.debugging.ColoredVertex], width: Double) extends DebugData {
        /**
         * Write GradientPolyLine to output stream
         */
        override def writeTo(stream: java.io.OutputStream): scala.Unit = {
            StreamUtil.writeInt(stream, GradientPolyLine.TAG)
            StreamUtil.writeInt(stream, vertices.length)
            vertices.foreach { value =>
                value.writeTo(stream)
            }
            StreamUtil.writeDouble(stream, width)
        }
    
        /**
         * Get string representation of GradientPolyLine
         */
        override def toString(): String = {
            var stringBuilder = new StringBuilder("GradientPolyLine { ")
            stringBuilder.append("vertices: ")
            stringBuilder.append(vertices)
            stringBuilder.append(", ")
            stringBuilder.append("width: ")
            stringBuilder.append(width)
            stringBuilder.append(" }")
            stringBuilder.toString()
        }
    }
    
    object GradientPolyLine {
        val TAG: Int = 12
    
        /**
         * Read GradientPolyLine from input stream
         */
        def readFrom(stream: java.io.InputStream): GradientPolyLine = GradientPolyLine(
            (0 until StreamUtil.readInt(stream)).map { _ =>
                ai_cup_22.debugging.ColoredVertex.readFrom(stream)
            },
            StreamUtil.readDouble(stream)
        )
    }

    /**
     * Read DebugData from input stream
     */
    def readFrom(stream: java.io.InputStream): DebugData = {
        StreamUtil.readInt(stream) match {
            case PlacedText.TAG => PlacedText.readFrom(stream)
            case Circle.TAG => Circle.readFrom(stream)
            case GradientCircle.TAG => GradientCircle.readFrom(stream)
            case Ring.TAG => Ring.readFrom(stream)
            case Pie.TAG => Pie.readFrom(stream)
            case Arc.TAG => Arc.readFrom(stream)
            case Rect.TAG => Rect.readFrom(stream)
            case Polygon.TAG => Polygon.readFrom(stream)
            case GradientPolygon.TAG => GradientPolygon.readFrom(stream)
            case Segment.TAG => Segment.readFrom(stream)
            case GradientSegment.TAG => GradientSegment.readFrom(stream)
            case PolyLine.TAG => PolyLine.readFrom(stream)
            case GradientPolyLine.TAG => GradientPolyLine.readFrom(stream)
            case _ => throw new java.io.IOException("Unexpected tag value")
        }
    }
}