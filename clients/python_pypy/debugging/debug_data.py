from debugging.color import Color
from debugging.colored_vertex import ColoredVertex
from model.vec2 import Vec2
from stream_wrapper import StreamWrapper
from typing import List

class DebugData:
    """Data for debug rendering"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "DebugData":
        """Read DebugData from input stream
        """
        tag = stream.read_int()
        if tag == PlacedText.TAG:
            return DebugData.PlacedText.read_from(stream)
        if tag == Circle.TAG:
            return DebugData.Circle.read_from(stream)
        if tag == GradientCircle.TAG:
            return DebugData.GradientCircle.read_from(stream)
        if tag == Ring.TAG:
            return DebugData.Ring.read_from(stream)
        if tag == Pie.TAG:
            return DebugData.Pie.read_from(stream)
        if tag == Arc.TAG:
            return DebugData.Arc.read_from(stream)
        if tag == Rect.TAG:
            return DebugData.Rect.read_from(stream)
        if tag == Polygon.TAG:
            return DebugData.Polygon.read_from(stream)
        if tag == GradientPolygon.TAG:
            return DebugData.GradientPolygon.read_from(stream)
        if tag == Segment.TAG:
            return DebugData.Segment.read_from(stream)
        if tag == GradientSegment.TAG:
            return DebugData.GradientSegment.read_from(stream)
        if tag == PolyLine.TAG:
            return DebugData.PolyLine.read_from(stream)
        if tag == GradientPolyLine.TAG:
            return DebugData.GradientPolyLine.read_from(stream)
        raise Exception("Unexpected tag value")

class PlacedText(DebugData):
    """Text"""

    TAG = 0

    __slots__ = ("position","text","alignment","size","color",)

    position: Vec2
    text: str
    alignment: Vec2
    size: float
    color: Color

    def __init__(self, position: Vec2, text: str, alignment: Vec2, size: float, color: Color):
        self.position = position
        """Position"""
        self.text = text
        """Text"""
        self.alignment = alignment
        """Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment"""
        self.size = size
        """Size"""
        self.color = color
        """Color"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "PlacedText":
        """Read PlacedText from input stream
        """
        position = Vec2.read_from(stream)
        text = stream.read_string()
        alignment = Vec2.read_from(stream)
        size = stream.read_double()
        color = Color.read_from(stream)
        return PlacedText(position, text, alignment, size, color)
    
    def write_to(self, stream: StreamWrapper):
        """Write PlacedText to output stream
        """
        stream.write_int(self.TAG)
        self.position.write_to(stream)
        stream.write_string(self.text)
        self.alignment.write_to(stream)
        stream.write_double(self.size)
        self.color.write_to(stream)
    
    def __repr__(self):
        return "PlacedText(" + \
            repr(self.position) + \
            ", " + \
            repr(self.text) + \
            ", " + \
            repr(self.alignment) + \
            ", " + \
            repr(self.size) + \
            ", " + \
            repr(self.color) + \
            ")"

DebugData.PlacedText = PlacedText

class Circle(DebugData):
    """Circle"""

    TAG = 1

    __slots__ = ("position","radius","color",)

    position: Vec2
    radius: float
    color: Color

    def __init__(self, position: Vec2, radius: float, color: Color):
        self.position = position
        """Position of the center"""
        self.radius = radius
        """Radius"""
        self.color = color
        """Color"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Circle":
        """Read Circle from input stream
        """
        position = Vec2.read_from(stream)
        radius = stream.read_double()
        color = Color.read_from(stream)
        return Circle(position, radius, color)
    
    def write_to(self, stream: StreamWrapper):
        """Write Circle to output stream
        """
        stream.write_int(self.TAG)
        self.position.write_to(stream)
        stream.write_double(self.radius)
        self.color.write_to(stream)
    
    def __repr__(self):
        return "Circle(" + \
            repr(self.position) + \
            ", " + \
            repr(self.radius) + \
            ", " + \
            repr(self.color) + \
            ")"

DebugData.Circle = Circle

class GradientCircle(DebugData):
    """Circle with gradient fill"""

    TAG = 2

    __slots__ = ("position","radius","inner_color","outer_color",)

    position: Vec2
    radius: float
    inner_color: Color
    outer_color: Color

    def __init__(self, position: Vec2, radius: float, inner_color: Color, outer_color: Color):
        self.position = position
        """Position of the center"""
        self.radius = radius
        """Radius"""
        self.inner_color = inner_color
        """Color of the center"""
        self.outer_color = outer_color
        """Color of the edge"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "GradientCircle":
        """Read GradientCircle from input stream
        """
        position = Vec2.read_from(stream)
        radius = stream.read_double()
        inner_color = Color.read_from(stream)
        outer_color = Color.read_from(stream)
        return GradientCircle(position, radius, inner_color, outer_color)
    
    def write_to(self, stream: StreamWrapper):
        """Write GradientCircle to output stream
        """
        stream.write_int(self.TAG)
        self.position.write_to(stream)
        stream.write_double(self.radius)
        self.inner_color.write_to(stream)
        self.outer_color.write_to(stream)
    
    def __repr__(self):
        return "GradientCircle(" + \
            repr(self.position) + \
            ", " + \
            repr(self.radius) + \
            ", " + \
            repr(self.inner_color) + \
            ", " + \
            repr(self.outer_color) + \
            ")"

