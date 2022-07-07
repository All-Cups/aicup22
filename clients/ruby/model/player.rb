module Model

# Game's participant (team of units)
class Player
    # Unique id
    attr_accessor :id
    # Number of kills
    attr_accessor :kills
    # Total damage dealt to enemies
    attr_accessor :damage
    # Survival place (number of survivor teams currently/at the moment of death)
    attr_accessor :place
    # Team score
    attr_accessor :score

    def initialize(id, kills, damage, place, score)
        @id = id
        @kills = kills
        @damage = damage
        @place = place
        @score = score
    end

    # Read Player from input stream
    def self.read_from(stream)
        id = stream.read_int()
        kills = stream.read_int()
        damage = stream.read_double()
        place = stream.read_int()
        score = stream.read_double()
        Player.new(id, kills, damage, place, score)
    end

    # Write Player to output stream
    def write_to(stream)
        stream.write_int(@id)
        stream.write_int(@kills)
        stream.write_double(@damage)
        stream.write_int(@place)
        stream.write_double(@score)
    end

    def to_s
        string_result = "Player { "
        string_result += "id: "
        string_result += @id.to_s
        string_result += ", "
        string_result += "kills: "
        string_result += @kills.to_s
        string_result += ", "
        string_result += "damage: "
        string_result += @damage.to_s
        string_result += ", "
        string_result += "place: "
        string_result += @place.to_s
        string_result += ", "
        string_result += "score: "
        string_result += @score.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end