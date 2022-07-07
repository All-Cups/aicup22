require './debugging/camera'
require './model/vec2'

module Debugging

# Renderer's state
class DebugState
    # Pressed keys
    attr_accessor :pressed_keys
    # Cursor's position in game coordinates
    attr_accessor :cursor_world_position
    # Id of unit which is followed by the camera, or None
    attr_accessor :locked_unit
    # Current camera state
    attr_accessor :camera

    def initialize(pressed_keys, cursor_world_position, locked_unit, camera)
        @pressed_keys = pressed_keys
        @cursor_world_position = cursor_world_position
        @locked_unit = locked_unit
        @camera = camera
    end

    # Read DebugState from input stream
    def self.read_from(stream)
        pressed_keys = []
        stream.read_int().times do |_|
            pressed_keys_element = stream.read_string()
            pressed_keys.push(pressed_keys_element)
        end
        cursor_world_position = Model::Vec2.read_from(stream)
        if stream.read_bool()
            locked_unit = stream.read_int()
        else
            locked_unit = nil
        end
        camera = Debugging::Camera.read_from(stream)
        DebugState.new(pressed_keys, cursor_world_position, locked_unit, camera)
    end

    # Write DebugState to output stream
    def write_to(stream)
        stream.write_int(@pressed_keys.length())
        @pressed_keys.each do |pressed_keys_element|
            stream.write_string(pressed_keys_element)
        end
        @cursor_world_position.write_to(stream)
        if @locked_unit.nil?
            stream.write_bool(false)
        else
            stream.write_bool(true)
            stream.write_int(@locked_unit)
        end
        @camera.write_to(stream)
    end

    def to_s
        string_result = "DebugState { "
        string_result += "pressed_keys: "
        string_result += "[ "
        pressed_keys_index = 0
        @pressed_keys.each do |pressed_keys_element|
            if pressed_keys_index != 0
                string_result += ", "
            end
            string_result += pressed_keys_element.dump
            pressed_keys_index += 1
        end
        string_result += " ]"
        string_result += ", "
        string_result += "cursor_world_position: "
        string_result += @cursor_world_position.to_s
        string_result += ", "
        string_result += "locked_unit: "
        if @locked_unit.nil?
            string_result += "nil"
        else
            string_result += @locked_unit.to_s
        end
        string_result += ", "
        string_result += "camera: "
        string_result += @camera.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end