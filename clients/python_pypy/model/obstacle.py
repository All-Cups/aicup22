from model.vec2 import Vec2
from stream_wrapper import StreamWrapper

class Obstacle:
    """An obstacle on the map"""

    __slots__ = ("id","position","radius","can_see_through","can_shoot_through",)

    id: int
    position: Vec2
    radius: float
    can_see_through: bool
    can_shoot_through: bool

    def __init__(self, id: int, position: Vec2, radius: float, can_see_through: bool, can_shoot_through: bool):
        self.id = id
        """Unique id"""
        self.position = position
        """Center position"""
        self.radius = radius
        """Obstacle's radius"""
        self.can_see_through = can_see_through
        """Whether units can see through this obstacle, or it blocks the view"""
        self.can_shoot_through = can_shoot_through
        """Whether projectiles can go through this obstacle"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Obstacle":
        """Read Obstacle from input stream
        """
        id = stream.read_int()
        position = Vec2.read_from(stream)
        radius = stream.read_double()
        can_see_through = stream.read_bool()
        can_shoot_through = stream.read_bool()
        return Obstacle(id, position, radius, can_see_through, can_shoot_through)
    
    def write_to(self, stream: StreamWrapper):
        """Write Obstacle to output stream
        """
        stream.write_int(self.id)
        self.position.write_to(stream)
        stream.write_double(self.radius)
        stream.write_bool(self.can_see_through)
        stream.write_bool(self.can_shoot_through)
    
    def __repr__(self):
        return "Obstacle(" + \
            repr(self.id) + \
            ", " + \
            repr(self.position) + \
            ", " + \
            repr(self.radius) + \
            ", " + \
            repr(self.can_see_through) + \
            ", " + \
            repr(self.can_shoot_through) + \
            ")"