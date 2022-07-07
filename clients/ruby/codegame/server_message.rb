require './model/constants'
require './model/game'

module Codegame

# Message sent from server
class ServerMessage
    # Read ServerMessage from input stream
    def self.read_from(stream)
        tag = stream.read_int()
        if tag == ServerMessage::UpdateConstants::TAG
            return ServerMessage::UpdateConstants.read_from(stream)
        end
        if tag == ServerMessage::GetOrder::TAG
            return ServerMessage::GetOrder.read_from(stream)
        end
        if tag == ServerMessage::Finish::TAG
            return ServerMessage::Finish.read_from(stream)
        end
        if tag == ServerMessage::DebugUpdate::TAG
            return ServerMessage::DebugUpdate.read_from(stream)
        end
        raise "Unexpected tag value"
    end

    # Update constants
    class UpdateConstants
        TAG = 0
    
        # New constants
        attr_accessor :constants
    
        def initialize(constants)
            @constants = constants
        end
    
        # Read UpdateConstants from input stream
        def self.read_from(stream)
            constants = Model::Constants.read_from(stream)
            UpdateConstants.new(constants)
        end
    
        # Write UpdateConstants to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @constants.write_to(stream)
        end
    
        def to_s
            string_result = "UpdateConstants { "
            string_result += "constants: "
            string_result += @constants.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Get order for next tick
    class GetOrder
        TAG = 1
    
        # Player's view
        attr_accessor :player_view
        # Whether app is running with debug interface available
        attr_accessor :debug_available
    
        def initialize(player_view, debug_available)
            @player_view = player_view
            @debug_available = debug_available
        end
    
        # Read GetOrder from input stream
        def self.read_from(stream)
            player_view = Model::Game.read_from(stream)
            debug_available = stream.read_bool()
            GetOrder.new(player_view, debug_available)
        end
    
        # Write GetOrder to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @player_view.write_to(stream)
            stream.write_bool(@debug_available)
        end
    
        def to_s
            string_result = "GetOrder { "
            string_result += "player_view: "
            string_result += @player_view.to_s
            string_result += ", "
            string_result += "debug_available: "
            string_result += @debug_available.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Signifies end of the game
    class Finish
        TAG = 2
    
    
        def initialize()
        end
    
        # Read Finish from input stream
        def self.read_from(stream)
            Finish.new()
        end
    
        # Write Finish to output stream
        def write_to(stream)
            stream.write_int(TAG)
        end
    
        def to_s
            string_result = "Finish { "
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Debug update
    class DebugUpdate
        TAG = 3
    
    
        def initialize()
        end
    
        # Read DebugUpdate from input stream
        def self.read_from(stream)
            DebugUpdate.new()
        end
    
        # Write DebugUpdate to output stream
        def write_to(stream)
            stream.write_int(TAG)
        end
    
        def to_s
            string_result = "DebugUpdate { "
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
end

end