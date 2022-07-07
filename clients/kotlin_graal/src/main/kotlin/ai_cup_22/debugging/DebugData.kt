package ai_cup_22.debugging

import ai_cup_22.util.StreamUtil

/**
 * Data for debug rendering
 */
abstract class DebugData {
    /**
     * Write DebugData to output stream
     */
    @Throws(java.io.IOException::class)
    abstract fun writeTo(stream: java.io.OutputStream)

    companion object {
        /**
         * Read DebugData from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): DebugData {
            when (StreamUtil.readInt(stream)) {
                PlacedText.TAG -> return PlacedText.readFrom(stream)
                Circle.TAG -> return Circle.readFrom(stream)
                GradientCircle.TAG -> return GradientCircle.readFrom(stream)
                Ring.TAG -> return Ring.readFrom(stream)
                Pie.TAG -> return Pie.readFrom(stream)
                Arc.TAG -> return Arc.readFrom(stream)
                Rect.TAG -> return Rect.readFrom(stream)
                Polygon.TAG -> return Polygon.readFrom(stream)
                GradientPolygon.TAG -> return GradientPolygon.readFrom(stream)
                Segment.TAG -> return Segment.readFrom(stream)
                GradientSegment.TAG -> return GradientSegment.readFrom(stream)
                PolyLine.TAG -> return PolyLine.readFrom(stream)
                GradientPolyLine.TAG -> return GradientPolyLine.readFrom(stream)
                else -> throw java.io.IOException("Unexpected tag value")
            }
        }
    }

    /**
     * Text
     */
    class PlacedText : DebugData {
        /**
         * Position
         */
        var position: ai_cup_22.model.Vec2
        /**
         * Text
         */
        var text: String
        /**
         * Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
         */
        var alignment: ai_cup_22.model.Vec2
        /**
         * Size
         */
        var size: Double
        /**
         * Color
         */
        var color: ai_cup_22.debugging.Color
    
        constructor(position: ai_cup_22.model.Vec2, text: String, alignment: ai_cup_22.model.Vec2, size: Double, color: ai_cup_22.debugging.Color) {
            this.position = position
            this.text = text
            this.alignment = alignment
            this.size = size
            this.color = color
        }
    
        /**
         * Write PlacedText to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            position.writeTo(stream)
            StreamUtil.writeString(stream, text)
            alignment.writeTo(stream)
            StreamUtil.writeDouble(stream, size)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of PlacedText
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("PlacedText { ")
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
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 0
    
            /**
             * Read PlacedText from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): PlacedText {
                var position: ai_cup_22.model.Vec2
                position = ai_cup_22.model.Vec2.readFrom(stream)
                var text: String
                text = StreamUtil.readString(stream)
                var alignment: ai_cup_22.model.Vec2
                alignment = ai_cup_22.model.Vec2.readFrom(stream)
                var size: Double
                size = StreamUtil.readDouble(stream)
                var color: ai_cup_22.debugging.Color
                color = ai_cup_22.debugging.Color.readFrom(stream)
                return PlacedText(position, text, alignment, size, color)
            }
        }
    }

    /**
     * Circle
     */
    class Circle : DebugData {
        /**
         * Position of the center
         */
        var position: ai_cup_22.model.Vec2
        /**
         * Radius
         */
        var radius: Double
        /**
         * Color
         */
        var color: ai_cup_22.debugging.Color
    
        constructor(position: ai_cup_22.model.Vec2, radius: Double, color: ai_cup_22.debugging.Color) {
            this.position = position
            this.radius = radius
            this.color = color
        }
    
        /**
         * Write Circle to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            position.writeTo(stream)
            StreamUtil.writeDouble(stream, radius)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Circle
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Circle { ")
            stringBuilder.append("position: ")
            stringBuilder.append(position)
            stringBuilder.append(", ")
            stringBuilder.append("radius: ")
            stringBuilder.append(radius)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 1
    
            /**
             * Read Circle from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Circle {
                var position: ai_cup_22.model.Vec2
                position = ai_cup_22.model.Vec2.readFrom(stream)
                var radius: Double
                radius = StreamUtil.readDouble(stream)
                var color: ai_cup_22.debugging.Color
                color = ai_cup_22.debugging.Color.readFrom(stream)
                return Circle(position, radius, color)
            }
        }
    }

    /**
     * Circle with gradient fill
     */
    class GradientCircle : DebugData {
        /**
         * Position of the center
         */
        var position: ai_cup_22.model.Vec2
        /**
         * Radius
         */
        var radius: Double
        /**
         * Color of the center
         */
        var innerColor: ai_cup_22.debugging.Color
        /**
         * Color of the edge
         */
        var outerColor: ai_cup_22.debugging.Color
    
        constructor(position: ai_cup_22.model.Vec2, radius: Double, innerColor: ai_cup_22.debugging.Color, outerColor: ai_cup_22.debugging.Color) {
            this.position = position
            this.radius = radius
            this.innerColor = innerColor
            this.outerColor = outerColor
        }
    
        /**
         * Write GradientCircle to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            position.writeTo(stream)
            StreamUtil.writeDouble(stream, radius)
            innerColor.writeTo(stream)
            outerColor.writeTo(stream)
        }
    
        /**
         * Get string representation of GradientCircle
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("GradientCircle { ")
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
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 2
    
            /**
             * Read GradientCircle from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): GradientCircle {
                var position: ai_cup_22.model.Vec2
                position = ai_cup_22.model.Vec2.readFrom(stream)
                var radius: Double
                radius = StreamUtil.readDouble(stream)
                var innerColor: ai_cup_22.debugging.Color
                innerColor = ai_cup_22.debugging.Color.readFrom(stream)
                var outerColor: ai_cup_22.debugging.Color
                outerColor = ai_cup_22.debugging.Color.readFrom(stream)
                return GradientCircle(position, radius, innerColor, outerColor)
            }
        }
    }

    /**
     * Ring
     */
    class Ring : DebugData {
        /**
         * Position of the center
         */
        var position: ai_cup_22.model.Vec2
        /**
         * Radius
         */
        var radius: Double
        /**
         * Width
         */
        var width: Double
        /**
         * Color
         */
        var color: ai_cup_22.debugging.Color
    
        constructor(position: ai_cup_22.model.Vec2, radius: Double, width: Double, color: ai_cup_22.debugging.Color) {
            this.position = position
            this.radius = radius
            this.width = width
            this.color = color
        }
    
        /**
         * Write Ring to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            position.writeTo(stream)
            StreamUtil.writeDouble(stream, radius)
            StreamUtil.writeDouble(stream, width)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Ring
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Ring { ")
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
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 3
    
            /**
             * Read Ring from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Ring {
                var position: ai_cup_22.model.Vec2
                position = ai_cup_22.model.Vec2.readFrom(stream)
                var radius: Double
                radius = StreamUtil.readDouble(stream)
                var width: Double
                width = StreamUtil.readDouble(stream)
                var color: ai_cup_22.debugging.Color
                color = ai_cup_22.debugging.Color.readFrom(stream)
                return Ring(position, radius, width, color)
            }
        }
    }

    /**
     * Sector of a circle
     */
    class Pie : DebugData {
        /**
         * Position of the center
         */
        var position: ai_cup_22.model.Vec2
        /**
         * Radius
         */
        var radius: Double
        /**
         * Start angle
         */
        var startAngle: Double
        /**
         * End angle
         */
        var endAngle: Double
        /**
         * Color
         */
        var color: ai_cup_22.debugging.Color
    
        constructor(position: ai_cup_22.model.Vec2, radius: Double, startAngle: Double, endAngle: Double, color: ai_cup_22.debugging.Color) {
            this.position = position
            this.radius = radius
            this.startAngle = startAngle
            this.endAngle = endAngle
            this.color = color
        }
    
        /**
         * Write Pie to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            position.writeTo(stream)
            StreamUtil.writeDouble(stream, radius)
            StreamUtil.writeDouble(stream, startAngle)
            StreamUtil.writeDouble(stream, endAngle)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Pie
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Pie { ")
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
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 4
    
            /**
             * Read Pie from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Pie {
                var position: ai_cup_22.model.Vec2
                position = ai_cup_22.model.Vec2.readFrom(stream)
                var radius: Double
                radius = StreamUtil.readDouble(stream)
                var startAngle: Double
                startAngle = StreamUtil.readDouble(stream)
                var endAngle: Double
                endAngle = StreamUtil.readDouble(stream)
                var color: ai_cup_22.debugging.Color
                color = ai_cup_22.debugging.Color.readFrom(stream)
                return Pie(position, radius, startAngle, endAngle, color)
            }
        }
    }

    /**
     * Arc
     */
    class Arc : DebugData {
        /**
         * Position of the center
         */
        var position: ai_cup_22.model.Vec2
        /**
         * Radius
         */
        var radius: Double
        /**
         * Width
         */
        var width: Double
        /**
         * Start angle
         */
        var startAngle: Double
        /**
         * End angle
         */
        var endAngle: Double
        /**
         * Color
         */
        var color: ai_cup_22.debugging.Color
    
        constructor(position: ai_cup_22.model.Vec2, radius: Double, width: Double, startAngle: Double, endAngle: Double, color: ai_cup_22.debugging.Color) {
            this.position = position
            this.radius = radius
            this.width = width
            this.startAngle = startAngle
            this.endAngle = endAngle
            this.color = color
        }
    
        /**
         * Write Arc to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
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
        override fun toString(): String {
            var stringBuilder = StringBuilder("Arc { ")
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
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 5
    
            /**
             * Read Arc from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Arc {
                var position: ai_cup_22.model.Vec2
                position = ai_cup_22.model.Vec2.readFrom(stream)
                var radius: Double
                radius = StreamUtil.readDouble(stream)
                var width: Double
                width = StreamUtil.readDouble(stream)
                var startAngle: Double
                startAngle = StreamUtil.readDouble(stream)
                var endAngle: Double
                endAngle = StreamUtil.readDouble(stream)
                var color: ai_cup_22.debugging.Color
                color = ai_cup_22.debugging.Color.readFrom(stream)
                return Arc(position, radius, width, startAngle, endAngle, color)
            }
        }
    }

    /**
     * Rectancle
     */
    class Rect : DebugData {
        /**
         * Bottom left position
         */
        var bottomLeft: ai_cup_22.model.Vec2
        /**
         * Size
         */
        var size: ai_cup_22.model.Vec2
        /**
         * Color
         */
        var color: ai_cup_22.debugging.Color
    
        constructor(bottomLeft: ai_cup_22.model.Vec2, size: ai_cup_22.model.Vec2, color: ai_cup_22.debugging.Color) {
            this.bottomLeft = bottomLeft
            this.size = size
            this.color = color
        }
    
        /**
         * Write Rect to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            bottomLeft.writeTo(stream)
            size.writeTo(stream)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Rect
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Rect { ")
            stringBuilder.append("bottomLeft: ")
            stringBuilder.append(bottomLeft)
            stringBuilder.append(", ")
            stringBuilder.append("size: ")
            stringBuilder.append(size)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 6
    
            /**
             * Read Rect from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Rect {
                var bottomLeft: ai_cup_22.model.Vec2
                bottomLeft = ai_cup_22.model.Vec2.readFrom(stream)
                var size: ai_cup_22.model.Vec2
                size = ai_cup_22.model.Vec2.readFrom(stream)
                var color: ai_cup_22.debugging.Color
                color = ai_cup_22.debugging.Color.readFrom(stream)
                return Rect(bottomLeft, size, color)
            }
        }
    }

    /**
     * Polygon (convex)
     */
    class Polygon : DebugData {
        /**
         * Positions of vertices in order
         */
        var vertices: Array<ai_cup_22.model.Vec2>
        /**
         * Color
         */
        var color: ai_cup_22.debugging.Color
    
        constructor(vertices: Array<ai_cup_22.model.Vec2>, color: ai_cup_22.debugging.Color) {
            this.vertices = vertices
            this.color = color
        }
    
        /**
         * Write Polygon to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeInt(stream, vertices.size)
            for (verticesElement in vertices) {
                verticesElement.writeTo(stream)
            }
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Polygon
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Polygon { ")
            stringBuilder.append("vertices: ")
            stringBuilder.append("[ ")
            var verticesIndex = 0
            for (verticesElement in vertices) {
                if (verticesIndex != 0) {
                    stringBuilder.append(", ")
                }
                stringBuilder.append(verticesElement)
                verticesIndex++
            }
            stringBuilder.append(" ]")
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 7
    
            /**
             * Read Polygon from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Polygon {
                var vertices: Array<ai_cup_22.model.Vec2>
                vertices = Array(StreamUtil.readInt(stream), {
                    var verticesElement: ai_cup_22.model.Vec2
                    verticesElement = ai_cup_22.model.Vec2.readFrom(stream)
                    verticesElement
                })
                var color: ai_cup_22.debugging.Color
                color = ai_cup_22.debugging.Color.readFrom(stream)
                return Polygon(vertices, color)
            }
        }
    }

    /**
     * Polygon with gradient fill
     */
    class GradientPolygon : DebugData {
        /**
         * List of vertices in order
         */
        var vertices: Array<ai_cup_22.debugging.ColoredVertex>
    
        constructor(vertices: Array<ai_cup_22.debugging.ColoredVertex>) {
            this.vertices = vertices
        }
    
        /**
         * Write GradientPolygon to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeInt(stream, vertices.size)
            for (verticesElement in vertices) {
                verticesElement.writeTo(stream)
            }
        }
    
        /**
         * Get string representation of GradientPolygon
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("GradientPolygon { ")
            stringBuilder.append("vertices: ")
            stringBuilder.append("[ ")
            var verticesIndex = 0
            for (verticesElement in vertices) {
                if (verticesIndex != 0) {
                    stringBuilder.append(", ")
                }
                stringBuilder.append(verticesElement)
                verticesIndex++
            }
            stringBuilder.append(" ]")
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 8
    
            /**
             * Read GradientPolygon from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): GradientPolygon {
                var vertices: Array<ai_cup_22.debugging.ColoredVertex>
                vertices = Array(StreamUtil.readInt(stream), {
                    var verticesElement: ai_cup_22.debugging.ColoredVertex
                    verticesElement = ai_cup_22.debugging.ColoredVertex.readFrom(stream)
                    verticesElement
                })
                return GradientPolygon(vertices)
            }
        }
    }

    /**
     * Segment
     */
    class Segment : DebugData {
        /**
         * Position of the first end
         */
        var firstEnd: ai_cup_22.model.Vec2
        /**
         * Position of the second end
         */
        var secondEnd: ai_cup_22.model.Vec2
        /**
         * Width
         */
        var width: Double
        /**
         * Color
         */
        var color: ai_cup_22.debugging.Color
    
        constructor(firstEnd: ai_cup_22.model.Vec2, secondEnd: ai_cup_22.model.Vec2, width: Double, color: ai_cup_22.debugging.Color) {
            this.firstEnd = firstEnd
            this.secondEnd = secondEnd
            this.width = width
            this.color = color
        }
    
        /**
         * Write Segment to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            firstEnd.writeTo(stream)
            secondEnd.writeTo(stream)
            StreamUtil.writeDouble(stream, width)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of Segment
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("Segment { ")
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
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 9
    
            /**
             * Read Segment from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): Segment {
                var firstEnd: ai_cup_22.model.Vec2
                firstEnd = ai_cup_22.model.Vec2.readFrom(stream)
                var secondEnd: ai_cup_22.model.Vec2
                secondEnd = ai_cup_22.model.Vec2.readFrom(stream)
                var width: Double
                width = StreamUtil.readDouble(stream)
                var color: ai_cup_22.debugging.Color
                color = ai_cup_22.debugging.Color.readFrom(stream)
                return Segment(firstEnd, secondEnd, width, color)
            }
        }
    }

    /**
     * Segment with gradient fill
     */
    class GradientSegment : DebugData {
        /**
         * Position of the first end
         */
        var firstEnd: ai_cup_22.model.Vec2
        /**
         * Color of the first end
         */
        var firstColor: ai_cup_22.debugging.Color
        /**
         * Position of the second end
         */
        var secondEnd: ai_cup_22.model.Vec2
        /**
         * Color of the second end
         */
        var secondColor: ai_cup_22.debugging.Color
        /**
         * Width
         */
        var width: Double
    
        constructor(firstEnd: ai_cup_22.model.Vec2, firstColor: ai_cup_22.debugging.Color, secondEnd: ai_cup_22.model.Vec2, secondColor: ai_cup_22.debugging.Color, width: Double) {
            this.firstEnd = firstEnd
            this.firstColor = firstColor
            this.secondEnd = secondEnd
            this.secondColor = secondColor
            this.width = width
        }
    
        /**
         * Write GradientSegment to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            firstEnd.writeTo(stream)
            firstColor.writeTo(stream)
            secondEnd.writeTo(stream)
            secondColor.writeTo(stream)
            StreamUtil.writeDouble(stream, width)
        }
    
        /**
         * Get string representation of GradientSegment
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("GradientSegment { ")
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
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 10
    
            /**
             * Read GradientSegment from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): GradientSegment {
                var firstEnd: ai_cup_22.model.Vec2
                firstEnd = ai_cup_22.model.Vec2.readFrom(stream)
                var firstColor: ai_cup_22.debugging.Color
                firstColor = ai_cup_22.debugging.Color.readFrom(stream)
                var secondEnd: ai_cup_22.model.Vec2
                secondEnd = ai_cup_22.model.Vec2.readFrom(stream)
                var secondColor: ai_cup_22.debugging.Color
                secondColor = ai_cup_22.debugging.Color.readFrom(stream)
                var width: Double
                width = StreamUtil.readDouble(stream)
                return GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width)
            }
        }
    }

    /**
     * Poly line
     */
    class PolyLine : DebugData {
        /**
         * List of points in order
         */
        var vertices: Array<ai_cup_22.model.Vec2>
        /**
         * Width
         */
        var width: Double
        /**
         * Color
         */
        var color: ai_cup_22.debugging.Color
    
        constructor(vertices: Array<ai_cup_22.model.Vec2>, width: Double, color: ai_cup_22.debugging.Color) {
            this.vertices = vertices
            this.width = width
            this.color = color
        }
    
        /**
         * Write PolyLine to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeInt(stream, vertices.size)
            for (verticesElement in vertices) {
                verticesElement.writeTo(stream)
            }
            StreamUtil.writeDouble(stream, width)
            color.writeTo(stream)
        }
    
        /**
         * Get string representation of PolyLine
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("PolyLine { ")
            stringBuilder.append("vertices: ")
            stringBuilder.append("[ ")
            var verticesIndex = 0
            for (verticesElement in vertices) {
                if (verticesIndex != 0) {
                    stringBuilder.append(", ")
                }
                stringBuilder.append(verticesElement)
                verticesIndex++
            }
            stringBuilder.append(" ]")
            stringBuilder.append(", ")
            stringBuilder.append("width: ")
            stringBuilder.append(width)
            stringBuilder.append(", ")
            stringBuilder.append("color: ")
            stringBuilder.append(color)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 11
    
            /**
             * Read PolyLine from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): PolyLine {
                var vertices: Array<ai_cup_22.model.Vec2>
                vertices = Array(StreamUtil.readInt(stream), {
                    var verticesElement: ai_cup_22.model.Vec2
                    verticesElement = ai_cup_22.model.Vec2.readFrom(stream)
                    verticesElement
                })
                var width: Double
                width = StreamUtil.readDouble(stream)
                var color: ai_cup_22.debugging.Color
                color = ai_cup_22.debugging.Color.readFrom(stream)
                return PolyLine(vertices, width, color)
            }
        }
    }

    /**
     * Poly line with gradient fill
     */
    class GradientPolyLine : DebugData {
        /**
         * List of points and colors in order
         */
        var vertices: Array<ai_cup_22.debugging.ColoredVertex>
        /**
         * Width
         */
        var width: Double
    
        constructor(vertices: Array<ai_cup_22.debugging.ColoredVertex>, width: Double) {
            this.vertices = vertices
            this.width = width
        }
    
        /**
         * Write GradientPolyLine to output stream
         */
        @Throws(java.io.IOException::class)
        override fun writeTo(stream: java.io.OutputStream) {
            StreamUtil.writeInt(stream, TAG)
            StreamUtil.writeInt(stream, vertices.size)
            for (verticesElement in vertices) {
                verticesElement.writeTo(stream)
            }
            StreamUtil.writeDouble(stream, width)
        }
    
        /**
         * Get string representation of GradientPolyLine
         */
        override fun toString(): String {
            var stringBuilder = StringBuilder("GradientPolyLine { ")
            stringBuilder.append("vertices: ")
            stringBuilder.append("[ ")
            var verticesIndex = 0
            for (verticesElement in vertices) {
                if (verticesIndex != 0) {
                    stringBuilder.append(", ")
                }
                stringBuilder.append(verticesElement)
                verticesIndex++
            }
            stringBuilder.append(" ]")
            stringBuilder.append(", ")
            stringBuilder.append("width: ")
            stringBuilder.append(width)
            stringBuilder.append(" }")
            return stringBuilder.toString()
        }
    
        companion object {
            val TAG = 12
    
            /**
             * Read GradientPolyLine from input stream
             */
            @Throws(java.io.IOException::class)
            fun readFrom(stream: java.io.InputStream): GradientPolyLine {
                var vertices: Array<ai_cup_22.debugging.ColoredVertex>
                vertices = Array(StreamUtil.readInt(stream), {
                    var verticesElement: ai_cup_22.debugging.ColoredVertex
                    verticesElement = ai_cup_22.debugging.ColoredVertex.readFrom(stream)
                    verticesElement
                })
                var width: Double
                width = StreamUtil.readDouble(stream)
                return GradientPolyLine(vertices, width)
            }
        }
    }
}