DebugData.GradientCircle = GradientCircle

class Ring(DebugData):
    """Ring"""

    TAG = 3

    __slots__ = ("position","radius","width","color",)

    position: Vec2
    radius: float
    width: float
    color: Color

    def __init__(self, position: Vec2, radius: float, width: float, color: Color):
        self.position = position
        """Position of the center"""
        self.radius = radius
        """Radius"""
        self.width = width
        """Width"""
        self.color = color
        """Color"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Ring":
        """Read Ring from input stream
        """
        position = Vec2.read_from(stream)
        radius = stream.read_double()
        width = stream.read_double()
        color = Color.read_from(stream)
        return Ring(position, radius, width, color)
    
    def write_to(self, stream: StreamWrapper):
        """Write Ring to output stream
        """
        stream.write_int(self.TAG)
        self.position.write_to(stream)
        stream.write_double(self.radius)
        stream.write_double(self.width)
        self.color.write_to(stream)
    
    def __repr__(self):
        return "Ring(" + \
            repr(self.position) + \
            ", " + \
            repr(self.radius) + \
            ", " + \
            repr(self.width) + \
            ", " + \
            repr(self.color) + \
            ")"

DebugData.Ring = Ring

class Pie(DebugData):
    """Sector of a circle"""

    TAG = 4

    __slots__ = ("position","radius","start_angle","end_angle","color",)

    position: Vec2
    radius: float
    start_angle: float
    end_angle: float
    color: Color

    def __init__(self, position: Vec2, radius: float, start_angle: float, end_angle: float, color: Color):
        self.position = position
        """Position of the center"""
        self.radius = radius
        """Radius"""
        self.start_angle = start_angle
        """Start angle"""
        self.end_angle = end_angle
        """End angle"""
        self.color = color
        """Color"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Pie":
        """Read Pie from input stream
        """
        position = Vec2.read_from(stream)
        radius = stream.read_double()
        start_angle = stream.read_double()
        end_angle = stream.read_double()
        color = Color.read_from(stream)
        return Pie(position, radius, start_angle, end_angle, color)
    
    def write_to(self, stream: StreamWrapper):
        """Write Pie to output stream
        """
        stream.write_int(self.TAG)
        self.position.write_to(stream)
        stream.write_double(self.radius)
        stream.write_double(self.start_angle)
        stream.write_double(self.end_angle)
        self.color.write_to(stream)
    
    def __repr__(self):
        return "Pie(" + \
            repr(self.position) + \
            ", " + \
            repr(self.radius) + \
            ", " + \
            repr(self.start_angle) + \
            ", " + \
            repr(self.end_angle) + \
            ", " + \
            repr(self.color) + \
            ")"

DebugData.Pie = Pie

