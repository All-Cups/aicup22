module Model

# Order to perform an action for unit
class ActionOrder
    # Read ActionOrder from input stream
    def self.read_from(stream)
        tag = stream.read_int()
        if tag == ActionOrder::Pickup::TAG
            return ActionOrder::Pickup.read_from(stream)
        end
        if tag == ActionOrder::UseShieldPotion::TAG
            return ActionOrder::UseShieldPotion.read_from(stream)
        end
        if tag == ActionOrder::DropShieldPotions::TAG
            return ActionOrder::DropShieldPotions.read_from(stream)
        end
        if tag == ActionOrder::DropWeapon::TAG
            return ActionOrder::DropWeapon.read_from(stream)
        end
        if tag == ActionOrder::DropAmmo::TAG
            return ActionOrder::DropAmmo.read_from(stream)
        end
        if tag == ActionOrder::Aim::TAG
            return ActionOrder::Aim.read_from(stream)
        end
        raise "Unexpected tag value"
    end

    # Pick up loot
    class Pickup
        TAG = 0
    
        # Loot id
        attr_accessor :loot
    
        def initialize(loot)
            @loot = loot
        end
    
        # Read Pickup from input stream
        def self.read_from(stream)
            loot = stream.read_int()
            Pickup.new(loot)
        end
    
        # Write Pickup to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_int(@loot)
        end
    
        def to_s
            string_result = "Pickup { "
            string_result += "loot: "
            string_result += @loot.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Use shield potion
    class UseShieldPotion
        TAG = 1
    
    
        def initialize()
        end
    
        # Read UseShieldPotion from input stream
        def self.read_from(stream)
            UseShieldPotion.new()
        end
    
        # Write UseShieldPotion to output stream
        def write_to(stream)
            stream.write_int(TAG)
        end
    
        def to_s
            string_result = "UseShieldPotion { "
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Drop shield potions on the ground
    class DropShieldPotions
        TAG = 2
    
        # Amount of potions
        attr_accessor :amount
    
        def initialize(amount)
            @amount = amount
        end
    
        # Read DropShieldPotions from input stream
        def self.read_from(stream)
            amount = stream.read_int()
            DropShieldPotions.new(amount)
        end
    
        # Write DropShieldPotions to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_int(@amount)
        end
    
        def to_s
            string_result = "DropShieldPotions { "
            string_result += "amount: "
            string_result += @amount.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Drop current weapon
    class DropWeapon
        TAG = 3
    
    
        def initialize()
        end
    
        # Read DropWeapon from input stream
        def self.read_from(stream)
            DropWeapon.new()
        end
    
        # Write DropWeapon to output stream
        def write_to(stream)
            stream.write_int(TAG)
        end
    
        def to_s
            string_result = "DropWeapon { "
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
    # Drop ammo
    class DropAmmo
        TAG = 4
    
        # Weapon type index (starting with 0)
        attr_accessor :weapon_type_index
        # Amount of ammo
        attr_accessor :amount
    
        def initialize(weapon_type_index, amount)
            @weapon_type_index = weapon_type_index
            @amount = amount
        end
    
        # Read DropAmmo from input stream
        def self.read_from(stream)
            weapon_type_index = stream.read_int()
            amount = stream.read_int()
            DropAmmo.new(weapon_type_index, amount)
        end
    
        # Write DropAmmo to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_int(@weapon_type_index)
            stream.write_int(@amount)
        end
    
        def to_s
            string_result = "DropAmmo { "
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
    # Start/continue aiming
    class Aim
        TAG = 5
    
        # Shoot (only possible in full aim)
        attr_accessor :shoot
    
        def initialize(shoot)
            @shoot = shoot
        end
    
        # Read Aim from input stream
        def self.read_from(stream)
            shoot = stream.read_bool()
            Aim.new(shoot)
        end
    
        # Write Aim to output stream
        def write_to(stream)
            stream.write_int(TAG)
            stream.write_bool(@shoot)
        end
    
        def to_s
            string_result = "Aim { "
            string_result += "shoot: "
            string_result += @shoot.to_s
            string_result += " }"
            string_result
        end
    
        def to_str
            to_s
        end
    end
end

end