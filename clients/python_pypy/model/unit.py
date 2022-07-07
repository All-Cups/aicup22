from model.action import Action
from model.vec2 import Vec2
from stream_wrapper import StreamWrapper
from typing import List
from typing import Optional

class Unit:
    """A unit"""

    __slots__ = ("id","player_id","health","shield","extra_lives","position","remaining_spawn_time","velocity","direction","aim","action","health_regeneration_start_tick","weapon","next_shot_tick","ammo","shield_potions",)

    id: int
    player_id: int
    health: float
    shield: float
    extra_lives: int
    position: Vec2
    remaining_spawn_time: Optional[float]
    velocity: Vec2
    direction: Vec2
    aim: float
    action: Optional[Action]
    health_regeneration_start_tick: int
    weapon: Optional[int]
    next_shot_tick: int
    ammo: List[int]
    shield_potions: int

    def __init__(self, id: int, player_id: int, health: float, shield: float, extra_lives: int, position: Vec2, remaining_spawn_time: Optional[float], velocity: Vec2, direction: Vec2, aim: float, action: Optional[Action], health_regeneration_start_tick: int, weapon: Optional[int], next_shot_tick: int, ammo: List[int], shield_potions: int):
        self.id = id
        """Unique id"""
        self.player_id = player_id
        """Id of the player (team) controlling the unit"""
        self.health = health
        """Current health"""
        self.shield = shield
        """Current shield value"""
        self.extra_lives = extra_lives
        """Left extra lives of this unit"""
        self.position = position
        """Current position of unit's center"""
        self.remaining_spawn_time = remaining_spawn_time
        """Remaining time until unit will be spawned, or None"""
        self.velocity = velocity
        """Current velocity"""
        self.direction = direction
        """Current view direction (vector of length 1)"""
        self.aim = aim
        """Value describing process of aiming (0 - not aiming, 1 - ready to shoot)"""
        self.action = action
        """Current action unit is performing, or None"""
        self.health_regeneration_start_tick = health_regeneration_start_tick
        """Tick when health regeneration will start (can be less than current game tick)"""
        self.weapon = weapon
        """Index of the weapon this unit is holding (starting with 0), or None"""
        self.next_shot_tick = next_shot_tick
        """Next tick when unit can shoot again (can be less than current game tick)"""
        self.ammo = ammo
        """List of ammo in unit's inventory for every weapon type"""
        self.shield_potions = shield_potions
        """Number of shield potions in inventory"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Unit":
        """Read Unit from input stream
        """
        id = stream.read_int()
        player_id = stream.read_int()
        health = stream.read_double()
        shield = stream.read_double()
        extra_lives = stream.read_int()
        position = Vec2.read_from(stream)
        if stream.read_bool():
            remaining_spawn_time = stream.read_double()
        else:
            remaining_spawn_time = None
        velocity = Vec2.read_from(stream)
        direction = Vec2.read_from(stream)
        aim = stream.read_double()
        if stream.read_bool():
            action = Action.read_from(stream)
        else:
            action = None
        health_regeneration_start_tick = stream.read_int()
        if stream.read_bool():
            weapon = stream.read_int()
        else:
            weapon = None
        next_shot_tick = stream.read_int()
        ammo = []
        for _ in range(stream.read_int()):
            ammo_element = stream.read_int()
            ammo.append(ammo_element)
        shield_potions = stream.read_int()
        return Unit(id, player_id, health, shield, extra_lives, position, remaining_spawn_time, velocity, direction, aim, action, health_regeneration_start_tick, weapon, next_shot_tick, ammo, shield_potions)
    
    def write_to(self, stream: StreamWrapper):
        """Write Unit to output stream
        """
        stream.write_int(self.id)
        stream.write_int(self.player_id)
        stream.write_double(self.health)
        stream.write_double(self.shield)
        stream.write_int(self.extra_lives)
        self.position.write_to(stream)
        if self.remaining_spawn_time is None:
            stream.write_bool(False)
        else:
            stream.write_bool(True)
            stream.write_double(self.remaining_spawn_time)
        self.velocity.write_to(stream)
        self.direction.write_to(stream)
        stream.write_double(self.aim)
        if self.action is None:
            stream.write_bool(False)
        else:
            stream.write_bool(True)
            self.action.write_to(stream)
        stream.write_int(self.health_regeneration_start_tick)
        if self.weapon is None:
            stream.write_bool(False)
        else:
            stream.write_bool(True)
            stream.write_int(self.weapon)
        stream.write_int(self.next_shot_tick)
        stream.write_int(len(self.ammo))
        for element in self.ammo:
            stream.write_int(element)
        stream.write_int(self.shield_potions)
    
    def __repr__(self):
        return "Unit(" + \
            repr(self.id) + \
            ", " + \
            repr(self.player_id) + \
            ", " + \
            repr(self.health) + \
            ", " + \
            repr(self.shield) + \
            ", " + \
            repr(self.extra_lives) + \
            ", " + \
            repr(self.position) + \
            ", " + \
            repr(self.remaining_spawn_time) + \
            ", " + \
            repr(self.velocity) + \
            ", " + \
            repr(self.direction) + \
            ", " + \
            repr(self.aim) + \
            ", " + \
            repr(self.action) + \
            ", " + \
            repr(self.health_regeneration_start_tick) + \
            ", " + \
            repr(self.weapon) + \
            ", " + \
            repr(self.next_shot_tick) + \
            ", " + \
            repr(self.ammo) + \
            ", " + \
            repr(self.shield_potions) + \
            ")"