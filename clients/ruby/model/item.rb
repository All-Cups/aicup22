module Model

# Lootable item
class Item
    # Read Item from input stream
    def self.read_from(stream)
        tag = stream.read_int()
        if tag == Item::Weapon::TAG
            return Item::Weapon.read_from(stream)
        end
        if tag == Item::ShieldPotions::TAG
            return Item::ShieldPotions.read_from(stream)
        end
        if tag == Item::Ammo::TAG
            return Item::Ammo.read_from(stream)
        end
        raise "Unexpected tag value"
    end

    # Weapon
    class Weapon
        TAG = 0
    
        # Weapon type index (starting with 0)
        attr_accessor :type_index
    
        def initialize(type_index)
            @type_index = type_index
        end
    
        # Read Weapon from input stream
        def self.read_from(stream)
            type_index = stream.read_int()
            Weapon.new(type_index)
        end
    
        # Write Weapon to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_int(@type_index)
        end
    
        def to_s
            string_result = "Weapon { "
            string_result += "type_index: "
            string_result += @type_index.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Shield potions
    class ShieldPotions
        TAG = 1
    
        # Amount of potions
        attr_accessor :amount
    
        def initialize(amount)
            @amount = amount
        end
    
        # Read ShieldPotions from input stream
        def self.read_from(stream)
            amount = stream.read_int()
            ShieldPotions.new(amount)
        end
    
        # Write ShieldPotions to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_int(@amount)
        end
    
        def to_s
            string_result = "ShieldPotions { "
            string_result += "amount: "
            string_result += @amount.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Ammo
    class Ammo
        TAG = 2
    
        # Weapon type index (starting with 0)
        attr_accessor :weapon_type_index
        # Amount of ammo
        attr_accessor :amount
    
        def initialize(weapon_type_index, amount)
            @weapon_type_index = weapon_type_index
            @amount = amount
        end
    
        # Read Ammo from input stream
        def self.read_from(stream)
            weapon_type_index = stream.read_int()
            amount = stream.read_int()
            Ammo.new(weapon_type_index, amount)
        end
    
        # Write Ammo to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_int(@weapon_type_index)
            stream.write_int(@amount)
        end
    
        def to_s
            string_result = "Ammo { "
            string_result += "weapon_type_index: "
            string_result += @weapon_type_index.to_s
            string_result += ", "
            string_result += "amount: "
            string_result += @amount.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
end

end