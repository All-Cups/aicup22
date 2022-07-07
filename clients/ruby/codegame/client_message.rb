require './debugging/debug_command'
require './model/order'

module Codegame

# Message sent from client
class ClientMessage
    # Read ClientMessage from input stream
    def self.read_from(stream)
        tag = stream.read_int()
        if tag == ClientMessage::DebugMessage::TAG
            return ClientMessage::DebugMessage.read_from(stream)
        end
        if tag == ClientMessage::OrderMessage::TAG
            return ClientMessage::OrderMessage.read_from(stream)
        end
        if tag == ClientMessage::DebugUpdateDone::TAG
            return ClientMessage::DebugUpdateDone.read_from(stream)
        end
        if tag == ClientMessage::RequestDebugState::TAG
            return ClientMessage::RequestDebugState.read_from(stream)
        end
        raise "Unexpected tag value"
    end

    # Ask app to perform new debug command
    class DebugMessage
        TAG = 0
    
        # Command to perform
        attr_accessor :command
    
        def initialize(command)
            @command = command
        end
    
        # Read DebugMessage from input stream
        def self.read_from(stream)
            command = Debugging::DebugCommand.read_from(stream)
            DebugMessage.new(command)
        end
    
        # Write DebugMessage to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @command.write_to(stream)
        end
    
        def to_s
            string_result = "DebugMessage { "
            string_result += "command: "
            string_result += @command.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Reply for ServerMessage::GetOrder
    class OrderMessage
        TAG = 1
    
        # Player's order
        attr_accessor :order
    
        def initialize(order)
            @order = order
        end
    
        # Read OrderMessage from input stream
        def self.read_from(stream)
            order = Model::Order.read_from(stream)
            OrderMessage.new(order)
        end
    
        # Write OrderMessage to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @order.write_to(stream)
        end
    
        def to_s
            string_result = "OrderMessage { "
            string_result += "order: "
            string_result += @order.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Signifies finish of the debug update
    class DebugUpdateDone
        TAG = 2
    
    
        def initialize()
        end
    
        # Read DebugUpdateDone from input stream
        def self.read_from(stream)
            DebugUpdateDone.new()
        end
    
        # Write DebugUpdateDone to output stream
        def write_to(stream)
            stream.write_int(TAG)
        end
    
        def to_s
            string_result = "DebugUpdateDone { "
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Request debug state from the app
    class RequestDebugState
        TAG = 3
    
    
        def initialize()
        end
    
        # Read RequestDebugState from input stream
        def self.read_from(stream)
            RequestDebugState.new()
        end
    
        # Write RequestDebugState to output stream
        def write_to(stream)
            stream.write_int(TAG)
        end
    
        def to_s
            string_result = "RequestDebugState { "
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
end

end