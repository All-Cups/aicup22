require './debugging/color'
require './model/vec2'

module Debugging

# Point + color
class ColoredVertex
    # Position
    attr_accessor :position
    # Color
    attr_accessor :color

    def initialize(position, color)
        @position = position
        @color = color
    end

    # Read ColoredVertex from input stream
    def self.read_from(stream)
        position = Model::Vec2.read_from(stream)
        color = Debugging::Color.read_from(stream)
        ColoredVertex.new(position, color)
    end

    # Write ColoredVertex to output stream
    def write_to(stream)
        @position.write_to(stream)
        @color.write_to(stream)
    end

    def to_s
        string_result = "ColoredVertex { "
        string_result += "position: "
        string_result += @position.to_s
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

end