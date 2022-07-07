require './debugging/color'
require './debugging/colored_vertex'
require './model/vec2'

module Debugging

# Data for debug rendering
class DebugData
    # Read DebugData from input stream
    def self.read_from(stream)
        tag = stream.read_int()
        if tag == DebugData::PlacedText::TAG
            return DebugData::PlacedText.read_from(stream)
        end
        if tag == DebugData::Circle::TAG
            return DebugData::Circle.read_from(stream)
        end
        if tag == DebugData::GradientCircle::TAG
            return DebugData::GradientCircle.read_from(stream)
        end
        if tag == DebugData::Ring::TAG
            return DebugData::Ring.read_from(stream)
        end
        if tag == DebugData::Pie::TAG
            return DebugData::Pie.read_from(stream)
        end
        if tag == DebugData::Arc::TAG
            return DebugData::Arc.read_from(stream)
        end
        if tag == DebugData::Rect::TAG
            return DebugData::Rect.read_from(stream)
        end
        if tag == DebugData::Polygon::TAG
            return DebugData::Polygon.read_from(stream)
        end
        if tag == DebugData::GradientPolygon::TAG
            return DebugData::GradientPolygon.read_from(stream)
        end
        if tag == DebugData::Segment::TAG
            return DebugData::Segment.read_from(stream)
        end
        if tag == DebugData::GradientSegment::TAG
            return DebugData::GradientSegment.read_from(stream)
        end
        if tag == DebugData::PolyLine::TAG
            return DebugData::PolyLine.read_from(stream)
        end
        if tag == DebugData::GradientPolyLine::TAG
            return DebugData::GradientPolyLine.read_from(stream)
        end
        raise "Unexpected tag value"
    end

    # Text
    class PlacedText
        TAG = 0
    
        # Position
        attr_accessor :position
        # Text
        attr_accessor :text
        # Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
        attr_accessor :alignment
        # Size
        attr_accessor :size
        # Color
        attr_accessor :color
    
        def initialize(position, text, alignment, size, color)
            @position = position
            @text = text
            @alignment = alignment
            @size = size
            @color = color
        end
    
        # Read PlacedText from input stream
        def self.read_from(stream)
            position = Model::Vec2.read_from(stream)
            text = stream.read_string()
            alignment = Model::Vec2.read_from(stream)
            size = stream.read_double()
            color = Debugging::Color.read_from(stream)
            PlacedText.new(position, text, alignment, size, color)
        end
    
        # Write PlacedText to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @position.write_to(stream)
            stream.write_string(@text)
            @alignment.write_to(stream)
            stream.write_double(@size)
            @color.write_to(stream)
        end
    
        def to_s
            string_result = "PlacedText { "
            string_result += "position: "
            string_result += @position.to_s
            string_result += ", "
            string_result += "text: "
            string_result += @text.dump
            string_result += ", "
            string_result += "alignment: "
            string_result += @alignment.to_s
            string_result += ", "
            string_result += "size: "
            string_result += @size.to_s
            string_result += ", "
            string_result += "color: "
            string_result += @color.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Circle
    class Circle
        TAG = 1
    
        # Position of the center
        attr_accessor :position
        # Radius
        attr_accessor :radius
        # Color
        attr_accessor :color
    
        def initialize(position, radius, color)
            @position = position
            @radius = radius
            @color = color
        end
    
        # Read Circle from input stream
        def self.read_from(stream)
            position = Model::Vec2.read_from(stream)
            radius = stream.read_double()
            color = Debugging::Color.read_from(stream)
            Circle.new(position, radius, color)
        end
    
        # Write Circle to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @position.write_to(stream)
            stream.write_double(@radius)
            @color.write_to(stream)
        end
    
        def to_s
            string_result = "Circle { "
            string_result += "position: "
            string_result += @position.to_s
            string_result += ", "
            string_result += "radius: "
            string_result += @radius.to_s
            string_result += ", "
            string_result += "color: "
            string_result += @color.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Circle with gradient fill
    class GradientCircle
        TAG = 2
    
        # Position of the center
        attr_accessor :position
        # Radius
        attr_accessor :radius
        # Color of the center
        attr_accessor :inner_color
        # Color of the edge
        attr_accessor :outer_color
    
        def initialize(position, radius, inner_color, outer_color)
            @position = position
            @radius = radius
            @inner_color = inner_color
            @outer_color = outer_color
        end
    
        # Read GradientCircle from input stream
        def self.read_from(stream)
            position = Model::Vec2.read_from(stream)
            radius = stream.read_double()
            inner_color = Debugging::Color.read_from(stream)
            outer_color = Debugging::Color.read_from(stream)
            GradientCircle.new(position, radius, inner_color, outer_color)
        end
    
        # Write GradientCircle to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @position.write_to(stream)
            stream.write_double(@radius)
            @inner_color.write_to(stream)
            @outer_color.write_to(stream)
        end
    
        def to_s
            string_result = "GradientCircle { "
            string_result += "position: "
            string_result += @position.to_s
            string_result += ", "
            string_result += "radius: "
            string_result += @radius.to_s
            string_result += ", "
            string_result += "inner_color: "
            string_result += @inner_color.to_s
            string_result += ", "
            string_result += "outer_color: "
            string_result += @outer_color.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Ring
    class Ring
        TAG = 3
    
        # Position of the center
        attr_accessor :position
        # Radius
        attr_accessor :radius
        # Width
        attr_accessor :width
        # Color
        attr_accessor :color
    
        def initialize(position, radius, width, color)
            @position = position
            @radius = radius
            @width = width
            @color = color
        end
    
        # Read Ring from input stream
        def self.read_from(stream)
            position = Model::Vec2.read_from(stream)
            radius = stream.read_double()
            width = stream.read_double()
            color = Debugging::Color.read_from(stream)
            Ring.new(position, radius, width, color)
        end
    
        # Write Ring to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @position.write_to(stream)
            stream.write_double(@radius)
            stream.write_double(@width)
            @color.write_to(stream)
        end
    
        def to_s
            string_result = "Ring { "
            string_result += "position: "
            string_result += @position.to_s
            string_result += ", "
            string_result += "radius: "
            string_result += @radius.to_s
            string_result += ", "
            string_result += "width: "
            string_result += @width.to_s
            string_result += ", "
            string_result += "color: "
            string_result += @color.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Sector of a circle
    class Pie
        TAG = 4
    
        # Position of the center
        attr_accessor :position
        # Radius
        attr_accessor :radius
        # Start angle
        attr_accessor :start_angle
        # End angle
        attr_accessor :end_angle
        # Color
        attr_accessor :color
    
        def initialize(position, radius, start_angle, end_angle, color)
            @position = position
            @radius = radius
            @start_angle = start_angle
            @end_angle = end_angle
            @color = color
        end
    
        # Read Pie from input stream
        def self.read_from(stream)
            position = Model::Vec2.read_from(stream)
            radius = stream.read_double()
            start_angle = stream.read_double()
            end_angle = stream.read_double()
            color = Debugging::Color.read_from(stream)
            Pie.new(position, radius, start_angle, end_angle, color)
        end
    
        # Write Pie to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @position.write_to(stream)
            stream.write_double(@radius)
            stream.write_double(@start_angle)
            stream.write_double(@end_angle)
            @color.write_to(stream)
        end
    
        def to_s
            string_result = "Pie { "
            string_result += "position: "
            string_result += @position.to_s
            string_result += ", "
            string_result += "radius: "
            string_result += @radius.to_s
            string_result += ", "
            string_result += "start_angle: "
            string_result += @start_angle.to_s
            string_result += ", "
            string_result += "end_angle: "
            string_result += @end_angle.to_s
            string_result += ", "
            string_result += "color: "
            string_result += @color.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Arc
    class Arc
        TAG = 5
    
        # Position of the center
        attr_accessor :position
        # Radius
        attr_accessor :radius
        # Width
        attr_accessor :width
        # Start angle
        attr_accessor :start_angle
        # End angle
        attr_accessor :end_angle
        # Color
        attr_accessor :color
    
        def initialize(position, radius, width, start_angle, end_angle, color)
            @position = position
            @radius = radius
            @width = width
            @start_angle = start_angle
            @end_angle = end_angle
            @color = color
        end
    
        # Read Arc from input stream
        def self.read_from(stream)
            position = Model::Vec2.read_from(stream)
            radius = stream.read_double()
            width = stream.read_double()
            start_angle = stream.read_double()
            end_angle = stream.read_double()
            color = Debugging::Color.read_from(stream)
            Arc.new(position, radius, width, start_angle, end_angle, color)
        end
    
        # Write Arc to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @position.write_to(stream)
            stream.write_double(@radius)
            stream.write_double(@width)
            stream.write_double(@start_angle)
            stream.write_double(@end_angle)
            @color.write_to(stream)
        end
    
        def to_s
            string_result = "Arc { "
            string_result += "position: "
            string_result += @position.to_s
            string_result += ", "
            string_result += "radius: "
            string_result += @radius.to_s
            string_result += ", "
            string_result += "width: "
            string_result += @width.to_s
            string_result += ", "
            string_result += "start_angle: "
            string_result += @start_angle.to_s
            string_result += ", "
            string_result += "end_angle: "
            string_result += @end_angle.to_s
            string_result += ", "
            string_result += "color: "
            string_result += @color.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Rectancle
    class Rect
        TAG = 6
    
        # Bottom left position
        attr_accessor :bottom_left
        # Size
        attr_accessor :size
        # Color
        attr_accessor :color
    
        def initialize(bottom_left, size, color)
            @bottom_left = bottom_left
            @size = size
            @color = color
        end
    
        # Read Rect from input stream
        def self.read_from(stream)
            bottom_left = Model::Vec2.read_from(stream)
            size = Model::Vec2.read_from(stream)
            color = Debugging::Color.read_from(stream)
            Rect.new(bottom_left, size, color)
        end
    
        # Write Rect to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @bottom_left.write_to(stream)
            @size.write_to(stream)
            @color.write_to(stream)
        end
    
        def to_s
            string_result = "Rect { "
            string_result += "bottom_left: "
            string_result += @bottom_left.to_s
            string_result += ", "
            string_result += "size: "
            string_result += @size.to_s
            string_result += ", "
            string_result += "color: "
            string_result += @color.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Polygon (convex)
    class Polygon
        TAG = 7
    
        # Positions of vertices in order
        attr_accessor :vertices
        # Color
        attr_accessor :color
    
        def initialize(vertices, color)
            @vertices = vertices
            @color = color
        end
    
        # Read Polygon from input stream
        def self.read_from(stream)
            vertices = []
            stream.read_int().times do |_|
                vertices_element = Model::Vec2.read_from(stream)
                vertices.push(vertices_element)
            end
            color = Debugging::Color.read_from(stream)
            Polygon.new(vertices, color)
        end
    
        # Write Polygon to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_int(@vertices.length())
            @vertices.each do |vertices_element|
                vertices_element.write_to(stream)
            end
            @color.write_to(stream)
        end
    
        def to_s
            string_result = "Polygon { "
            string_result += "vertices: "
            string_result += "[ "
            vertices_index = 0
            @vertices.each do |vertices_element|
                if vertices_index != 0
                    string_result += ", "
                end
                string_result += vertices_element.to_s
                vertices_index += 1
            end
            string_result += " ]"
            string_result += ", "
            string_result += "color: "
            string_result += @color.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Polygon with gradient fill
    class GradientPolygon
        TAG = 8
    
        # List of vertices in order
        attr_accessor :vertices
    
        def initialize(vertices)
            @vertices = vertices
        end
    
        # Read GradientPolygon from input stream
        def self.read_from(stream)
            vertices = []
            stream.read_int().times do |_|
                vertices_element = Debugging::ColoredVertex.read_from(stream)
                vertices.push(vertices_element)
            end
            GradientPolygon.new(vertices)
        end
    
        # Write GradientPolygon to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_int(@vertices.length())
            @vertices.each do |vertices_element|
                vertices_element.write_to(stream)
            end
        end
    
        def to_s
            string_result = "GradientPolygon { "
            string_result += "vertices: "
            string_result += "[ "
            vertices_index = 0
            @vertices.each do |vertices_element|
                if vertices_index != 0
                    string_result += ", "
                end
                string_result += vertices_element.to_s
                vertices_index += 1
            end
            string_result += " ]"
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Segment
    class Segment
        TAG = 9
    
        # Position of the first end
        attr_accessor :first_end
        # Position of the second end
        attr_accessor :second_end
        # Width
        attr_accessor :width
        # Color
        attr_accessor :color
    
        def initialize(first_end, second_end, width, color)
            @first_end = first_end
            @second_end = second_end
            @width = width
            @color = color
        end
    
        # Read Segment from input stream
        def self.read_from(stream)
            first_end = Model::Vec2.read_from(stream)
            second_end = Model::Vec2.read_from(stream)
            width = stream.read_double()
            color = Debugging::Color.read_from(stream)
            Segment.new(first_end, second_end, width, color)
        end
    
        # Write Segment to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @first_end.write_to(stream)
            @second_end.write_to(stream)
            stream.write_double(@width)
            @color.write_to(stream)
        end
    
        def to_s
            string_result = "Segment { "
            string_result += "first_end: "
            string_result += @first_end.to_s
            string_result += ", "
            string_result += "second_end: "
            string_result += @second_end.to_s
            string_result += ", "
            string_result += "width: "
            string_result += @width.to_s
            string_result += ", "
            string_result += "color: "
            string_result += @color.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Segment with gradient fill
    class GradientSegment
        TAG = 10
    
        # Position of the first end
        attr_accessor :first_end
        # Color of the first end
        attr_accessor :first_color
        # Position of the second end
        attr_accessor :second_end
        # Color of the second end
        attr_accessor :second_color
        # Width
        attr_accessor :width
    
        def initialize(first_end, first_color, second_end, second_color, width)
            @first_end = first_end
            @first_color = first_color
            @second_end = second_end
            @second_color = second_color
            @width = width
        end
    
        # Read GradientSegment from input stream
        def self.read_from(stream)
            first_end = Model::Vec2.read_from(stream)
            first_color = Debugging::Color.read_from(stream)
            second_end = Model::Vec2.read_from(stream)
            second_color = Debugging::Color.read_from(stream)
            width = stream.read_double()
            GradientSegment.new(first_end, first_color, second_end, second_color, width)
        end
    
        # Write GradientSegment to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @first_end.write_to(stream)
            @first_color.write_to(stream)
            @second_end.write_to(stream)
            @second_color.write_to(stream)
            stream.write_double(@width)
        end
    
        def to_s
            string_result = "GradientSegment { "
            string_result += "first_end: "
            string_result += @first_end.to_s
            string_result += ", "
            string_result += "first_color: "
            string_result += @first_color.to_s
            string_result += ", "
            string_result += "second_end: "
            string_result += @second_end.to_s
            string_result += ", "
            string_result += "second_color: "
            string_result += @second_color.to_s
            string_result += ", "
            string_result += "width: "
            string_result += @width.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Poly line
    class PolyLine
        TAG = 11
    
        # List of points in order
        attr_accessor :vertices
        # Width
        attr_accessor :width
        # Color
        attr_accessor :color
    
        def initialize(vertices, width, color)
            @vertices = vertices
            @width = width
            @color = color
        end
    
        # Read PolyLine from input stream
        def self.read_from(stream)
            vertices = []
            stream.read_int().times do |_|
                vertices_element = Model::Vec2.read_from(stream)
                vertices.push(vertices_element)
            end
            width = stream.read_double()
            color = Debugging::Color.read_from(stream)
            PolyLine.new(vertices, width, color)
        end
    
        # Write PolyLine to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_int(@vertices.length())
            @vertices.each do |vertices_element|
                vertices_element.write_to(stream)
            end
            stream.write_double(@width)
            @color.write_to(stream)
        end
    
        def to_s
            string_result = "PolyLine { "
            string_result += "vertices: "
            string_result += "[ "
            vertices_index = 0
            @vertices.each do |vertices_element|
                if vertices_index != 0
                    string_result += ", "
                end
                string_result += vertices_element.to_s
                vertices_index += 1
            end
            string_result += " ]"
            string_result += ", "
            string_result += "width: "
            string_result += @width.to_s
            string_result += ", "
            string_result += "color: "
            string_result += @color.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Poly line with gradient fill
    class GradientPolyLine
        TAG = 12
    
        # List of points and colors in order
        attr_accessor :vertices
        # Width
        attr_accessor :width
    
        def initialize(vertices, width)
            @vertices = vertices
            @width = width
        end
    
        # Read GradientPolyLine from input stream
        def self.read_from(stream)
            vertices = []
            stream.read_int().times do |_|
                vertices_element = Debugging::ColoredVertex.read_from(stream)
                vertices.push(vertices_element)
            end
            width = stream.read_double()
            GradientPolyLine.new(vertices, width)
        end
    
        # Write GradientPolyLine to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_int(@vertices.length())
            @vertices.each do |vertices_element|
                vertices_element.write_to(stream)
            end
            stream.write_double(@width)
        end
    
        def to_s
            string_result = "GradientPolyLine { "
            string_result += "vertices: "
            string_result += "[ "
            vertices_index = 0
            @vertices.each do |vertices_element|
                if vertices_index != 0
                    string_result += ", "
                end
                string_result += vertices_element.to_s
                vertices_index += 1
            end
            string_result += " ]"
            string_result += ", "
            string_result += "width: "
            string_result += @width.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
end

end