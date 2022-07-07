from stream_wrapper import StreamWrapper
from typing import Optional

class WeaponProperties:
    """Weapon properties"""

    __slots__ = ("name","rounds_per_second","spread","aim_time","aim_field_of_view","aim_rotation_speed","aim_movement_speed_modifier","projectile_speed","projectile_damage","projectile_life_time","shot_sound_type_index","projectile_hit_sound_type_index","max_inventory_ammo",)

    name: str
    rounds_per_second: float
    spread: float
    aim_time: float
    aim_field_of_view: float
    aim_rotation_speed: float
    aim_movement_speed_modifier: float
    projectile_speed: float
    projectile_damage: float
    projectile_life_time: float
    shot_sound_type_index: Optional[int]
    projectile_hit_sound_type_index: Optional[int]
    max_inventory_ammo: int

    def __init__(self, name: str, rounds_per_second: float, spread: float, aim_time: float, aim_field_of_view: float, aim_rotation_speed: float, aim_movement_speed_modifier: float, projectile_speed: float, projectile_damage: float, projectile_life_time: float, shot_sound_type_index: Optional[int], projectile_hit_sound_type_index: Optional[int], max_inventory_ammo: int):
        self.name = name
        """Name"""
        self.rounds_per_second = rounds_per_second
        """Shooting speed (number of shots per second)"""
        self.spread = spread
        """Accuracy (spread angle) of a shot (in degrees)"""
        self.aim_time = aim_time
        """Aiming time"""
        self.aim_field_of_view = aim_field_of_view
        """Field of view in full aim (in degrees)"""
        self.aim_rotation_speed = aim_rotation_speed
        """Rotation speed in full aim (degrees per second)"""
        self.aim_movement_speed_modifier = aim_movement_speed_modifier
        """Movement speed modifier in full aim"""
        self.projectile_speed = projectile_speed
        """Speed of projectiles"""
        self.projectile_damage = projectile_damage
        """Damage of a projectile"""
        self.projectile_life_time = projectile_life_time
        """Projectiles' life time"""
        self.shot_sound_type_index = shot_sound_type_index
        """Index of the sound when shooting (starting with 0), or None"""
        self.projectile_hit_sound_type_index = projectile_hit_sound_type_index
        """Index of the sound when hitting something (starting with 0), or None"""
        self.max_inventory_ammo = max_inventory_ammo
        """Max amount of ammo unit can hold in their inventory"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "WeaponProperties":
        """Read WeaponProperties from input stream
        """
        name = stream.read_string()
        rounds_per_second = stream.read_double()
        spread = stream.read_double()
        aim_time = stream.read_double()
        aim_field_of_view = stream.read_double()
        aim_rotation_speed = stream.read_double()
        aim_movement_speed_modifier = stream.read_double()
        projectile_speed = stream.read_double()
        projectile_damage = stream.read_double()
        projectile_life_time = stream.read_double()
        if stream.read_bool():
            shot_sound_type_index = stream.read_int()
        else:
            shot_sound_type_index = None
        if stream.read_bool():
            projectile_hit_sound_type_index = stream.read_int()
        else:
            projectile_hit_sound_type_index = None
        max_inventory_ammo = stream.read_int()
        return WeaponProperties(name, rounds_per_second, spread, aim_time, aim_field_of_view, aim_rotation_speed, aim_movement_speed_modifier, projectile_speed, projectile_damage, projectile_life_time, shot_sound_type_index, projectile_hit_sound_type_index, max_inventory_ammo)
    
    def write_to(self, stream: StreamWrapper):
        """Write WeaponProperties to output stream
        """
        stream.write_string(self.name)
        stream.write_double(self.rounds_per_second)
        stream.write_double(self.spread)
        stream.write_double(self.aim_time)
        stream.write_double(self.aim_field_of_view)
        stream.write_double(self.aim_rotation_speed)
        stream.write_double(self.aim_movement_speed_modifier)
        stream.write_double(self.projectile_speed)
        stream.write_double(self.projectile_damage)
        stream.write_double(self.projectile_life_time)
        if self.shot_sound_type_index is None:
            stream.write_bool(False)
        else:
            stream.write_bool(True)
            stream.write_int(self.shot_sound_type_index)
        if self.projectile_hit_sound_type_index is None:
            stream.write_bool(False)
        else:
            stream.write_bool(True)
            stream.write_int(self.projectile_hit_sound_type_index)
        stream.write_int(self.max_inventory_ammo)
    
    def __repr__(self):
        return "WeaponProperties(" + \
            repr(self.name) + \
            ", " + \
            repr(self.rounds_per_second) + \
            ", " + \
            repr(self.spread) + \
            ", " + \
            repr(self.aim_time) + \
            ", " + \
            repr(self.aim_field_of_view) + \
            ", " + \
            repr(self.aim_rotation_speed) + \
            ", " + \
            repr(self.aim_movement_speed_modifier) + \
            ", " + \
            repr(self.projectile_speed) + \
            ", " + \
            repr(self.projectile_damage) + \
            ", " + \
            repr(self.projectile_life_time) + \
            ", " + \
            repr(self.shot_sound_type_index) + \
            ", " + \
            repr(self.projectile_hit_sound_type_index) + \
            ", " + \
            repr(self.max_inventory_ammo) + \
            ")"