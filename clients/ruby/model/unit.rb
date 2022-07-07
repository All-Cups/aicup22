require './model/action'
require './model/vec2'

module Model

# A unit
class Unit
    # Unique id
    attr_accessor :id
    # Id of the player (team) controlling the unit
    attr_accessor :player_id
    # Current health
    attr_accessor :health
    # Current shield value
    attr_accessor :shield
    # Left extra lives of this unit
    attr_accessor :extra_lives
    # Current position of unit's center
    attr_accessor :position
    # Remaining time until unit will be spawned, or None
    attr_accessor :remaining_spawn_time
    # Current velocity
    attr_accessor :velocity
    # Current view direction (vector of length 1)
    attr_accessor :direction
    # Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
    attr_accessor :aim
    # Current action unit is performing, or None
    attr_accessor :action
    # Tick when health regeneration will start (can be less than current game tick)
    attr_accessor :health_regeneration_start_tick
    # Index of the weapon this unit is holding (starting with 0), or None
    attr_accessor :weapon
    # Next tick when unit can shoot again (can be less than current game tick)
    attr_accessor :next_shot_tick
    # List of ammo in unit's inventory for every weapon type
    attr_accessor :ammo
    # Number of shield potions in inventory
    attr_accessor :shield_potions

    def initialize(id, player_id, health, shield, extra_lives, position, remaining_spawn_time, velocity, direction, aim, action, health_regeneration_start_tick, weapon, next_shot_tick, ammo, shield_potions)
        @id = id
        @player_id = player_id
        @health = health
        @shield = shield
        @extra_lives = extra_lives
        @position = position
        @remaining_spawn_time = remaining_spawn_time
        @velocity = velocity
        @direction = direction
        @aim = aim
        @action = action
        @health_regeneration_start_tick = health_regeneration_start_tick
        @weapon = weapon
        @next_shot_tick = next_shot_tick
        @ammo = ammo
        @shield_potions = shield_potions
    end

    # Read Unit from input stream
    def self.read_from(stream)
        id = stream.read_int()
        player_id = stream.read_int()
        health = stream.read_double()
        shield = stream.read_double()
        extra_lives = stream.read_int()
        position = Model::Vec2.read_from(stream)
        if stream.read_bool()
            remaining_spawn_time = stream.read_double()
        else
            remaining_spawn_time = nil
        end
        velocity = Model::Vec2.read_from(stream)
        direction = Model::Vec2.read_from(stream)
        aim = stream.read_double()
        if stream.read_bool()
            action = Model::Action.read_from(stream)
        else
            action = nil
        end
        health_regeneration_start_tick = stream.read_int()
        if stream.read_bool()
            weapon = stream.read_int()
        else
            weapon = nil
        end
        next_shot_tick = stream.read_int()
        ammo = []
        stream.read_int().times do |_|
            ammo_element = stream.read_int()
            ammo.push(ammo_element)
        end
        shield_potions = stream.read_int()
        Unit.new(id, player_id, health, shield, extra_lives, position, remaining_spawn_time, velocity, direction, aim, action, health_regeneration_start_tick, weapon, next_shot_tick, ammo, shield_potions)
    end

    # Write Unit to output stream
    def write_to(stream)
        stream.write_int(@id)
        stream.write_int(@player_id)
        stream.write_double(@health)
        stream.write_double(@shield)
        stream.write_int(@extra_lives)
        @position.write_to(stream)
        if @remaining_spawn_time.nil?
            stream.write_bool(false)
        else
            stream.write_bool(true)
            stream.write_double(@remaining_spawn_time)
        end
        @velocity.write_to(stream)
        @direction.write_to(stream)
        stream.write_double(@aim)
        if @action.nil?
            stream.write_bool(false)
        else
            stream.write_bool(true)
            @action.write_to(stream)
        end
        stream.write_int(@health_regeneration_start_tick)
        if @weapon.nil?
            stream.write_bool(false)
        else
            stream.write_bool(true)
            stream.write_int(@weapon)
        end
        stream.write_int(@next_shot_tick)
        stream.write_int(@ammo.length())
        @ammo.each do |ammo_element|
            stream.write_int(ammo_element)
        end
        stream.write_int(@shield_potions)
    end

    def to_s
        string_result = "Unit { "
        string_result += "id: "
        string_result += @id.to_s
        string_result += ", "
        string_result += "player_id: "
        string_result += @player_id.to_s
        string_result += ", "
        string_result += "health: "
        string_result += @health.to_s
        string_result += ", "
        string_result += "shield: "
        string_result += @shield.to_s
        string_result += ", "
        string_result += "extra_lives: "
        string_result += @extra_lives.to_s
        string_result += ", "
        string_result += "position: "
        string_result += @position.to_s
        string_result += ", "
        string_result += "remaining_spawn_time: "
        if @remaining_spawn_time.nil?
            string_result += "nil"
        else
            string_result += @remaining_spawn_time.to_s
        end
        string_result += ", "
        string_result += "velocity: "
        string_result += @velocity.to_s
        string_result += ", "
        string_result += "direction: "
        string_result += @direction.to_s
        string_result += ", "
        string_result += "aim: "
        string_result += @aim.to_s
        string_result += ", "
        string_result += "action: "
        if @action.nil?
            string_result += "nil"
        else
            string_result += @action.to_s
        end
        string_result += ", "
        string_result += "health_regeneration_start_tick: "
        string_result += @health_regeneration_start_tick.to_s
        string_result += ", "
        string_result += "weapon: "
        if @weapon.nil?
            string_result += "nil"
        else
            string_result += @weapon.to_s
        end
        string_result += ", "
        string_result += "next_shot_tick: "
        string_result += @next_shot_tick.to_s
        string_result += ", "
        string_result += "ammo: "
        string_result += "[ "
        ammo_index = 0
        @ammo.each do |ammo_element|
            if ammo_index != 0
                string_result += ", "
            end
            string_result += ammo_element.to_s
            ammo_index += 1
        end
        string_result += " ]"
        string_result += ", "
        string_result += "shield_potions: "
        string_result += @shield_potions.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end