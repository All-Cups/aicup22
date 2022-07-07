from model.item import Item
from model.vec2 import Vec2
from stream_wrapper import StreamWrapper

class Loot:
    """Loot lying on the ground"""

    __slots__ = ("id","position","item",)

    id: int
    position: Vec2
    item: Item

    def __init__(self, id: int, position: Vec2, item: Item):
        self.id = id
        """Unique id"""
        self.position = position
        """Position"""
        self.item = item
        """Item"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Loot":
        """Read Loot from input stream
        """
        id = stream.read_int()
        position = Vec2.read_from(stream)
        item = Item.read_from(stream)
        return Loot(id, position, item)
    
    def write_to(self, stream: StreamWrapper):
        """Write Loot to output stream
        """
        stream.write_int(self.id)
        self.position.write_to(stream)
        self.item.write_to(stream)
    
    def __repr__(self):
        return "Loot(" + \
            repr(self.id) + \
            ", " + \
            repr(self.position) + \
            ", " + \
            repr(self.item) + \
            ")"