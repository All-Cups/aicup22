from debugging.camera import Camera
from model.vec2 import Vec2
from stream_wrapper import StreamWrapper
from typing import List
from typing import Optional

class DebugState:
    """Renderer's state"""

    __slots__ = ("pressed_keys","cursor_world_position","locked_unit","camera",)

    pressed_keys: List[str]
    cursor_world_position: Vec2
    locked_unit: Optional[int]
    camera: Camera

    def __init__(self, pressed_keys: List[str], cursor_world_position: Vec2, locked_unit: Optional[int], camera: Camera):
        self.pressed_keys = pressed_keys
        """Pressed keys"""
        self.cursor_world_position = cursor_world_position
        """Cursor's position in game coordinates"""
        self.locked_unit = locked_unit
        """Id of unit which is followed by the camera, or None"""
        self.camera = camera
        """Current camera state"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "DebugState":
        """Read DebugState from input stream
        """
        pressed_keys = []
        for _ in range(stream.read_int()):
            pressed_keys_element = stream.read_string()
            pressed_keys.append(pressed_keys_element)
        cursor_world_position = Vec2.read_from(stream)
        if stream.read_bool():
            locked_unit = stream.read_int()
        else:
            locked_unit = None
        camera = Camera.read_from(stream)
        return DebugState(pressed_keys, cursor_world_position, locked_unit, camera)
    
    def write_to(self, stream: StreamWrapper):
        """Write DebugState to output stream
        """
        stream.write_int(len(self.pressed_keys))
        for element in self.pressed_keys:
            stream.write_string(element)
        self.cursor_world_position.write_to(stream)
        if self.locked_unit is None:
            stream.write_bool(False)
        else:
            stream.write_bool(True)
            stream.write_int(self.locked_unit)
        self.camera.write_to(stream)
    
    def __repr__(self):
        return "DebugState(" + \
            repr(self.pressed_keys) + \
            ", " + \
            repr(self.cursor_world_position) + \
            ", " + \
            repr(self.locked_unit) + \
            ", " + \
            repr(self.camera) + \
            ")"