require './model/vec2'

module Model

# Sound heard by one of your units
class Sound
    # Sound type index (starting with 0)
    attr_accessor :type_index
    # Id of unit that heard this sound
    attr_accessor :unit_id
    # Position where sound was heard (different from sound source position)
    attr_accessor :position

    def initialize(type_index, unit_id, position)
        @type_index = type_index
        @unit_id = unit_id
        @position = position
    end

    # Read Sound from input stream
    def self.read_from(stream)
        type_index = stream.read_int()
        unit_id = stream.read_int()
        position = Model::Vec2.read_from(stream)
        Sound.new(type_index, unit_id, position)
    end

    # Write Sound to output stream
    def write_to(stream)
        stream.write_int(@type_index)
        stream.write_int(@unit_id)
        @position.write_to(stream)
    end

    def to_s
        string_result = "Sound { "
        string_result += "type_index: "
        string_result += @type_index.to_s
        string_result += ", "
        string_result += "unit_id: "
        string_result += @unit_id.to_s
        string_result += ", "
        string_result += "position: "
        string_result += @position.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end