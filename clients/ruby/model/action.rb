require './model/action_type'

module Model

# Action unit is currently performing
class Action
    # Tick when the action will be finished
    attr_accessor :finish_tick
    # Type of the action
    attr_accessor :action_type

    def initialize(finish_tick, action_type)
        @finish_tick = finish_tick
        @action_type = action_type
    end

    # Read Action from input stream
    def self.read_from(stream)
        finish_tick = stream.read_int()
        action_type = Model::ActionType.read_from(stream)
        Action.new(finish_tick, action_type)
    end

    # Write Action to output stream
    def write_to(stream)
        stream.write_int(@finish_tick)
        stream.write_int(@action_type)
    end

    def to_s
        string_result = "Action { "
        string_result += "finish_tick: "
        string_result += @finish_tick.to_s
        string_result += ", "
        string_result += "action_type: "
        string_result += ActionType.to_s(@action_type)
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end