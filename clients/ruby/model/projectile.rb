require './model/vec2'

module Model

# Weapon projectile
class Projectile
    # Unique id
    attr_accessor :id
    # Index of the weapon this projectile was shot from (starts with 0)
    attr_accessor :weapon_type_index
    # Id of unit who made the shot
    attr_accessor :shooter_id
    # Id of player (team), whose unit made the shot
    attr_accessor :shooter_player_id
    # Current position
    attr_accessor :position
    # Projectile's velocity
    attr_accessor :velocity
    # Left time of projectile's life
    attr_accessor :life_time

    def initialize(id, weapon_type_index, shooter_id, shooter_player_id, position, velocity, life_time)
        @id = id
        @weapon_type_index = weapon_type_index
        @shooter_id = shooter_id
        @shooter_player_id = shooter_player_id
        @position = position
        @velocity = velocity
        @life_time = life_time
    end

    # Read Projectile from input stream
    def self.read_from(stream)
        id = stream.read_int()
        weapon_type_index = stream.read_int()
        shooter_id = stream.read_int()
        shooter_player_id = stream.read_int()
        position = Model::Vec2.read_from(stream)
        velocity = Model::Vec2.read_from(stream)
        life_time = stream.read_double()
        Projectile.new(id, weapon_type_index, shooter_id, shooter_player_id, position, velocity, life_time)
    end

    # Write Projectile to output stream
    def write_to(stream)
        stream.write_int(@id)
        stream.write_int(@weapon_type_index)
        stream.write_int(@shooter_id)
        stream.write_int(@shooter_player_id)
        @position.write_to(stream)
        @velocity.write_to(stream)
        stream.write_double(@life_time)
    end

    def to_s
        string_result = "Projectile { "
        string_result += "id: "
        string_result += @id.to_s
        string_result += ", "
        string_result += "weapon_type_index: "
        string_result += @weapon_type_index.to_s
        string_result += ", "
        string_result += "shooter_id: "
        string_result += @shooter_id.to_s
        string_result += ", "
        string_result += "shooter_player_id: "
        string_result += @shooter_player_id.to_s
        string_result += ", "
        string_result += "position: "
        string_result += @position.to_s
        string_result += ", "
        string_result += "velocity: "
        string_result += @velocity.to_s
        string_result += ", "
        string_result += "life_time: "
        string_result += @life_time.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end