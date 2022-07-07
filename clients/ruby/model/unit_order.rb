require './model/action_order'
require './model/vec2'

module Model

# Order for specific unit
class UnitOrder
    # Target moving velocity
    attr_accessor :target_velocity
    # Target view direction (vector length doesn't matter)
    attr_accessor :target_direction
    # Order to perform an action, or None
    attr_accessor :action

    def initialize(target_velocity, target_direction, action)
        @target_velocity = target_velocity
        @target_direction = target_direction
        @action = action
    end

    # Read UnitOrder from input stream
    def self.read_from(stream)
        target_velocity = Model::Vec2.read_from(stream)
        target_direction = Model::Vec2.read_from(stream)
        if stream.read_bool()
            action = Model::ActionOrder.read_from(stream)
        else
            action = nil
        end
        UnitOrder.new(target_velocity, target_direction, action)
    end

    # Write UnitOrder to output stream
    def write_to(stream)
        @target_velocity.write_to(stream)
        @target_direction.write_to(stream)
        if @action.nil?
            stream.write_bool(false)
        else
            stream.write_bool(true)
            @action.write_to(stream)
        end
    end

    def to_s
        string_result = "UnitOrder { "
        string_result += "target_velocity: "
        string_result += @target_velocity.to_s
        string_result += ", "
        string_result += "target_direction: "
        string_result += @target_direction.to_s
        string_result += ", "
        string_result += "action: "
        if @action.nil?
            string_result += "nil"
        else
            string_result += @action.to_s
        end
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end