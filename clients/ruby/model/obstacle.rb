require './model/vec2'

module Model

# An obstacle on the map
class Obstacle
    # Unique id
    attr_accessor :id
    # Center position
    attr_accessor :position
    # Obstacle's radius
    attr_accessor :radius
    # Whether units can see through this obstacle, or it blocks the view
    attr_accessor :can_see_through
    # Whether projectiles can go through this obstacle
    attr_accessor :can_shoot_through

    def initialize(id, position, radius, can_see_through, can_shoot_through)
        @id = id
        @position = position
        @radius = radius
        @can_see_through = can_see_through
        @can_shoot_through = can_shoot_through
    end

    # Read Obstacle from input stream
    def self.read_from(stream)
        id = stream.read_int()
        position = Model::Vec2.read_from(stream)
        radius = stream.read_double()
        can_see_through = stream.read_bool()
        can_shoot_through = stream.read_bool()
        Obstacle.new(id, position, radius, can_see_through, can_shoot_through)
    end

    # Write Obstacle to output stream
    def write_to(stream)
        stream.write_int(@id)
        @position.write_to(stream)
        stream.write_double(@radius)
        stream.write_bool(@can_see_through)
        stream.write_bool(@can_shoot_through)
    end

    def to_s
        string_result = "Obstacle { "
        string_result += "id: "
        string_result += @id.to_s
        string_result += ", "
        string_result += "position: "
        string_result += @position.to_s
        string_result += ", "
        string_result += "radius: "
        string_result += @radius.to_s
        string_result += ", "
        string_result += "can_see_through: "
        string_result += @can_see_through.to_s
        string_result += ", "
        string_result += "can_shoot_through: "
        string_result += @can_shoot_through.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end