from model.vec2 import Vec2
from stream_wrapper import StreamWrapper

class Sound:
    """Sound heard by one of your units"""

    __slots__ = ("type_index","unit_id","position",)

    type_index: int
    unit_id: int
    position: Vec2

    def __init__(self, type_index: int, unit_id: int, position: Vec2):
        self.type_index = type_index
        """Sound type index (starting with 0)"""
        self.unit_id = unit_id
        """Id of unit that heard this sound"""
        self.position = position
        """Position where sound was heard (different from sound source position)"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Sound":
        """Read Sound from input stream
        """
        type_index = stream.read_int()
        unit_id = stream.read_int()
        position = Vec2.read_from(stream)
        return Sound(type_index, unit_id, position)
    
    def write_to(self, stream: StreamWrapper):
        """Write Sound to output stream
        """
        stream.write_int(self.type_index)
        stream.write_int(self.unit_id)
        self.position.write_to(stream)
    
    def __repr__(self):
        return "Sound(" + \
            repr(self.type_index) + \
            ", " + \
            repr(self.unit_id) + \
            ", " + \
            repr(self.position) + \
            ")"