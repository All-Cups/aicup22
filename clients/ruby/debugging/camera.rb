require './model/vec2'

module Debugging

# Camera state
class Camera
    # Center
    attr_accessor :center
    # Rotation
    attr_accessor :rotation
    # Attack angle
    attr_accessor :attack
    # Vertical field of view
    attr_accessor :fov

    def initialize(center, rotation, attack, fov)
        @center = center
        @rotation = rotation
        @attack = attack
        @fov = fov
    end

    # Read Camera from input stream
    def self.read_from(stream)
        center = Model::Vec2.read_from(stream)
        rotation = stream.read_double()
        attack = stream.read_double()
        fov = stream.read_double()
        Camera.new(center, rotation, attack, fov)
    end

    # Write Camera to output stream
    def write_to(stream)
        @center.write_to(stream)
        stream.write_double(@rotation)
        stream.write_double(@attack)
        stream.write_double(@fov)
    end

    def to_s
        string_result = "Camera { "
        string_result += "center: "
        string_result += @center.to_s
        string_result += ", "
        string_result += "rotation: "
        string_result += @rotation.to_s
        string_result += ", "
        string_result += "attack: "
        string_result += @attack.to_s
        string_result += ", "
        string_result += "fov: "
        string_result += @fov.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end