from model.vec2 import Vec2
from stream_wrapper import StreamWrapper

class Zone:
    """Current state of the game zone"""

    __slots__ = ("current_center","current_radius","next_center","next_radius",)

    current_center: Vec2
    current_radius: float
    next_center: Vec2
    next_radius: float

    def __init__(self, current_center: Vec2, current_radius: float, next_center: Vec2, next_radius: float):
        self.current_center = current_center
        """Current center"""
        self.current_radius = current_radius
        """Current radius"""
        self.next_center = next_center
        """Next center"""
        self.next_radius = next_radius
        """Next radius"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Zone":
        """Read Zone from input stream
        """
        current_center = Vec2.read_from(stream)
        current_radius = stream.read_double()
        next_center = Vec2.read_from(stream)
        next_radius = stream.read_double()
        return Zone(current_center, current_radius, next_center, next_radius)
    
    def write_to(self, stream: StreamWrapper):
        """Write Zone to output stream
        """
        self.current_center.write_to(stream)
        stream.write_double(self.current_radius)
        self.next_center.write_to(stream)
        stream.write_double(self.next_radius)
    
    def __repr__(self):
        return "Zone(" + \
            repr(self.current_center) + \
            ", " + \
            repr(self.current_radius) + \
            ", " + \
            repr(self.next_center) + \
            ", " + \
            repr(self.next_radius) + \
            ")"