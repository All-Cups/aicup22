module Model

# Type of action a unit is currently performing
module ActionType
    # Picking up or dropping loot
    LOOTING = 0
    # Using a shield potion
    USE_SHIELD_POTION = 1

    # Read ActionType from input stream
    def self.read_from(stream)
        result = stream.read_int()
        if result < 0 || result >= 2
            raise "Unexpected tag value"
        end
        result
    end

    def self.to_s(value)
        if value == LOOTING
            return "LOOTING"
        end
        if value == USE_SHIELD_POTION
            return "USE_SHIELD_POTION"
        end
        raise "Impossible happened"
    end

    def self.to_str(value)
        self.to_s(value)
    end
end

end