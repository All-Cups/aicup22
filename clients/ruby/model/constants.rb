require './model/obstacle'
require './model/sound_properties'
require './model/weapon_properties'

module Model

# Non changing game state
class Constants
    # Number of ticks per game second
    attr_accessor :ticks_per_second
    # Starting number of units in each team
    attr_accessor :team_size
    # Initial zone radius
    attr_accessor :initial_zone_radius
    # Speed of zone radius
    attr_accessor :zone_speed
    # Damage dealt to units outside of the zone per second
    attr_accessor :zone_damage_per_second
    # Unit spawning time
    attr_accessor :spawn_time
    # Damage dealt to units trying to spawn in incorrect position per second
    attr_accessor :spawn_collision_damage_per_second
    # Time required to perform looting actions (in seconds)
    attr_accessor :looting_time
    # Number of bot players (teams)
    attr_accessor :bot_players
    # Units' radius
    attr_accessor :unit_radius
    # Max units' health
    attr_accessor :unit_health
    # Health automatically restored per second
    attr_accessor :health_regeneration_per_second
    # Time until automatic health regeneration since last health damage (in seconds)
    attr_accessor :health_regeneration_delay
    # Max value of unit's shield
    attr_accessor :max_shield
    # Initial value of unit's shield
    attr_accessor :spawn_shield
    # Initial number of extra lives for units
    attr_accessor :extra_lives
    # Zone radius after which respawning is disabled
    attr_accessor :last_respawn_zone_radius
    # Units' field of view without aiming (in degrees)
    attr_accessor :field_of_view
    # Units' view distance
    attr_accessor :view_distance
    # Whether units' view is blocked by obstacles
    attr_accessor :view_blocking
    # Unit rotation speed without aiming (degrees per second)
    attr_accessor :rotation_speed
    # Units' movement speed while spawning
    attr_accessor :spawn_movement_speed
    # Max unit speed when walking forward
    attr_accessor :max_unit_forward_speed
    # Max unit speed when walking backward
    attr_accessor :max_unit_backward_speed
    # Max unit acceleration
    attr_accessor :unit_acceleration
    # Whether a unit can damage units of the same team
    attr_accessor :friendly_fire
    # Score given for killing enemy unit
    attr_accessor :kill_score
    # Score multiplier for damaging enemy units
    attr_accessor :damage_score_multiplier
    # Score given for every team killed before you
    attr_accessor :score_per_place
    # List of properties of every weapon type
    attr_accessor :weapons
    # Starting weapon with which units spawn, or None
    attr_accessor :starting_weapon
    # Ammo for starting weapon given when unit spawns
    attr_accessor :starting_weapon_ammo
    # Max number of shield potions in unit's inventory
    attr_accessor :max_shield_potions_in_inventory
    # Amount of shield restored using one potion
    attr_accessor :shield_per_potion
    # Time required to perform action of using shield potion
    attr_accessor :shield_potion_use_time
    # List of properties of every sound type
    attr_accessor :sounds
    # Sound type index when moving (starting with 0), or None
    attr_accessor :steps_sound_type_index
    # Distance when steps sound will be 100% probability
    attr_accessor :steps_sound_travel_distance
    # List of obstacles on the map
    attr_accessor :obstacles

    def initialize(ticks_per_second, team_size, initial_zone_radius, zone_speed, zone_damage_per_second, spawn_time, spawn_collision_damage_per_second, looting_time, bot_players, unit_radius, unit_health, health_regeneration_per_second, health_regeneration_delay, max_shield, spawn_shield, extra_lives, last_respawn_zone_radius, field_of_view, view_distance, view_blocking, rotation_speed, spawn_movement_speed, max_unit_forward_speed, max_unit_backward_speed, unit_acceleration, friendly_fire, kill_score, damage_score_multiplier, score_per_place, weapons, starting_weapon, starting_weapon_ammo, max_shield_potions_in_inventory, shield_per_potion, shield_potion_use_time, sounds, steps_sound_type_index, steps_sound_travel_distance, obstacles)
        @ticks_per_second = ticks_per_second
        @team_size = team_size
        @initial_zone_radius = initial_zone_radius
        @zone_speed = zone_speed
        @zone_damage_per_second = zone_damage_per_second
        @spawn_time = spawn_time
        @spawn_collision_damage_per_second = spawn_collision_damage_per_second
        @looting_time = looting_time
        @bot_players = bot_players
        @unit_radius = unit_radius
        @unit_health = unit_health
        @health_regeneration_per_second = health_regeneration_per_second
        @health_regeneration_delay = health_regeneration_delay
        @max_shield = max_shield
        @spawn_shield = spawn_shield
        @extra_lives = extra_lives
        @last_respawn_zone_radius = last_respawn_zone_radius
        @field_of_view = field_of_view
        @view_distance = view_distance
        @view_blocking = view_blocking
        @rotation_speed = rotation_speed
        @spawn_movement_speed = spawn_movement_speed
        @max_unit_forward_speed = max_unit_forward_speed
        @max_unit_backward_speed = max_unit_backward_speed
        @unit_acceleration = unit_acceleration
        @friendly_fire = friendly_fire
        @kill_score = kill_score
        @damage_score_multiplier = damage_score_multiplier
        @score_per_place = score_per_place
        @weapons = weapons
        @starting_weapon = starting_weapon
        @starting_weapon_ammo = starting_weapon_ammo
        @max_shield_potions_in_inventory = max_shield_potions_in_inventory
        @shield_per_potion = shield_per_potion
        @shield_potion_use_time = shield_potion_use_time
        @sounds = sounds
        @steps_sound_type_index = steps_sound_type_index
        @steps_sound_travel_distance = steps_sound_travel_distance
        @obstacles = obstacles
    end

    # Read Constants from input stream
    def self.read_from(stream)
        ticks_per_second = stream.read_double()
        team_size = stream.read_int()
        initial_zone_radius = stream.read_double()
        zone_speed = stream.read_double()
        zone_damage_per_second = stream.read_double()
        spawn_time = stream.read_double()
        spawn_collision_damage_per_second = stream.read_double()
        looting_time = stream.read_double()
        bot_players = stream.read_int()
        unit_radius = stream.read_double()
        unit_health = stream.read_double()
        health_regeneration_per_second = stream.read_double()
        health_regeneration_delay = stream.read_double()
        max_shield = stream.read_double()
        spawn_shield = stream.read_double()
        extra_lives = stream.read_int()
        last_respawn_zone_radius = stream.read_double()
        field_of_view = stream.read_double()
        view_distance = stream.read_double()
        view_blocking = stream.read_bool()
        rotation_speed = stream.read_double()
        spawn_movement_speed = stream.read_double()
        max_unit_forward_speed = stream.read_double()
        max_unit_backward_speed = stream.read_double()
        unit_acceleration = stream.read_double()
        friendly_fire = stream.read_bool()
        kill_score = stream.read_double()
        damage_score_multiplier = stream.read_double()
        score_per_place = stream.read_double()
        weapons = []
        stream.read_int().times do |_|
            weapons_element = Model::WeaponProperties.read_from(stream)
            weapons.push(weapons_element)
        end
        if stream.read_bool()
            starting_weapon = stream.read_int()
        else
            starting_weapon = nil
        end
        starting_weapon_ammo = stream.read_int()
        max_shield_potions_in_inventory = stream.read_int()
        shield_per_potion = stream.read_double()
        shield_potion_use_time = stream.read_double()
        sounds = []
        stream.read_int().times do |_|
            sounds_element = Model::SoundProperties.read_from(stream)
            sounds.push(sounds_element)
        end
        if stream.read_bool()
            steps_sound_type_index = stream.read_int()
        else
            steps_sound_type_index = nil
        end
        steps_sound_travel_distance = stream.read_double()
        obstacles = []
        stream.read_int().times do |_|
            obstacles_element = Model::Obstacle.read_from(stream)
            obstacles.push(obstacles_element)
        end
        Constants.new(ticks_per_second, team_size, initial_zone_radius, zone_speed, zone_damage_per_second, spawn_time, spawn_collision_damage_per_second, looting_time, bot_players, unit_radius, unit_health, health_regeneration_per_second, health_regeneration_delay, max_shield, spawn_shield, extra_lives, last_respawn_zone_radius, field_of_view, view_distance, view_blocking, rotation_speed, spawn_movement_speed, max_unit_forward_speed, max_unit_backward_speed, unit_acceleration, friendly_fire, kill_score, damage_score_multiplier, score_per_place, weapons, starting_weapon, starting_weapon_ammo, max_shield_potions_in_inventory, shield_per_potion, shield_potion_use_time, sounds, steps_sound_type_index, steps_sound_travel_distance, obstacles)
    end

    # Write Constants to output stream
    def write_to(stream)
        stream.write_double(@ticks_per_second)
        stream.write_int(@team_size)
        stream.write_double(@initial_zone_radius)
        stream.write_double(@zone_speed)
        stream.write_double(@zone_damage_per_second)
        stream.write_double(@spawn_time)
        stream.write_double(@spawn_collision_damage_per_second)
        stream.write_double(@looting_time)
        stream.write_int(@bot_players)
        stream.write_double(@unit_radius)
        stream.write_double(@unit_health)
        stream.write_double(@health_regeneration_per_second)
        stream.write_double(@health_regeneration_delay)
        stream.write_double(@max_shield)
        stream.write_double(@spawn_shield)
        stream.write_int(@extra_lives)
        stream.write_double(@last_respawn_zone_radius)
        stream.write_double(@field_of_view)
        stream.write_double(@view_distance)
        stream.write_bool(@view_blocking)
        stream.write_double(@rotation_speed)
        stream.write_double(@spawn_movement_speed)
        stream.write_double(@max_unit_forward_speed)
        stream.write_double(@max_unit_backward_speed)
        stream.write_double(@unit_acceleration)
        stream.write_bool(@friendly_fire)
        stream.write_double(@kill_score)
        stream.write_double(@damage_score_multiplier)
        stream.write_double(@score_per_place)
        stream.write_int(@weapons.length())
        @weapons.each do |weapons_element|
            weapons_element.write_to(stream)
        end
        if @starting_weapon.nil?
            stream.write_bool(false)
        else
            stream.write_bool(true)
            stream.write_int(@starting_weapon)
        end
        stream.write_int(@starting_weapon_ammo)
        stream.write_int(@max_shield_potions_in_inventory)
        stream.write_double(@shield_per_potion)
        stream.write_double(@shield_potion_use_time)
        stream.write_int(@sounds.length())
        @sounds.each do |sounds_element|
            sounds_element.write_to(stream)
        end
        if @steps_sound_type_index.nil?
            stream.write_bool(false)
        else
            stream.write_bool(true)
            stream.write_int(@steps_sound_type_index)
        end
        stream.write_double(@steps_sound_travel_distance)
        stream.write_int(@obstacles.length())
        @obstacles.each do |obstacles_element|
            obstacles_element.write_to(stream)
        end
    end

    def to_s
        string_result = "Constants { "
        string_result += "ticks_per_second: "
        string_result += @ticks_per_second.to_s
        string_result += ", "
        string_result += "team_size: "
        string_result += @team_size.to_s
        string_result += ", "
        string_result += "initial_zone_radius: "
        string_result += @initial_zone_radius.to_s
        string_result += ", "
        string_result += "zone_speed: "
        string_result += @zone_speed.to_s
        string_result += ", "
        string_result += "zone_damage_per_second: "
        string_result += @zone_damage_per_second.to_s
        string_result += ", "
        string_result += "spawn_time: "
        string_result += @spawn_time.to_s
        string_result += ", "
        string_result += "spawn_collision_damage_per_second: "
        string_result += @spawn_collision_damage_per_second.to_s
        string_result += ", "
        string_result += "looting_time: "
        string_result += @looting_time.to_s
        string_result += ", "
        string_result += "bot_players: "
        string_result += @bot_players.to_s
        string_result += ", "
        string_result += "unit_radius: "
        string_result += @unit_radius.to_s
        string_result += ", "
        string_result += "unit_health: "
        string_result += @unit_health.to_s
        string_result += ", "
        string_result += "health_regeneration_per_second: "
        string_result += @health_regeneration_per_second.to_s
        string_result += ", "
        string_result += "health_regeneration_delay: "
        string_result += @health_regeneration_delay.to_s
        string_result += ", "
        string_result += "max_shield: "
        string_result += @max_shield.to_s
        string_result += ", "
        string_result += "spawn_shield: "
        string_result += @spawn_shield.to_s
        string_result += ", "
        string_result += "extra_lives: "
        string_result += @extra_lives.to_s
        string_result += ", "
        string_result += "last_respawn_zone_radius: "
        string_result += @last_respawn_zone_radius.to_s
        string_result += ", "
        string_result += "field_of_view: "
        string_result += @field_of_view.to_s
        string_result += ", "
        string_result += "view_distance: "
        string_result += @view_distance.to_s
        string_result += ", "
        string_result += "view_blocking: "
        string_result += @view_blocking.to_s
        string_result += ", "
        string_result += "rotation_speed: "
        string_result += @rotation_speed.to_s
        string_result += ", "
        string_result += "spawn_movement_speed: "
        string_result += @spawn_movement_speed.to_s
        string_result += ", "
        string_result += "max_unit_forward_speed: "
        string_result += @max_unit_forward_speed.to_s
        string_result += ", "
        string_result += "max_unit_backward_speed: "
        string_result += @max_unit_backward_speed.to_s
        string_result += ", "
        string_result += "unit_acceleration: "
        string_result += @unit_acceleration.to_s
        string_result += ", "
        string_result += "friendly_fire: "
        string_result += @friendly_fire.to_s
        string_result += ", "
        string_result += "kill_score: "
        string_result += @kill_score.to_s
        string_result += ", "
        string_result += "damage_score_multiplier: "
        string_result += @damage_score_multiplier.to_s
        string_result += ", "
        string_result += "score_per_place: "
        string_result += @score_per_place.to_s
        string_result += ", "
        string_result += "weapons: "
        string_result += "[ "
        weapons_index = 0
        @weapons.each do |weapons_element|
            if weapons_index != 0
                string_result += ", "
            end
            string_result += weapons_element.to_s
            weapons_index += 1
        end
        string_result += " ]"
        string_result += ", "
        string_result += "starting_weapon: "
        if @starting_weapon.nil?
            string_result += "nil"
        else
            string_result += @starting_weapon.to_s
        end
        string_result += ", "
        string_result += "starting_weapon_ammo: "
        string_result += @starting_weapon_ammo.to_s
        string_result += ", "
        string_result += "max_shield_potions_in_inventory: "
        string_result += @max_shield_potions_in_inventory.to_s
        string_result += ", "
        string_result += "shield_per_potion: "
        string_result += @shield_per_potion.to_s
        string_result += ", "
        string_result += "shield_potion_use_time: "
        string_result += @shield_potion_use_time.to_s
        string_result += ", "
        string_result += "sounds: "
        string_result += "[ "
        sounds_index = 0
        @sounds.each do |sounds_element|
            if sounds_index != 0
                string_result += ", "
            end
            string_result += sounds_element.to_s
            sounds_index += 1
        end
        string_result += " ]"
        string_result += ", "
        string_result += "steps_sound_type_index: "
        if @steps_sound_type_index.nil?
            string_result += "nil"
        else
            string_result += @steps_sound_type_index.to_s
        end
        string_result += ", "
        string_result += "steps_sound_travel_distance: "
        string_result += @steps_sound_travel_distance.to_s
        string_result += ", "
        string_result += "obstacles: "
        string_result += "[ "
        obstacles_index = 0
        @obstacles.each do |obstacles_element|
            if obstacles_index != 0
                string_result += ", "
            end
            string_result += obstacles_element.to_s
            obstacles_index += 1
        end
        string_result += " ]"
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end