require './model/vec2'

module Model

# Current state of the game zone
class Zone
    # Current center
    attr_accessor :current_center
    # Current radius
    attr_accessor :current_radius
    # Next center
    attr_accessor :next_center
    # Next radius
    attr_accessor :next_radius

    def initialize(current_center, current_radius, next_center, next_radius)
        @current_center = current_center
        @current_radius = current_radius
        @next_center = next_center
        @next_radius = next_radius
    end

    # Read Zone from input stream
    def self.read_from(stream)
        current_center = Model::Vec2.read_from(stream)
        current_radius = stream.read_double()
        next_center = Model::Vec2.read_from(stream)
        next_radius = stream.read_double()
        Zone.new(current_center, current_radius, next_center, next_radius)
    end

    # Write Zone to output stream
    def write_to(stream)
        @current_center.write_to(stream)
        stream.write_double(@current_radius)
        @next_center.write_to(stream)
        stream.write_double(@next_radius)
    end

    def to_s
        string_result = "Zone { "
        string_result += "current_center: "
        string_result += @current_center.to_s
        string_result += ", "
        string_result += "current_radius: "
        string_result += @current_radius.to_s
        string_result += ", "
        string_result += "next_center: "
        string_result += @next_center.to_s
        string_result += ", "
        string_result += "next_radius: "
        string_result += @next_radius.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end