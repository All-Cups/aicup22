class DebugInterface
    def initialize(stream)
        @stream = stream
    end

    def add_placed_text(position, text, alignment, size, color)
        add(Debugging::DebugData::PlacedText.new(position, text, alignment, size, color))
    end
    
    def add_circle(position, radius, color)
        add(Debugging::DebugData::Circle.new(position, radius, color))
    end
    
    def add_gradient_circle(position, radius, inner_color, outer_color)
        add(Debugging::DebugData::GradientCircle.new(position, radius, inner_color, outer_color))
    end
    
    def add_ring(position, radius, width, color)
        add(Debugging::DebugData::Ring.new(position, radius, width, color))
    end
    
    def add_pie(position, radius, start_angle, end_angle, color)
        add(Debugging::DebugData::Pie.new(position, radius, start_angle, end_angle, color))
    end
    
    def add_arc(position, radius, width, start_angle, end_angle, color)
        add(Debugging::DebugData::Arc.new(position, radius, width, start_angle, end_angle, color))
    end
    
    def add_rect(bottom_left, size, color)
        add(Debugging::DebugData::Rect.new(bottom_left, size, color))
    end
    
    def add_polygon(vertices, color)
        add(Debugging::DebugData::Polygon.new(vertices, color))
    end
    
    def add_gradient_polygon(vertices)
        add(Debugging::DebugData::GradientPolygon.new(vertices))
    end
    
    def add_segment(first_end, second_end, width, color)
        add(Debugging::DebugData::Segment.new(first_end, second_end, width, color))
    end
    
    def add_gradient_segment(first_end, first_color, second_end, second_color, width)
        add(Debugging::DebugData::GradientSegment.new(first_end, first_color, second_end, second_color, width))
    end
    
    def add_poly_line(vertices, width, color)
        add(Debugging::DebugData::PolyLine.new(vertices, width, color))
    end
    
    def add_gradient_poly_line(vertices, width)
        add(Debugging::DebugData::GradientPolyLine.new(vertices, width))
    end

    def add(debug_data)
        send(Debugging::DebugCommand::Add.new(debug_data))
    end
    
    def clear()
        send(Debugging::DebugCommand::Clear.new())
    end
    
    def set_auto_flush(enable)
        send(Debugging::DebugCommand::SetAutoFlush.new(enable))
    end
    
    def flush()
        send(Debugging::DebugCommand::Flush.new())
    end

    def send(command)
        Codegame::ClientMessage::DebugMessage.new(command).write_to(@stream)
        @stream.flush()
    end

    def get_state()
        Codegame::ClientMessage::RequestDebugState.new().write_to(@stream)
        @stream.flush()
        return Debugging::DebugState.read_from(@stream)
    end
end