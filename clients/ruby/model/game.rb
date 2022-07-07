require './model/loot'
require './model/player'
require './model/projectile'
require './model/sound'
require './model/unit'
require './model/zone'

module Model

# Current game's state
class Game
    # Your player's id
    attr_accessor :my_id
    # List of players (teams)
    attr_accessor :players
    # Current tick
    attr_accessor :current_tick
    # List of units visible by your team
    attr_accessor :units
    # List of loot visible by your team
    attr_accessor :loot
    # List of projectiles visible by your team
    attr_accessor :projectiles
    # Current state of game zone
    attr_accessor :zone
    # List of sounds heard by your team during last tick
    attr_accessor :sounds

    def initialize(my_id, players, current_tick, units, loot, projectiles, zone, sounds)
        @my_id = my_id
        @players = players
        @current_tick = current_tick
        @units = units
        @loot = loot
        @projectiles = projectiles
        @zone = zone
        @sounds = sounds
    end

    # Read Game from input stream
    def self.read_from(stream)
        my_id = stream.read_int()
        players = []
        stream.read_int().times do |_|
            players_element = Model::Player.read_from(stream)
            players.push(players_element)
        end
        current_tick = stream.read_int()
        units = []
        stream.read_int().times do |_|
            units_element = Model::Unit.read_from(stream)
            units.push(units_element)
        end
        loot = []
        stream.read_int().times do |_|
            loot_element = Model::Loot.read_from(stream)
            loot.push(loot_element)
        end
        projectiles = []
        stream.read_int().times do |_|
            projectiles_element = Model::Projectile.read_from(stream)
            projectiles.push(projectiles_element)
        end
        zone = Model::Zone.read_from(stream)
        sounds = []
        stream.read_int().times do |_|
            sounds_element = Model::Sound.read_from(stream)
            sounds.push(sounds_element)
        end
        Game.new(my_id, players, current_tick, units, loot, projectiles, zone, sounds)
    end

    # Write Game to output stream
    def write_to(stream)
        stream.write_int(@my_id)
        stream.write_int(@players.length())
        @players.each do |players_element|
            players_element.write_to(stream)
        end
        stream.write_int(@current_tick)
        stream.write_int(@units.length())
        @units.each do |units_element|
            units_element.write_to(stream)
        end
        stream.write_int(@loot.length())
        @loot.each do |loot_element|
            loot_element.write_to(stream)
        end
        stream.write_int(@projectiles.length())
        @projectiles.each do |projectiles_element|
            projectiles_element.write_to(stream)
        end
        @zone.write_to(stream)
        stream.write_int(@sounds.length())
        @sounds.each do |sounds_element|
            sounds_element.write_to(stream)
        end
    end

    def to_s
        string_result = "Game { "
        string_result += "my_id: "
        string_result += @my_id.to_s
        string_result += ", "
        string_result += "players: "
        string_result += "[ "
        players_index = 0
        @players.each do |players_element|
            if players_index != 0
                string_result += ", "
            end
            string_result += players_element.to_s
            players_index += 1
        end
        string_result += " ]"
        string_result += ", "
        string_result += "current_tick: "
        string_result += @current_tick.to_s
        string_result += ", "
        string_result += "units: "
        string_result += "[ "
        units_index = 0
        @units.each do |units_element|
            if units_index != 0
                string_result += ", "
            end
            string_result += units_element.to_s
            units_index += 1
        end
        string_result += " ]"
        string_result += ", "
        string_result += "loot: "
        string_result += "[ "
        loot_index = 0
        @loot.each do |loot_element|
            if loot_index != 0
                string_result += ", "
            end
            string_result += loot_element.to_s
            loot_index += 1
        end
        string_result += " ]"
        string_result += ", "
        string_result += "projectiles: "
        string_result += "[ "
        projectiles_index = 0
        @projectiles.each do |projectiles_element|
            if projectiles_index != 0
                string_result += ", "
            end
            string_result += projectiles_element.to_s
            projectiles_index += 1
        end
        string_result += " ]"
        string_result += ", "
        string_result += "zone: "
        string_result += @zone.to_s
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
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end