<?php

namespace Debugging {
    require_once 'Debugging/Color.php';
    require_once 'Debugging/ColoredVertex.php';
    require_once 'Model/Vec2.php';
    require_once 'Stream.php';

    /**
     * Data for debug rendering
     */
    abstract class DebugData
    {
        /**
         * Write DebugData to output stream
         */
        abstract function writeTo(\OutputStream $stream): void;

        /**
         * Read DebugData from input stream
         */
        static function readFrom(\InputStream $stream): DebugData
        {
            $tag = $stream->readInt32();
            if ($tag == \Debugging\DebugData\PlacedText::TAG) {
                return \Debugging\DebugData\PlacedText::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\Circle::TAG) {
                return \Debugging\DebugData\Circle::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\GradientCircle::TAG) {
                return \Debugging\DebugData\GradientCircle::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\Ring::TAG) {
                return \Debugging\DebugData\Ring::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\Pie::TAG) {
                return \Debugging\DebugData\Pie::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\Arc::TAG) {
                return \Debugging\DebugData\Arc::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\Rect::TAG) {
                return \Debugging\DebugData\Rect::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\Polygon::TAG) {
                return \Debugging\DebugData\Polygon::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\GradientPolygon::TAG) {
                return \Debugging\DebugData\GradientPolygon::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\Segment::TAG) {
                return \Debugging\DebugData\Segment::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\GradientSegment::TAG) {
                return \Debugging\DebugData\GradientSegment::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\PolyLine::TAG) {
                return \Debugging\DebugData\PolyLine::readFrom($stream);
            }
            if ($tag == \Debugging\DebugData\GradientPolyLine::TAG) {
                return \Debugging\DebugData\GradientPolyLine::readFrom($stream);
            }
            throw new Exception('Unexpected tag value');
        }
    }
}

namespace Debugging\DebugData {
    /**
     * Text
     */
    class PlacedText extends \Debugging\DebugData
    {
        const TAG = 0;
    
        /**
         * Position
         */
        public \Model\Vec2 $position;
        /**
         * Text
         */
        public string $text;
        /**
         * Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
         */
        public \Model\Vec2 $alignment;
        /**
         * Size
         */
        public float $size;
        /**
         * Color
         */
        public \Debugging\Color $color;
    
        function __construct(\Model\Vec2 $position, string $text, \Model\Vec2 $alignment, float $size, \Debugging\Color $color)
        {
            $this->position = $position;
            $this->text = $text;
            $this->alignment = $alignment;
            $this->size = $size;
            $this->color = $color;
        }
    
        /**
         * Read PlacedText from input stream
         */
        public static function readFrom(\InputStream $stream): PlacedText
        {
            $position = \Model\Vec2::readFrom($stream);
            $text = $stream->readString();
            $alignment = \Model\Vec2::readFrom($stream);
            $size = $stream->readDouble();
            $color = \Debugging\Color::readFrom($stream);
            return new PlacedText($position, $text, $alignment, $size, $color);
        }
        
        /**
         * Write PlacedText to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(PlacedText::TAG);
            $this->position->writeTo($stream);
            $stream->writeString($this->text);
            $this->alignment->writeTo($stream);
            $stream->writeDouble($this->size);
            $this->color->writeTo($stream);
        }
    }

    /**
     * Circle
     */
    class Circle extends \Debugging\DebugData
    {
        const TAG = 1;
    
        /**
         * Position of the center
         */
        public \Model\Vec2 $position;
        /**
         * Radius
         */
        public float $radius;
        /**
         * Color
         */
        public \Debugging\Color $color;
    
        function __construct(\Model\Vec2 $position, float $radius, \Debugging\Color $color)
        {
            $this->position = $position;
            $this->radius = $radius;
            $this->color = $color;
        }
    
        /**
         * Read Circle from input stream
         */
        public static function readFrom(\InputStream $stream): Circle
        {
            $position = \Model\Vec2::readFrom($stream);
            $radius = $stream->readDouble();
            $color = \Debugging\Color::readFrom($stream);
            return new Circle($position, $radius, $color);
        }
        
        /**
         * Write Circle to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Circle::TAG);
            $this->position->writeTo($stream);
            $stream->writeDouble($this->radius);
            $this->color->writeTo($stream);
        }
    }

    /**
     * Circle with gradient fill
     */
    class GradientCircle extends \Debugging\DebugData
    {
        const TAG = 2;
    
        /**
         * Position of the center
         */
        public \Model\Vec2 $position;
        /**
         * Radius
         */
        public float $radius;
        /**
         * Color of the center
         */
        public \Debugging\Color $innerColor;
        /**
         * Color of the edge
         */
        public \Debugging\Color $outerColor;
    
