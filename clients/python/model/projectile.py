from model.vec2 import Vec2
from stream_wrapper import StreamWrapper

class Projectile:
    """Weapon projectile"""

    __slots__ = ("id","weapon_type_index","shooter_id","shooter_player_id","position","velocity","life_time",)

    id: int
    weapon_type_index: int
    shooter_id: int
    shooter_player_id: int
    position: Vec2
    velocity: Vec2
    life_time: float

    def __init__(self, id: int, weapon_type_index: int, shooter_id: int, shooter_player_id: int, position: Vec2, velocity: Vec2, life_time: float):
        self.id = id
        """Unique id"""
        self.weapon_type_index = weapon_type_index
        """Index of the weapon this projectile was shot from (starts with 0)"""
        self.shooter_id = shooter_id
        """Id of unit who made the shot"""
        self.shooter_player_id = shooter_player_id
        """Id of player (team), whose unit made the shot"""
        self.position = position
        """Current position"""
        self.velocity = velocity
        """Projectile's velocity"""
        self.life_time = life_time
        """Left time of projectile's life"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Projectile":
        """Read Projectile from input stream
        """
        id = stream.read_int()
        weapon_type_index = stream.read_int()
        shooter_id = stream.read_int()
        shooter_player_id = stream.read_int()
        position = Vec2.read_from(stream)
        velocity = Vec2.read_from(stream)
        life_time = stream.read_double()
        return Projectile(id, weapon_type_index, shooter_id, shooter_player_id, position, velocity, life_time)
    
    def write_to(self, stream: StreamWrapper):
        """Write Projectile to output stream
        """
        stream.write_int(self.id)
        stream.write_int(self.weapon_type_index)
        stream.write_int(self.shooter_id)
        stream.write_int(self.shooter_player_id)
        self.position.write_to(stream)
        self.velocity.write_to(stream)
        stream.write_double(self.life_time)
    
    def __repr__(self):
        return "Projectile(" + \
            repr(self.id) + \
            ", " + \
            repr(self.weapon_type_index) + \
            ", " + \
            repr(self.shooter_id) + \
            ", " + \
            repr(self.shooter_player_id) + \
            ", " + \
            repr(self.position) + \
            ", " + \
            repr(self.velocity) + \
            ", " + \
            repr(self.life_time) + \
            ")"