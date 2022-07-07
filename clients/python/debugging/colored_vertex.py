from debugging.color import Color
from model.vec2 import Vec2
from stream_wrapper import StreamWrapper

class ColoredVertex:
    """Point + color"""

    __slots__ = ("position","color",)

    position: Vec2
    color: Color

    def __init__(self, position: Vec2, color: Color):
        self.position = position
        """Position"""
        self.color = color
        """Color"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "ColoredVertex":
        """Read ColoredVertex from input stream
        """
        position = Vec2.read_from(stream)
        color = Color.read_from(stream)
        return ColoredVertex(position, color)
    
    def write_to(self, stream: StreamWrapper):
        """Write ColoredVertex to output stream
        """
        self.position.write_to(stream)
        self.color.write_to(stream)
    
    def __repr__(self):
        return "ColoredVertex(" + \
            repr(self.position) + \
            ", " + \
            repr(self.color) + \
            ")"