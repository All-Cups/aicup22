from codegame.client_message import ClientMessage
from debugging.debug_command import DebugCommand
from debugging.debug_state import DebugState
from debugging.debug_data import DebugData
from stream_wrapper import StreamWrapper
from debugging.color import Color
from debugging.colored_vertex import ColoredVertex
from model.vec2 import Vec2
from stream_wrapper import StreamWrapper
from typing import List

class DebugInterface:
    def __init__(self, reader, writer):
        self.reader = reader
        self.writer = writer
        
    def add_placed_text(self, position: Vec2, text: str, alignment: Vec2, size: float, color: Color):
        self.add(DebugData.PlacedText(position, text, alignment, size, color))
    
    def add_circle(self, position: Vec2, radius: float, color: Color):
        self.add(DebugData.Circle(position, radius, color))
    
    def add_gradient_circle(self, position: Vec2, radius: float, inner_color: Color, outer_color: Color):
        self.add(DebugData.GradientCircle(position, radius, inner_color, outer_color))
    
    def add_ring(self, position: Vec2, radius: float, width: float, color: Color):
        self.add(DebugData.Ring(position, radius, width, color))
    
    def add_pie(self, position: Vec2, radius: float, start_angle: float, end_angle: float, color: Color):
        self.add(DebugData.Pie(position, radius, start_angle, end_angle, color))
    
    def add_arc(self, position: Vec2, radius: float, width: float, start_angle: float, end_angle: float, color: Color):
        self.add(DebugData.Arc(position, radius, width, start_angle, end_angle, color))
    
    def add_rect(self, bottom_left: Vec2, size: Vec2, color: Color):
        self.add(DebugData.Rect(bottom_left, size, color))
    
    def add_polygon(self, vertices: List[Vec2], color: Color):
        self.add(DebugData.Polygon(vertices, color))
    
    def add_gradient_polygon(self, vertices: List[ColoredVertex]):
        self.add(DebugData.GradientPolygon(vertices))
    
    def add_segment(self, first_end: Vec2, second_end: Vec2, width: float, color: Color):
        self.add(DebugData.Segment(first_end, second_end, width, color))
    
    def add_gradient_segment(self, first_end: Vec2, first_color: Color, second_end: Vec2, second_color: Color, width: float):
        self.add(DebugData.GradientSegment(first_end, first_color, second_end, second_color, width))
    
    def add_poly_line(self, vertices: List[Vec2], width: float, color: Color):
        self.add(DebugData.PolyLine(vertices, width, color))
    
    def add_gradient_poly_line(self, vertices: List[ColoredVertex], width: float):
        self.add(DebugData.GradientPolyLine(vertices, width))

    def add(self, debug_data: DebugData):
        self.send(DebugCommand.Add(debug_data))
    
    def clear(self):
        self.send(DebugCommand.Clear())
    
    def set_auto_flush(self, enable: bool):
        self.send(DebugCommand.SetAutoFlush(enable))
    
    def flush(self):
        self.send(DebugCommand.Flush())

    def send(self, command: DebugCommand):
        ClientMessage.DebugMessage(command).write_to(self.writer)
        self.writer.flush()

    def get_state(self) -> DebugState:
        ClientMessage.RequestDebugState().write_to(self.writer)
        self.writer.flush()
        return DebugState.read_from(self.reader)