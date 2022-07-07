require './debugging/debug_data'

module Debugging

# Debug commands that can be sent while debugging with the app
class DebugCommand
    # Read DebugCommand from input stream
    def self.read_from(stream)
        tag = stream.read_int()
        if tag == DebugCommand::Add::TAG
            return DebugCommand::Add.read_from(stream)
        end
        if tag == DebugCommand::Clear::TAG
            return DebugCommand::Clear.read_from(stream)
        end
        if tag == DebugCommand::SetAutoFlush::TAG
            return DebugCommand::SetAutoFlush.read_from(stream)
        end
        if tag == DebugCommand::Flush::TAG
            return DebugCommand::Flush.read_from(stream)
        end
        raise "Unexpected tag value"
    end

    # Add debug data to current tick
    class Add
        TAG = 0
    
        # Data to add
        attr_accessor :debug_data
    
        def initialize(debug_data)
            @debug_data = debug_data
        end
    
        # Read Add from input stream
        def self.read_from(stream)
            debug_data = Debugging::DebugData.read_from(stream)
            Add.new(debug_data)
        end
    
        # Write Add to output stream
        def write_to(stream)
            stream.write_int(TAG)
            @debug_data.write_to(stream)
        end
    
        def to_s
            string_result = "Add { "
            string_result += "debug_data: "
            string_result += @debug_data.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Clear current tick's debug data
    class Clear
        TAG = 1
    
    
        def initialize()
        end
    
        # Read Clear from input stream
        def self.read_from(stream)
            Clear.new()
        end
    
        # Write Clear to output stream
        def write_to(stream)
            stream.write_int(TAG)
        end
    
        def to_s
            string_result = "Clear { "
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Enable/disable auto performing of commands
    class SetAutoFlush
        TAG = 2
    
        # Enable/disable autoflush
        attr_accessor :enable
    
        def initialize(enable)
            @enable = enable
        end
    
        # Read SetAutoFlush from input stream
        def self.read_from(stream)
            enable = stream.read_bool()
            SetAutoFlush.new(enable)
        end
    
        # Write SetAutoFlush to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_bool(@enable)
        end
    
        def to_s
            string_result = "SetAutoFlush { "
            string_result += "enable: "
            string_result += @enable.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Perform all previously sent commands
    class Flush
        TAG = 3
    
    
        def initialize()
        end
    
        # Read Flush from input stream
        def self.read_from(stream)
            Flush.new()
        end
    
        # Write Flush to output stream
        def write_to(stream)
            stream.write_int(TAG)
        end
    
        def to_s
            string_result = "Flush { "
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
end

end