module Model

# 2 dimensional vector.
class Vec2
    # `x` coordinate of the vector
    attr_accessor :x
    # `y` coordinate of the vector
    attr_accessor :y

    def initialize(x, y)
        @x = x
        @y = y
    end

    # Read Vec2 from input stream
    def self.read_from(stream)
        x = stream.read_double()
        y = stream.read_double()
        Vec2.new(x, y)
    end

    # Write Vec2 to output stream
    def write_to(stream)
        stream.write_double(@x)
        stream.write_double(@y)
    end

    def to_s
        string_result = "Vec2 { "
        string_result += "x: "
        string_result += @x.to_s
        string_result += ", "
        string_result += "y: "
        string_result += @y.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end