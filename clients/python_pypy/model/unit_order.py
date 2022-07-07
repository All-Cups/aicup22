from model.action_order import ActionOrder
from model.vec2 import Vec2
from stream_wrapper import StreamWrapper
from typing import Optional

class UnitOrder:
    """Order for specific unit"""

    __slots__ = ("target_velocity","target_direction","action",)

    target_velocity: Vec2
    target_direction: Vec2
    action: Optional[ActionOrder]

    def __init__(self, target_velocity: Vec2, target_direction: Vec2, action: Optional[ActionOrder]):
        self.target_velocity = target_velocity
        """Target moving velocity"""
        self.target_direction = target_direction
        """Target view direction (vector length doesn't matter)"""
        self.action = action
        """Order to perform an action, or None"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "UnitOrder":
        """Read UnitOrder from input stream
        """
        target_velocity = Vec2.read_from(stream)
        target_direction = Vec2.read_from(stream)
        if stream.read_bool():
            action = ActionOrder.read_from(stream)
        else:
            action = None
        return UnitOrder(target_velocity, target_direction, action)
    
    def write_to(self, stream: StreamWrapper):
        """Write UnitOrder to output stream
        """
        self.target_velocity.write_to(stream)
        self.target_direction.write_to(stream)
        if self.action is None:
            stream.write_bool(False)
        else:
            stream.write_bool(True)
            self.action.write_to(stream)
    
    def __repr__(self):
        return "UnitOrder(" + \
            repr(self.target_velocity) + \
            ", " + \
            repr(self.target_direction) + \
            ", " + \
            repr(self.action) + \
            ")"