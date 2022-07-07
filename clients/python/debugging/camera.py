from model.vec2 import Vec2
from stream_wrapper import StreamWrapper

class Camera:
    """Camera state"""

    __slots__ = ("center","rotation","attack","fov",)

    center: Vec2
    rotation: float
    attack: float
    fov: float

    def __init__(self, center: Vec2, rotation: float, attack: float, fov: float):
        self.center = center
        """Center"""
        self.rotation = rotation
        """Rotation"""
        self.attack = attack
        """Attack angle"""
        self.fov = fov
        """Vertical field of view"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Camera":
        """Read Camera from input stream
        """
        center = Vec2.read_from(stream)
        rotation = stream.read_double()
        attack = stream.read_double()
        fov = stream.read_double()
        return Camera(center, rotation, attack, fov)
    
    def write_to(self, stream: StreamWrapper):
        """Write Camera to output stream
        """
        self.center.write_to(stream)
        stream.write_double(self.rotation)
        stream.write_double(self.attack)
        stream.write_double(self.fov)
    
    def __repr__(self):
        return "Camera(" + \
            repr(self.center) + \
            ", " + \
            repr(self.rotation) + \
            ", " + \
            repr(self.attack) + \
            ", " + \
            repr(self.fov) + \
            ")"