class Arc(DebugData):
    """Arc"""

    TAG = 5

    __slots__ = ("position","radius","width","start_angle","end_angle","color",)

    position: Vec2
    radius: float
    width: float
    start_angle: float
    end_angle: float
    color: Color

    def __init__(self, position: Vec2, radius: float, width: float, start_angle: float, end_angle: float, color: Color):
        self.position = position
        """Position of the center"""
        self.radius = radius
        """Radius"""
        self.width = width
        """Width"""
        self.start_angle = start_angle
        """Start angle"""
        self.end_angle = end_angle
        """End angle"""
        self.color = color
        """Color"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Arc":
        """Read Arc from input stream
        """
        position = Vec2.read_from(stream)
        radius = stream.read_double()
        width = stream.read_double()
        start_angle = stream.read_double()
        end_angle = stream.read_double()
        color = Color.read_from(stream)
        return Arc(position, radius, width, start_angle, end_angle, color)
    
    def write_to(self, stream: StreamWrapper):
        """Write Arc to output stream
        """
        stream.write_int(self.TAG)
        self.position.write_to(stream)
        stream.write_double(self.radius)
        stream.write_double(self.width)
        stream.write_double(self.start_angle)
        stream.write_double(self.end_angle)
        self.color.write_to(stream)
    
    def __repr__(self):
        return "Arc(" + \
            repr(self.position) + \
            ", " + \
            repr(self.radius) + \
            ", " + \
            repr(self.width) + \
            ", " + \
            repr(self.start_angle) + \
            ", " + \
            repr(self.end_angle) + \
            ", " + \
            repr(self.color) + \
            ")"

DebugData.Arc = Arc

class Rect(DebugData):
    """Rectancle"""

    TAG = 6

    __slots__ = ("bottom_left","size","color",)

    bottom_left: Vec2
    size: Vec2
    color: Color

    def __init__(self, bottom_left: Vec2, size: Vec2, color: Color):
        self.bottom_left = bottom_left
        """Bottom left position"""
        self.size = size
        """Size"""
        self.color = color
        """Color"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Rect":
        """Read Rect from input stream
        """
        bottom_left = Vec2.read_from(stream)
        size = Vec2.read_from(stream)
        color = Color.read_from(stream)
        return Rect(bottom_left, size, color)
    
    def write_to(self, stream: StreamWrapper):
        """Write Rect to output stream
        """
        stream.write_int(self.TAG)
        self.bottom_left.write_to(stream)
        self.size.write_to(stream)
        self.color.write_to(stream)
    
    def __repr__(self):
        return "Rect(" + \
            repr(self.bottom_left) + \
            ", " + \
            repr(self.size) + \
            ", " + \
            repr(self.color) + \
            ")"

DebugData.Rect = Rect

class Polygon(DebugData):
    """Polygon (convex)"""

    TAG = 7

    __slots__ = ("vertices","color",)

    vertices: List[Vec2]
    color: Color

    def __init__(self, vertices: List[Vec2], color: Color):
        self.vertices = vertices
        """Positions of vertices in order"""
        self.color = color
        """Color"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Polygon":
        """Read Polygon from input stream
        """
        vertices = []
        for _ in range(stream.read_int()):
            vertices_element = Vec2.read_from(stream)
            vertices.append(vertices_element)
        color = Color.read_from(stream)
        return Polygon(vertices, color)
    
    def write_to(self, stream: StreamWrapper):
        """Write Polygon to output stream
        """
        stream.write_int(self.TAG)
        stream.write_int(len(self.vertices))
        for element in self.vertices:
            element.write_to(stream)
        self.color.write_to(stream)
    
    def __repr__(self):
        return "Polygon(" + \
            repr(self.vertices) + \
            ", " + \
            repr(self.color) + \
            ")"

DebugData.Polygon = Polygon

class GradientPolygon(DebugData):
    """Polygon with gradient fill"""

    TAG = 8

    __slots__ = ("vertices",)

    vertices: List[ColoredVertex]

    def __init__(self, vertices: List[ColoredVertex]):
        self.vertices = vertices
        """List of vertices in order"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "GradientPolygon":
        """Read GradientPolygon from input stream
        """
        vertices = []
        for _ in range(stream.read_int()):
            vertices_element = ColoredVertex.read_from(stream)
            vertices.append(vertices_element)
        return GradientPolygon(vertices)
    
    def write_to(self, stream: StreamWrapper):
        """Write GradientPolygon to output stream
        """
        stream.write_int(self.TAG)
        stream.write_int(len(self.vertices))
        for element in self.vertices:
            element.write_to(stream)
    
    def __repr__(self):
        return "GradientPolygon(" + \
            repr(self.vertices) + \
            ")"

DebugData.GradientPolygon = GradientPolygon

