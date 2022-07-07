from model.obstacle import Obstacle
from model.sound_properties import SoundProperties
from model.weapon_properties import WeaponProperties
from stream_wrapper import StreamWrapper
from typing import List
from typing import Optional

class Constants:
    """Non changing game state"""

    __slots__ = ("ticks_per_second","team_size","initial_zone_radius","zone_speed","zone_damage_per_second","spawn_time","spawn_collision_damage_per_second","looting_time","bot_players","unit_radius","unit_health","health_regeneration_per_second","health_regeneration_delay","max_shield","spawn_shield","extra_lives","last_respawn_zone_radius","field_of_view","view_distance","view_blocking","rotation_speed","spawn_movement_speed","max_unit_forward_speed","max_unit_backward_speed","unit_acceleration","friendly_fire","kill_score","damage_score_multiplier","score_per_place","weapons","starting_weapon","starting_weapon_ammo","max_shield_potions_in_inventory","shield_per_potion","shield_potion_use_time","sounds","steps_sound_type_index","steps_sound_travel_distance","obstacles",)

    ticks_per_second: float
    team_size: int
    initial_zone_radius: float
    zone_speed: float
    zone_damage_per_second: float
    spawn_time: float
    spawn_collision_damage_per_second: float
    looting_time: float
    bot_players: int
    unit_radius: float
    unit_health: float
    health_regeneration_per_second: float
    health_regeneration_delay: float
    max_shield: float
    spawn_shield: float
    extra_lives: int
    last_respawn_zone_radius: float
    field_of_view: float
    view_distance: float
    view_blocking: bool
    rotation_speed: float
    spawn_movement_speed: float
    max_unit_forward_speed: float
    max_unit_backward_speed: float
    unit_acceleration: float
    friendly_fire: bool
    kill_score: float
    damage_score_multiplier: float
    score_per_place: float
    weapons: List[WeaponProperties]
    starting_weapon: Optional[int]
    starting_weapon_ammo: int
    max_shield_potions_in_inventory: int
    shield_per_potion: float
    shield_potion_use_time: float
    sounds: List[SoundProperties]
    steps_sound_type_index: Optional[int]
    steps_sound_travel_distance: float
    obstacles: List[Obstacle]

    def __init__(self, ticks_per_second: float, team_size: int, initial_zone_radius: float, zone_speed: float, zone_damage_per_second: float, spawn_time: float, spawn_collision_damage_per_second: float, looting_time: float, bot_players: int, unit_radius: float, unit_health: float, health_regeneration_per_second: float, health_regeneration_delay: float, max_shield: float, spawn_shield: float, extra_lives: int, last_respawn_zone_radius: float, field_of_view: float, view_distance: float, view_blocking: bool, rotation_speed: float, spawn_movement_speed: float, max_unit_forward_speed: float, max_unit_backward_speed: float, unit_acceleration: float, friendly_fire: bool, kill_score: float, damage_score_multiplier: float, score_per_place: float, weapons: List[WeaponProperties], starting_weapon: Optional[int], starting_weapon_ammo: int, max_shield_potions_in_inventory: int, shield_per_potion: float, shield_potion_use_time: float, sounds: List[SoundProperties], steps_sound_type_index: Optional[int], steps_sound_travel_distance: float, obstacles: List[Obstacle]):
        self.ticks_per_second = ticks_per_second
        """Number of ticks per game second"""
        self.team_size = team_size
        """Starting number of units in each team"""
        self.initial_zone_radius = initial_zone_radius
        """Initial zone radius"""
        self.zone_speed = zone_speed
        """Speed of zone radius"""
        self.zone_damage_per_second = zone_damage_per_second
        """Damage dealt to units outside of the zone per second"""
        self.spawn_time = spawn_time
        """Unit spawning time"""
        self.spawn_collision_damage_per_second = spawn_collision_damage_per_second
        """Damage dealt to units trying to spawn in incorrect position per second"""
        self.looting_time = looting_time
        """Time required to perform looting actions (in seconds)"""
        self.bot_players = bot_players
        """Number of bot players (teams)"""
        self.unit_radius = unit_radius
        """Units' radius"""
        self.unit_health = unit_health
        """Max units' health"""
        self.health_regeneration_per_second = health_regeneration_per_second
        """Health automatically restored per second"""
        self.health_regeneration_delay = health_regeneration_delay
        """Time until automatic health regeneration since last health damage (in seconds)"""
        self.max_shield = max_shield
        """Max value of unit's shield"""
        self.spawn_shield = spawn_shield
        """Initial value of unit's shield"""
        self.extra_lives = extra_lives
        """Initial number of extra lives for units"""
        self.last_respawn_zone_radius = last_respawn_zone_radius
        """Zone radius after which respawning is disabled"""
        self.field_of_view = field_of_view
        """Units' field of view without aiming (in degrees)"""
        self.view_distance = view_distance
        """Units' view distance"""
        self.view_blocking = view_blocking
        """Whether units' view is blocked by obstacles"""
        self.rotation_speed = rotation_speed
        """Unit rotation speed without aiming (degrees per second)"""
        self.spawn_movement_speed = spawn_movement_speed
        """Units' movement speed while spawning"""
        self.max_unit_forward_speed = max_unit_forward_speed
        """Max unit speed when walking forward"""
        self.max_unit_backward_speed = max_unit_backward_speed
        """Max unit speed when walking backward"""
        self.unit_acceleration = unit_acceleration
        """Max unit acceleration"""
        self.friendly_fire = friendly_fire
        """Whether a unit can damage units of the same team"""
        self.kill_score = kill_score
        """Score given for killing enemy unit"""
        self.damage_score_multiplier = damage_score_multiplier
        """Score multiplier for damaging enemy units"""
        self.score_per_place = score_per_place
        """Score given for every team killed before you"""
        self.weapons = weapons
        """List of properties of every weapon type"""
        self.starting_weapon = starting_weapon
        """Starting weapon with which units spawn, or None"""
        self.starting_weapon_ammo = starting_weapon_ammo
        """Ammo for starting weapon given when unit spawns"""
        self.max_shield_potions_in_inventory = max_shield_potions_in_inventory
        """Max number of shield potions in unit's inventory"""
        self.shield_per_potion = shield_per_potion
        """Amount of shield restored using one potion"""
        self.shield_potion_use_time = shield_potion_use_time
        """Time required to perform action of using shield potion"""
        self.sounds = sounds
        """List of properties of every sound type"""
        self.steps_sound_type_index = steps_sound_type_index
        """Sound type index when moving (starting with 0), or None"""
        self.steps_sound_travel_distance = steps_sound_travel_distance
        """Distance when steps sound will be 100% probability"""
        self.obstacles = obstacles
        """List of obstacles on the map"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Constants":
        """Read Constants from input stream
        """
        ticks_per_second = stream.read_double()
        team_size = stream.read_int()
        initial_zone_radius = stream.read_double()
        zone_speed = stream.read_double()
        zone_damage_per_second = stream.read_double()
        spawn_time = stream.read_double()
        spawn_collision_damage_per_second = stream.read_double()
        looting_time = stream.read_double()
        bot_players = stream.read_int()
        unit_radius = stream.read_double()
        unit_health = stream.read_double()
        health_regeneration_per_second = stream.read_double()
        health_regeneration_delay = stream.read_double()
        max_shield = stream.read_double()
        spawn_shield = stream.read_double()
        extra_lives = stream.read_int()
        last_respawn_zone_radius = stream.read_double()
        field_of_view = stream.read_double()
        view_distance = stream.read_double()
        view_blocking = stream.read_bool()
        rotation_speed = stream.read_double()
        spawn_movement_speed = stream.read_double()
        max_unit_forward_speed = stream.read_double()
        max_unit_backward_speed = stream.read_double()
        unit_acceleration = stream.read_double()
        friendly_fire = stream.read_bool()
        kill_score = stream.read_double()
        damage_score_multiplier = stream.read_double()
        score_per_place = stream.read_double()
        weapons = []
        for _ in range(stream.read_int()):
            weapons_element = WeaponProperties.read_from(stream)
            weapons.append(weapons_element)
        if stream.read_bool():
            starting_weapon = stream.read_int()
        else:
            starting_weapon = None
        starting_weapon_ammo = stream.read_int()
        max_shield_potions_in_inventory = stream.read_int()
        shield_per_potion = stream.read_double()
        shield_potion_use_time = stream.read_double()
        sounds = []
        for _ in range(stream.read_int()):
            sounds_element = SoundProperties.read_from(stream)
            sounds.append(sounds_element)
        if stream.read_bool():
            steps_sound_type_index = stream.read_int()
        else:
            steps_sound_type_index = None
        steps_sound_travel_distance = stream.read_double()
        obstacles = []
        for _ in range(stream.read_int()):
            obstacles_element = Obstacle.read_from(stream)
            obstacles.append(obstacles_element)
        return Constants(ticks_per_second, team_size, initial_zone_radius, zone_speed, zone_damage_per_second, spawn_time, spawn_collision_damage_per_second, looting_time, bot_players, unit_radius, unit_health, health_regeneration_per_second, health_regeneration_delay, max_shield, spawn_shield, extra_lives, last_respawn_zone_radius, field_of_view, view_distance, view_blocking, rotation_speed, spawn_movement_speed, max_unit_forward_speed, max_unit_backward_speed, unit_acceleration, friendly_fire, kill_score, damage_score_multiplier, score_per_place, weapons, starting_weapon, starting_weapon_ammo, max_shield_potions_in_inventory, shield_per_potion, shield_potion_use_time, sounds, steps_sound_type_index, steps_sound_travel_distance, obstacles)
    
    def write_to(self, stream: StreamWrapper):
        """Write Constants to output stream
        """
        stream.write_double(self.ticks_per_second)
        stream.write_int(self.team_size)
        stream.write_double(self.initial_zone_radius)
        stream.write_double(self.zone_speed)
        stream.write_double(self.zone_damage_per_second)
        stream.write_double(self.spawn_time)
        stream.write_double(self.spawn_collision_damage_per_second)
        stream.write_double(self.looting_time)
        stream.write_int(self.bot_players)
        stream.write_double(self.unit_radius)
        stream.write_double(self.unit_health)
        stream.write_double(self.health_regeneration_per_second)
        stream.write_double(self.health_regeneration_delay)
        stream.write_double(self.max_shield)
        stream.write_double(self.spawn_shield)
        stream.write_int(self.extra_lives)
        stream.write_double(self.last_respawn_zone_radius)
        stream.write_double(self.field_of_view)
        stream.write_double(self.view_distance)
        stream.write_bool(self.view_blocking)
        stream.write_double(self.rotation_speed)
        stream.write_double(self.spawn_movement_speed)
        stream.write_double(self.max_unit_forward_speed)
        stream.write_double(self.max_unit_backward_speed)
        stream.write_double(self.unit_acceleration)
        stream.write_bool(self.friendly_fire)
        stream.write_double(self.kill_score)
        stream.write_double(self.damage_score_multiplier)
        stream.write_double(self.score_per_place)
        stream.write_int(len(self.weapons))
        for element in self.weapons:
            element.write_to(stream)
        if self.starting_weapon is None:
            stream.write_bool(False)
        else:
            stream.write_bool(True)
            stream.write_int(self.starting_weapon)
        stream.write_int(self.starting_weapon_ammo)
        stream.write_int(self.max_shield_potions_in_inventory)
        stream.write_double(self.shield_per_potion)
        stream.write_double(self.shield_potion_use_time)
        stream.write_int(len(self.sounds))
        for element in self.sounds:
            element.write_to(stream)
        if self.steps_sound_type_index is None:
            stream.write_bool(False)
        else:
            stream.write_bool(True)
            stream.write_int(self.steps_sound_type_index)
        stream.write_double(self.steps_sound_travel_distance)
        stream.write_int(len(self.obstacles))
        for element in self.obstacles:
            element.write_to(stream)
    
    def __repr__(self):
        return "Constants(" + \
            repr(self.ticks_per_second) + \
            ", " + \
            repr(self.team_size) + \
            ", " + \
            repr(self.initial_zone_radius) + \
            ", " + \
            repr(self.zone_speed) + \
            ", " + \
            repr(self.zone_damage_per_second) + \
            ", " + \
            repr(self.spawn_time) + \
            ", " + \
            repr(self.spawn_collision_damage_per_second) + \
            ", " + \
            repr(self.looting_time) + \
            ", " + \
            repr(self.bot_players) + \
            ", " + \
            repr(self.unit_radius) + \
            ", " + \
            repr(self.unit_health) + \
            ", " + \
            repr(self.health_regeneration_per_second) + \
            ", " + \
            repr(self.health_regeneration_delay) + \
            ", " + \
            repr(self.max_shield) + \
            ", " + \
            repr(self.spawn_shield) + \
            ", " + \
            repr(self.extra_lives) + \
            ", " + \
            repr(self.last_respawn_zone_radius) + \
            ", " + \
            repr(self.field_of_view) + \
            ", " + \
            repr(self.view_distance) + \
            ", " + \
            repr(self.view_blocking) + \
            ", " + \
            repr(self.rotation_speed) + \
            ", " + \
            repr(self.spawn_movement_speed) + \
            ", " + \
            repr(self.max_unit_forward_speed) + \
            ", " + \
            repr(self.max_unit_backward_speed) + \
            ", " + \
            repr(self.unit_acceleration) + \
            ", " + \
            repr(self.friendly_fire) + \
            ", " + \
            repr(self.kill_score) + \
            ", " + \
            repr(self.damage_score_multiplier) + \
            ", " + \
            repr(self.score_per_place) + \
            ", " + \
            repr(self.weapons) + \
            ", " + \
            repr(self.starting_weapon) + \
            ", " + \
            repr(self.starting_weapon_ammo) + \
            ", " + \
            repr(self.max_shield_potions_in_inventory) + \
            ", " + \
            repr(self.shield_per_potion) + \
            ", " + \
            repr(self.shield_potion_use_time) + \
            ", " + \
            repr(self.sounds) + \
            ", " + \
            repr(self.steps_sound_type_index) + \
            ", " + \
            repr(self.steps_sound_travel_distance) + \
            ", " + \
            repr(self.obstacles) + \
            ")"