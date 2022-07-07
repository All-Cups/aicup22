module Model

# Sound properties
class SoundProperties
    # Name
    attr_accessor :name
    # Distance from which the sound can be heard
    attr_accessor :distance
    # Offset modifier
    attr_accessor :offset

    def initialize(name, distance, offset)
        @name = name
        @distance = distance
        @offset = offset
    end

    # Read SoundProperties from input stream
    def self.read_from(stream)
        name = stream.read_string()
        distance = stream.read_double()
        offset = stream.read_double()
        SoundProperties.new(name, distance, offset)
    end

    # Write SoundProperties to output stream
    def write_to(stream)
        stream.write_string(@name)
        stream.write_double(@distance)
        stream.write_double(@offset)
    end

    def to_s
        string_result = "SoundProperties { "
        string_result += "name: "
        string_result += @name.dump
        string_result += ", "
        string_result += "distance: "
        string_result += @distance.to_s
        string_result += ", "
        string_result += "offset: "
        string_result += @offset.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end