from model.loot import Loot
from model.player import Player
from model.projectile import Projectile
from model.sound import Sound
from model.unit import Unit
from model.zone import Zone
from stream_wrapper import StreamWrapper
from typing import List

class Game:
    """Current game's state"""

    __slots__ = ("my_id","players","current_tick","units","loot","projectiles","zone","sounds",)

    my_id: int
    players: List[Player]
    current_tick: int
    units: List[Unit]
    loot: List[Loot]
    projectiles: List[Projectile]
    zone: Zone
    sounds: List[Sound]

    def __init__(self, my_id: int, players: List[Player], current_tick: int, units: List[Unit], loot: List[Loot], projectiles: List[Projectile], zone: Zone, sounds: List[Sound]):
        self.my_id = my_id
        """Your player's id"""
        self.players = players
        """List of players (teams)"""
        self.current_tick = current_tick
        """Current tick"""
        self.units = units
        """List of units visible by your team"""
        self.loot = loot
        """List of loot visible by your team"""
        self.projectiles = projectiles
        """List of projectiles visible by your team"""
        self.zone = zone
        """Current state of game zone"""
        self.sounds = sounds
        """List of sounds heard by your team during last tick"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Game":
        """Read Game from input stream
        """
        my_id = stream.read_int()
        players = []
        for _ in range(stream.read_int()):
            players_element = Player.read_from(stream)
            players.append(players_element)
        current_tick = stream.read_int()
        units = []
        for _ in range(stream.read_int()):
            units_element = Unit.read_from(stream)
            units.append(units_element)
        loot = []
        for _ in range(stream.read_int()):
            loot_element = Loot.read_from(stream)
            loot.append(loot_element)
        projectiles = []
        for _ in range(stream.read_int()):
            projectiles_element = Projectile.read_from(stream)
            projectiles.append(projectiles_element)
        zone = Zone.read_from(stream)
        sounds = []
        for _ in range(stream.read_int()):
            sounds_element = Sound.read_from(stream)
            sounds.append(sounds_element)
        return Game(my_id, players, current_tick, units, loot, projectiles, zone, sounds)
    
    def write_to(self, stream: StreamWrapper):
        """Write Game to output stream
        """
        stream.write_int(self.my_id)
        stream.write_int(len(self.players))
        for element in self.players:
            element.write_to(stream)
        stream.write_int(self.current_tick)
        stream.write_int(len(self.units))
        for element in self.units:
            element.write_to(stream)
        stream.write_int(len(self.loot))
        for element in self.loot:
            element.write_to(stream)
        stream.write_int(len(self.projectiles))
        for element in self.projectiles:
            element.write_to(stream)
        self.zone.write_to(stream)
        stream.write_int(len(self.sounds))
        for element in self.sounds:
            element.write_to(stream)
    
    def __repr__(self):
        return "Game(" + \
            repr(self.my_id) + \
            ", " + \
            repr(self.players) + \
            ", " + \
            repr(self.current_tick) + \
            ", " + \
            repr(self.units) + \
            ", " + \
            repr(self.loot) + \
            ", " + \
            repr(self.projectiles) + \
            ", " + \
            repr(self.zone) + \
            ", " + \
            repr(self.sounds) + \
            ")"