from stream_wrapper import StreamWrapper

class SoundProperties:
    """Sound properties"""

    __slots__ = ("name","distance","offset",)

    name: str
    distance: float
    offset: float

    def __init__(self, name: str, distance: float, offset: float):
        self.name = name
        """Name"""
        self.distance = distance
        """Distance from which the sound can be heard"""
        self.offset = offset
        """Offset modifier"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "SoundProperties":
        """Read SoundProperties from input stream
        """
        name = stream.read_string()
        distance = stream.read_double()
        offset = stream.read_double()
        return SoundProperties(name, distance, offset)
    
    def write_to(self, stream: StreamWrapper):
        """Write SoundProperties to output stream
        """
        stream.write_string(self.name)
        stream.write_double(self.distance)
        stream.write_double(self.offset)
    
    def __repr__(self):
        return "SoundProperties(" + \
            repr(self.name) + \
            ", " + \
            repr(self.distance) + \
            ", " + \
            repr(self.offset) + \
            ")"