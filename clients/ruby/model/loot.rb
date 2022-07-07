require './model/item'
require './model/vec2'

module Model

# Loot lying on the ground
class Loot
    # Unique id
    attr_accessor :id
    # Position
    attr_accessor :position
    # Item
    attr_accessor :item

    def initialize(id, position, item)
        @id = id
        @position = position
        @item = item
    end

    # Read Loot from input stream
    def self.read_from(stream)
        id = stream.read_int()
        position = Model::Vec2.read_from(stream)
        item = Model::Item.read_from(stream)
        Loot.new(id, position, item)
    end

    # Write Loot to output stream
    def write_to(stream)
        stream.write_int(@id)
        @position.write_to(stream)
        @item.write_to(stream)
    end

    def to_s
        string_result = "Loot { "
        string_result += "id: "
        string_result += @id.to_s
        string_result += ", "
        string_result += "position: "
        string_result += @position.to_s
        string_result += ", "
        string_result += "item: "
        string_result += @item.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end