        function __construct(\Model\Vec2 $position, float $radius, \Debugging\Color $innerColor, \Debugging\Color $outerColor)
        {
            $this->position = $position;
            $this->radius = $radius;
            $this->innerColor = $innerColor;
            $this->outerColor = $outerColor;
        }
    
        /**
         * Read GradientCircle from input stream
         */
        public static function readFrom(\InputStream $stream): GradientCircle
        {
            $position = \Model\Vec2::readFrom($stream);
            $radius = $stream->readDouble();
            $innerColor = \Debugging\Color::readFrom($stream);
            $outerColor = \Debugging\Color::readFrom($stream);
            return new GradientCircle($position, $radius, $innerColor, $outerColor);
        }
        
        /**
         * Write GradientCircle to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(GradientCircle::TAG);
            $this->position->writeTo($stream);
            $stream->writeDouble($this->radius);
            $this->innerColor->writeTo($stream);
            $this->outerColor->writeTo($stream);
        }
    }

    /**
     * Ring
     */
    class Ring extends \Debugging\DebugData
    {
        const TAG = 3;
    
        /**
         * Position of the center
         */
        public \Model\Vec2 $position;
        /**
         * Radius
         */
        public float $radius;
        /**
         * Width
         */
        public float $width;
        /**
         * Color
         */
        public \Debugging\Color $color;
    
        function __construct(\Model\Vec2 $position, float $radius, float $width, \Debugging\Color $color)
        {
            $this->position = $position;
            $this->radius = $radius;
            $this->width = $width;
            $this->color = $color;
        }
    
        /**
         * Read Ring from input stream
         */
        public static function readFrom(\InputStream $stream): Ring
        {
            $position = \Model\Vec2::readFrom($stream);
            $radius = $stream->readDouble();
            $width = $stream->readDouble();
            $color = \Debugging\Color::readFrom($stream);
            return new Ring($position, $radius, $width, $color);
        }
        
        /**
         * Write Ring to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Ring::TAG);
            $this->position->writeTo($stream);
            $stream->writeDouble($this->radius);
            $stream->writeDouble($this->width);
            $this->color->writeTo($stream);
        }
    }

    /**
     * Sector of a circle
     */
    class Pie extends \Debugging\DebugData
    {
        const TAG = 4;
    
        /**
         * Position of the center
         */
        public \Model\Vec2 $position;
        /**
         * Radius
         */
        public float $radius;
        /**
         * Start angle
         */
        public float $startAngle;
        /**
         * End angle
         */
        public float $endAngle;
        /**
         * Color
         */
        public \Debugging\Color $color;
    
        function __construct(\Model\Vec2 $position, float $radius, float $startAngle, float $endAngle, \Debugging\Color $color)
        {
            $this->position = $position;
            $this->radius = $radius;
            $this->startAngle = $startAngle;
            $this->endAngle = $endAngle;
            $this->color = $color;
        }
    
        /**
         * Read Pie from input stream
         */
        public static function readFrom(\InputStream $stream): Pie
        {
            $position = \Model\Vec2::readFrom($stream);
            $radius = $stream->readDouble();
            $startAngle = $stream->readDouble();
            $endAngle = $stream->readDouble();
            $color = \Debugging\Color::readFrom($stream);
            return new Pie($position, $radius, $startAngle, $endAngle, $color);
        }
        
        /**
         * Write Pie to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Pie::TAG);
            $this->position->writeTo($stream);
            $stream->writeDouble($this->radius);
            $stream->writeDouble($this->startAngle);
            $stream->writeDouble($this->endAngle);
            $this->color->writeTo($stream);
        }
    }

    /**
     * Arc
     */
    class Arc extends \Debugging\DebugData
    {
        const TAG = 5;
    
        /**
         * Position of the center
         */
        public \Model\Vec2 $position;
        /**
         * Radius
         */
        public float $radius;
        /**
         * Width
         */
        public float $width;
        /**
         * Start angle
         */
        public float $startAngle;
        /**
         * End angle
         */
        public float $endAngle;
        /**
         * Color
         */
        public \Debugging\Color $color;
    
        function __construct(\Model\Vec2 $position, float $radius, float $width, float $startAngle, float $endAngle, \Debugging\Color $color)
        {
            $this->position = $position;
            $this->radius = $radius;
            $this->width = $width;
            $this->startAngle = $startAngle;
            $this->endAngle = $endAngle;
            $this->color = $color;
        }
    
        /**
         * Read Arc from input stream
         */
        public static function readFrom(\InputStream $stream): Arc
        {
            $position = \Model\Vec2::readFrom($stream);
            $radius = $stream->readDouble();
            $width = $stream->readDouble();
            $startAngle = $stream->readDouble();
            $endAngle = $stream->readDouble();
            $color = \Debugging\Color::readFrom($stream);
            return new Arc($position, $radius, $width, $startAngle, $endAngle, $color);
        }
        
