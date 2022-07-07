from stream_wrapper import StreamWrapper

class Player:
    """Game's participant (team of units)"""

    __slots__ = ("id","kills","damage","place","score",)

    id: int
    kills: int
    damage: float
    place: int
    score: float

    def __init__(self, id: int, kills: int, damage: float, place: int, score: float):
        self.id = id
        """Unique id"""
        self.kills = kills
        """Number of kills"""
        self.damage = damage
        """Total damage dealt to enemies"""
        self.place = place
        """Survival place (number of survivor teams currently/at the moment of death)"""
        self.score = score
        """Team score"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Player":
        """Read Player from input stream
        """
        id = stream.read_int()
        kills = stream.read_int()
        damage = stream.read_double()
        place = stream.read_int()
        score = stream.read_double()
        return Player(id, kills, damage, place, score)
    
    def write_to(self, stream: StreamWrapper):
        """Write Player to output stream
        """
        stream.write_int(self.id)
        stream.write_int(self.kills)
        stream.write_double(self.damage)
        stream.write_int(self.place)
        stream.write_double(self.score)
    
    def __repr__(self):
        return "Player(" + \
            repr(self.id) + \
            ", " + \
            repr(self.kills) + \
            ", " + \
            repr(self.damage) + \
            ", " + \
            repr(self.place) + \
            ", " + \
            repr(self.score) + \
            ")"