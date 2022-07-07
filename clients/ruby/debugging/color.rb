module Debugging

# RGBA Color
class Color
    # Red component
    attr_accessor :r
    # Green component
    attr_accessor :g
    # Blue component
    attr_accessor :b
    # Alpha (opacity) component
    attr_accessor :a

    def initialize(r, g, b, a)
        @r = r
        @g = g
        @b = b
        @a = a
    end

    # Read Color from input stream
    def self.read_from(stream)
        r = stream.read_double()
        g = stream.read_double()
        b = stream.read_double()
        a = stream.read_double()
        Color.new(r, g, b, a)
    end

    # Write Color to output stream
    def write_to(stream)
        stream.write_double(@r)
        stream.write_double(@g)
        stream.write_double(@b)
        stream.write_double(@a)
    end

    def to_s
        string_result = "Color { "
        string_result += "r: "
        string_result += @r.to_s
        string_result += ", "
        string_result += "g: "
        string_result += @g.to_s
        string_result += ", "
        string_result += "b: "
        string_result += @b.to_s
        string_result += ", "
        string_result += "a: "
        string_result += @a.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end