        /**
         * Write Arc to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Arc::TAG);
            $this->position->writeTo($stream);
            $stream->writeDouble($this->radius);
            $stream->writeDouble($this->width);
            $stream->writeDouble($this->startAngle);
            $stream->writeDouble($this->endAngle);
            $this->color->writeTo($stream);
        }
    }

    /**
     * Rectancle
     */
    class Rect extends \Debugging\DebugData
    {
        const TAG = 6;
    
        /**
         * Bottom left position
         */
        public \Model\Vec2 $bottomLeft;
        /**
         * Size
         */
        public \Model\Vec2 $size;
        /**
         * Color
         */
        public \Debugging\Color $color;
    
        function __construct(\Model\Vec2 $bottomLeft, \Model\Vec2 $size, \Debugging\Color $color)
        {
            $this->bottomLeft = $bottomLeft;
            $this->size = $size;
            $this->color = $color;
        }
    
        /**
         * Read Rect from input stream
         */
        public static function readFrom(\InputStream $stream): Rect
        {
            $bottomLeft = \Model\Vec2::readFrom($stream);
            $size = \Model\Vec2::readFrom($stream);
            $color = \Debugging\Color::readFrom($stream);
            return new Rect($bottomLeft, $size, $color);
        }
        
        /**
         * Write Rect to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Rect::TAG);
            $this->bottomLeft->writeTo($stream);
            $this->size->writeTo($stream);
            $this->color->writeTo($stream);
        }
    }

    /**
     * Polygon (convex)
     */
    class Polygon extends \Debugging\DebugData
    {
        const TAG = 7;
    
        /**
         * Positions of vertices in order
         */
        public array $vertices;
        /**
         * Color
         */
        public \Debugging\Color $color;
    
        function __construct(array $vertices, \Debugging\Color $color)
        {
            $this->vertices = $vertices;
            $this->color = $color;
        }
    
        /**
         * Read Polygon from input stream
         */
        public static function readFrom(\InputStream $stream): Polygon
        {
            $vertices = [];
            $verticesSize = $stream->readInt32();
            for ($verticesIndex = 0; $verticesIndex < $verticesSize; $verticesIndex++) {
                $verticesElement = \Model\Vec2::readFrom($stream);
                $vertices[] = $verticesElement;
            }
            $color = \Debugging\Color::readFrom($stream);
            return new Polygon($vertices, $color);
        }
        
        /**
         * Write Polygon to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Polygon::TAG);
            $stream->writeInt32(count($this->vertices));
            foreach ($this->vertices as $element) {
                $element->writeTo($stream);
            }
            $this->color->writeTo($stream);
        }
    }

    /**
     * Polygon with gradient fill
     */
    class GradientPolygon extends \Debugging\DebugData
    {
        const TAG = 8;
    
        /**
         * List of vertices in order
         */
        public array $vertices;
    
        function __construct(array $vertices)
        {
            $this->vertices = $vertices;
        }
    
        /**
         * Read GradientPolygon from input stream
         */
        public static function readFrom(\InputStream $stream): GradientPolygon
        {
            $vertices = [];
            $verticesSize = $stream->readInt32();
            for ($verticesIndex = 0; $verticesIndex < $verticesSize; $verticesIndex++) {
                $verticesElement = \Debugging\ColoredVertex::readFrom($stream);
                $vertices[] = $verticesElement;
            }
            return new GradientPolygon($vertices);
        }
        
        /**
         * Write GradientPolygon to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(GradientPolygon::TAG);
            $stream->writeInt32(count($this->vertices));
            foreach ($this->vertices as $element) {
                $element->writeTo($stream);
            }
        }
    }

    /**
     * Segment
     */
    class Segment extends \Debugging\DebugData
    {
        const TAG = 9;
    
        /**
         * Position of the first end
         */
        public \Model\Vec2 $firstEnd;
        /**
         * Position of the second end
         */
        public \Model\Vec2 $secondEnd;
        /**
         * Width
         */
        public float $width;
        /**
         * Color
         */
        public \Debugging\Color $color;
    
        function __construct(\Model\Vec2 $firstEnd, \Model\Vec2 $secondEnd, float $width, \Debugging\Color $color)
        {
            $this->firstEnd = $firstEnd;
            $this->secondEnd = $secondEnd;
            $this->width = $width;
            $this->color = $color;
        }
    
        /**
         * Read Segment from input stream
         */
        public static function readFrom(\InputStream $stream): Segment
        {
            $firstEnd = \Model\Vec2::readFrom($stream);
            $secondEnd = \Model\Vec2::readFrom($stream);
            $width = $stream->readDouble();
            $color = \Debugging\Color::readFrom($stream);
            return new Segment($firstEnd, $secondEnd, $width, $color);
        }
        
