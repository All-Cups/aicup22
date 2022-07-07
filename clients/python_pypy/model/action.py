from model.action_type import ActionType
from stream_wrapper import StreamWrapper

class Action:
    """Action unit is currently performing"""

    __slots__ = ("finish_tick","action_type",)

    finish_tick: int
    action_type: ActionType

    def __init__(self, finish_tick: int, action_type: ActionType):
        self.finish_tick = finish_tick
        """Tick when the action will be finished"""
        self.action_type = action_type
        """Type of the action"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Action":
        """Read Action from input stream
        """
        finish_tick = stream.read_int()
        action_type = ActionType(stream.read_int())
        return Action(finish_tick, action_type)
    
    def write_to(self, stream: StreamWrapper):
        """Write Action to output stream
        """
        stream.write_int(self.finish_tick)
        stream.write_int(self.action_type)
    
    def __repr__(self):
        return "Action(" + \
            repr(self.finish_tick) + \
            ", " + \
            repr(self.action_type) + \
            ")"