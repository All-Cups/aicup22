from model.constants import Constants
from model.game import Game
from stream_wrapper import StreamWrapper

class ServerMessage:
    """Message sent from server"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "ServerMessage":
        """Read ServerMessage from input stream
        """
        tag = stream.read_int()
        if tag == UpdateConstants.TAG:
            return ServerMessage.UpdateConstants.read_from(stream)
        if tag == GetOrder.TAG:
            return ServerMessage.GetOrder.read_from(stream)
        if tag == Finish.TAG:
            return ServerMessage.Finish.read_from(stream)
        if tag == DebugUpdate.TAG:
            return ServerMessage.DebugUpdate.read_from(stream)
        raise Exception("Unexpected tag value")

class UpdateConstants(ServerMessage):
    """Update constants"""

    TAG = 0

    __slots__ = ("constants",)

    constants: Constants

    def __init__(self, constants: Constants):
        self.constants = constants
        """New constants"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "UpdateConstants":
        """Read UpdateConstants from input stream
        """
        constants = Constants.read_from(stream)
        return UpdateConstants(constants)
    
    def write_to(self, stream: StreamWrapper):
        """Write UpdateConstants to output stream
        """
        stream.write_int(self.TAG)
        self.constants.write_to(stream)
    
    def __repr__(self):
        return "UpdateConstants(" + \
            repr(self.constants) + \
            ")"

ServerMessage.UpdateConstants = UpdateConstants

class GetOrder(ServerMessage):
    """Get order for next tick"""

    TAG = 1

    __slots__ = ("player_view","debug_available",)

    player_view: Game
    debug_available: bool

    def __init__(self, player_view: Game, debug_available: bool):
        self.player_view = player_view
        """Player's view"""
        self.debug_available = debug_available
        """Whether app is running with debug interface available"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "GetOrder":
        """Read GetOrder from input stream
        """
        player_view = Game.read_from(stream)
        debug_available = stream.read_bool()
        return GetOrder(player_view, debug_available)
    
    def write_to(self, stream: StreamWrapper):
        """Write GetOrder to output stream
        """
        stream.write_int(self.TAG)
        self.player_view.write_to(stream)
        stream.write_bool(self.debug_available)
    
    def __repr__(self):
        return "GetOrder(" + \
            repr(self.player_view) + \
            ", " + \
            repr(self.debug_available) + \
            ")"

ServerMessage.GetOrder = GetOrder

class Finish(ServerMessage):
    """Signifies end of the game"""

    TAG = 2

    __slots__ = ()


    def __init__(self):
        pass

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Finish":
        """Read Finish from input stream
        """
        return Finish()
    
    def write_to(self, stream: StreamWrapper):
        """Write Finish to output stream
        """
        stream.write_int(self.TAG)
    
    def __repr__(self):
        return "Finish(" + \
            ")"

ServerMessage.Finish = Finish

class DebugUpdate(ServerMessage):
    """Debug update"""

    TAG = 3

    __slots__ = ("displayed_tick",)

    displayed_tick: int

    def __init__(self, displayed_tick: int):
        self.displayed_tick = displayed_tick
        """Displayed tick"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "DebugUpdate":
        """Read DebugUpdate from input stream
        """
        displayed_tick = stream.read_int()
        return DebugUpdate(displayed_tick)
    
    def write_to(self, stream: StreamWrapper):
        """Write DebugUpdate to output stream
        """
        stream.write_int(self.TAG)
        stream.write_int(self.displayed_tick)
    
    def __repr__(self):
        return "DebugUpdate(" + \
            repr(self.displayed_tick) + \
            ")"

ServerMessage.DebugUpdate = DebugUpdate