        /**
         * Write Segment to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Segment::TAG);
            $this->firstEnd->writeTo($stream);
            $this->secondEnd->writeTo($stream);
            $stream->writeDouble($this->width);
            $this->color->writeTo($stream);
        }
    }

    /**
     * Segment with gradient fill
     */
    class GradientSegment extends \Debugging\DebugData
    {
        const TAG = 10;
    
        /**
         * Position of the first end
         */
        public \Model\Vec2 $firstEnd;
        /**
         * Color of the first end
         */
        public \Debugging\Color $firstColor;
        /**
         * Position of the second end
         */
        public \Model\Vec2 $secondEnd;
        /**
         * Color of the second end
         */
        public \Debugging\Color $secondColor;
        /**
         * Width
         */
        public float $width;
    
        function __construct(\Model\Vec2 $firstEnd, \Debugging\Color $firstColor, \Model\Vec2 $secondEnd, \Debugging\Color $secondColor, float $width)
        {
            $this->firstEnd = $firstEnd;
            $this->firstColor = $firstColor;
            $this->secondEnd = $secondEnd;
            $this->secondColor = $secondColor;
            $this->width = $width;
        }
    
        /**
         * Read GradientSegment from input stream
         */
        public static function readFrom(\InputStream $stream): GradientSegment
        {
            $firstEnd = \Model\Vec2::readFrom($stream);
            $firstColor = \Debugging\Color::readFrom($stream);
            $secondEnd = \Model\Vec2::readFrom($stream);
            $secondColor = \Debugging\Color::readFrom($stream);
            $width = $stream->readDouble();
            return new GradientSegment($firstEnd, $firstColor, $secondEnd, $secondColor, $width);
        }
        
        /**
         * Write GradientSegment to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(GradientSegment::TAG);
            $this->firstEnd->writeTo($stream);
            $this->firstColor->writeTo($stream);
            $this->secondEnd->writeTo($stream);
            $this->secondColor->writeTo($stream);
            $stream->writeDouble($this->width);
        }
    }

    /**
     * Poly line
     */
    class PolyLine extends \Debugging\DebugData
    {
        const TAG = 11;
    
        /**
         * List of points in order
         */
        public array $vertices;
        /**
         * Width
         */
        public float $width;
        /**
         * Color
         */
        public \Debugging\Color $color;
    
        function __construct(array $vertices, float $width, \Debugging\Color $color)
        {
            $this->vertices = $vertices;
            $this->width = $width;
            $this->color = $color;
        }
    
        /**
         * Read PolyLine from input stream
         */
        public static function readFrom(\InputStream $stream): PolyLine
        {
            $vertices = [];
            $verticesSize = $stream->readInt32();
            for ($verticesIndex = 0; $verticesIndex < $verticesSize; $verticesIndex++) {
                $verticesElement = \Model\Vec2::readFrom($stream);
                $vertices[] = $verticesElement;
            }
            $width = $stream->readDouble();
            $color = \Debugging\Color::readFrom($stream);
            return new PolyLine($vertices, $width, $color);
        }
        
        /**
         * Write PolyLine to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(PolyLine::TAG);
            $stream->writeInt32(count($this->vertices));
            foreach ($this->vertices as $element) {
                $element->writeTo($stream);
            }
            $stream->writeDouble($this->width);
            $this->color->writeTo($stream);
        }
    }

    /**
     * Poly line with gradient fill
     */
    class GradientPolyLine extends \Debugging\DebugData
    {
        const TAG = 12;
    
        /**
         * List of points and colors in order
         */
        public array $vertices;
        /**
         * Width
         */
        public float $width;
    
        function __construct(array $vertices, float $width)
        {
            $this->vertices = $vertices;
            $this->width = $width;
        }
    
        /**
         * Read GradientPolyLine from input stream
         */
        public static function readFrom(\InputStream $stream): GradientPolyLine
        {
            $vertices = [];
            $verticesSize = $stream->readInt32();
            for ($verticesIndex = 0; $verticesIndex < $verticesSize; $verticesIndex++) {
                $verticesElement = \Debugging\ColoredVertex::readFrom($stream);
                $vertices[] = $verticesElement;
            }
            $width = $stream->readDouble();
            return new GradientPolyLine($vertices, $width);
        }
        
        /**
         * Write GradientPolyLine to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(GradientPolyLine::TAG);
            $stream->writeInt32(count($this->vertices));
            foreach ($this->vertices as $element) {
                $element->writeTo($stream);
            }
            $stream->writeDouble($this->width);
        }
    }
}