class Segment(DebugData):
    """Segment"""

    TAG = 9

    __slots__ = ("first_end","second_end","width","color",)

    first_end: Vec2
    second_end: Vec2
    width: float
    color: Color

    def __init__(self, first_end: Vec2, second_end: Vec2, width: float, color: Color):
        self.first_end = first_end
        """Position of the first end"""
        self.second_end = second_end
        """Position of the second end"""
        self.width = width
        """Width"""
        self.color = color
        """Color"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Segment":
        """Read Segment from input stream
        """
        first_end = Vec2.read_from(stream)
        second_end = Vec2.read_from(stream)
        width = stream.read_double()
        color = Color.read_from(stream)
        return Segment(first_end, second_end, width, color)
    
    def write_to(self, stream: StreamWrapper):
        """Write Segment to output stream
        """
        stream.write_int(self.TAG)
        self.first_end.write_to(stream)
        self.second_end.write_to(stream)
        stream.write_double(self.width)
        self.color.write_to(stream)
    
    def __repr__(self):
        return "Segment(" + \
            repr(self.first_end) + \
            ", " + \
            repr(self.second_end) + \
            ", " + \
            repr(self.width) + \
            ", " + \
            repr(self.color) + \
            ")"

DebugData.Segment = Segment

class GradientSegment(DebugData):
    """Segment with gradient fill"""

    TAG = 10

    __slots__ = ("first_end","first_color","second_end","second_color","width",)

    first_end: Vec2
    first_color: Color
    second_end: Vec2
    second_color: Color
    width: float

    def __init__(self, first_end: Vec2, first_color: Color, second_end: Vec2, second_color: Color, width: float):
        self.first_end = first_end
        """Position of the first end"""
        self.first_color = first_color
        """Color of the first end"""
        self.second_end = second_end
        """Position of the second end"""
        self.second_color = second_color
        """Color of the second end"""
        self.width = width
        """Width"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "GradientSegment":
        """Read GradientSegment from input stream
        """
        first_end = Vec2.read_from(stream)
        first_color = Color.read_from(stream)
        second_end = Vec2.read_from(stream)
        second_color = Color.read_from(stream)
        width = stream.read_double()
        return GradientSegment(first_end, first_color, second_end, second_color, width)
    
    def write_to(self, stream: StreamWrapper):
        """Write GradientSegment to output stream
        """
        stream.write_int(self.TAG)
        self.first_end.write_to(stream)
        self.first_color.write_to(stream)
        self.second_end.write_to(stream)
        self.second_color.write_to(stream)
        stream.write_double(self.width)
    
    def __repr__(self):
        return "GradientSegment(" + \
            repr(self.first_end) + \
            ", " + \
            repr(self.first_color) + \
            ", " + \
            repr(self.second_end) + \
            ", " + \
            repr(self.second_color) + \
            ", " + \
            repr(self.width) + \
            ")"

DebugData.GradientSegment = GradientSegment

class PolyLine(DebugData):
    """Poly line"""

    TAG = 11

    __slots__ = ("vertices","width","color",)

    vertices: List[Vec2]
    width: float
    color: Color

    def __init__(self, vertices: List[Vec2], width: float, color: Color):
        self.vertices = vertices
        """List of points in order"""
        self.width = width
        """Width"""
        self.color = color
        """Color"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "PolyLine":
        """Read PolyLine from input stream
        """
        vertices = []
        for _ in range(stream.read_int()):
            vertices_element = Vec2.read_from(stream)
            vertices.append(vertices_element)
        width = stream.read_double()
        color = Color.read_from(stream)
        return PolyLine(vertices, width, color)
    
    def write_to(self, stream: StreamWrapper):
        """Write PolyLine to output stream
        """
        stream.write_int(self.TAG)
        stream.write_int(len(self.vertices))
        for element in self.vertices:
            element.write_to(stream)
        stream.write_double(self.width)
        self.color.write_to(stream)
    
    def __repr__(self):
        return "PolyLine(" + \
            repr(self.vertices) + \
            ", " + \
            repr(self.width) + \
            ", " + \
            repr(self.color) + \
            ")"

DebugData.PolyLine = PolyLine

class GradientPolyLine(DebugData):
    """Poly line with gradient fill"""

    TAG = 12

    __slots__ = ("vertices","width",)

    vertices: List[ColoredVertex]
    width: float

    def __init__(self, vertices: List[ColoredVertex], width: float):
        self.vertices = vertices
        """List of points and colors in order"""
        self.width = width
        """Width"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "GradientPolyLine":
        """Read GradientPolyLine from input stream
        """
        vertices = []
        for _ in range(stream.read_int()):
            vertices_element = ColoredVertex.read_from(stream)
            vertices.append(vertices_element)
        width = stream.read_double()
        return GradientPolyLine(vertices, width)
    
    def write_to(self, stream: StreamWrapper):
        """Write GradientPolyLine to output stream
        """
        stream.write_int(self.TAG)
        stream.write_int(len(self.vertices))
        for element in self.vertices:
            element.write_to(stream)
        stream.write_double(self.width)
    
    def __repr__(self):
        return "GradientPolyLine(" + \
            repr(self.vertices) + \
            ", " + \
            repr(self.width) + \
            ")"

DebugData.GradientPolyLine = GradientPolyLine