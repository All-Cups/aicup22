module Model

# Weapon properties
class WeaponProperties
    # Name
    attr_accessor :name
    # Shooting speed (number of shots per second)
    attr_accessor :rounds_per_second
    # Accuracy (spread angle) of a shot (in degrees)
    attr_accessor :spread
    # Aiming time
    attr_accessor :aim_time
    # Field of view in full aim (in degrees)
    attr_accessor :aim_field_of_view
    # Rotation speed in full aim (degrees per second)
    attr_accessor :aim_rotation_speed
    # Movement speed modifier in full aim
    attr_accessor :aim_movement_speed_modifier
    # Speed of projectiles
    attr_accessor :projectile_speed
    # Damage of a projectile
    attr_accessor :projectile_damage
    # Projectiles' life time
    attr_accessor :projectile_life_time
    # Index of the sound when shooting (starting with 0), or None
    attr_accessor :shot_sound_type_index
    # Index of the sound when hitting something (starting with 0), or None
    attr_accessor :projectile_hit_sound_type_index
    # Max amount of ammo unit can hold in their inventory
    attr_accessor :max_inventory_ammo

    def initialize(name, rounds_per_second, spread, aim_time, aim_field_of_view, aim_rotation_speed, aim_movement_speed_modifier, projectile_speed, projectile_damage, projectile_life_time, shot_sound_type_index, projectile_hit_sound_type_index, max_inventory_ammo)
        @name = name
        @rounds_per_second = rounds_per_second
        @spread = spread
        @aim_time = aim_time
        @aim_field_of_view = aim_field_of_view
        @aim_rotation_speed = aim_rotation_speed
        @aim_movement_speed_modifier = aim_movement_speed_modifier
        @projectile_speed = projectile_speed
        @projectile_damage = projectile_damage
        @projectile_life_time = projectile_life_time
        @shot_sound_type_index = shot_sound_type_index
        @projectile_hit_sound_type_index = projectile_hit_sound_type_index
        @max_inventory_ammo = max_inventory_ammo
    end

    # Read WeaponProperties from input stream
    def self.read_from(stream)
        name = stream.read_string()
        rounds_per_second = stream.read_double()
        spread = stream.read_double()
        aim_time = stream.read_double()
        aim_field_of_view = stream.read_double()
        aim_rotation_speed = stream.read_double()
        aim_movement_speed_modifier = stream.read_double()
        projectile_speed = stream.read_double()
        projectile_damage = stream.read_double()
        projectile_life_time = stream.read_double()
        if stream.read_bool()
            shot_sound_type_index = stream.read_int()
        else
            shot_sound_type_index = nil
        end
        if stream.read_bool()
            projectile_hit_sound_type_index = stream.read_int()
        else
            projectile_hit_sound_type_index = nil
        end
        max_inventory_ammo = stream.read_int()
        WeaponProperties.new(name, rounds_per_second, spread, aim_time, aim_field_of_view, aim_rotation_speed, aim_movement_speed_modifier, projectile_speed, projectile_damage, projectile_life_time, shot_sound_type_index, projectile_hit_sound_type_index, max_inventory_ammo)
    end

    # Write WeaponProperties to output stream
    def write_to(stream)
        stream.write_string(@name)
        stream.write_double(@rounds_per_second)
        stream.write_double(@spread)
        stream.write_double(@aim_time)
        stream.write_double(@aim_field_of_view)
        stream.write_double(@aim_rotation_speed)
        stream.write_double(@aim_movement_speed_modifier)
        stream.write_double(@projectile_speed)
        stream.write_double(@projectile_damage)
        stream.write_double(@projectile_life_time)
        if @shot_sound_type_index.nil?
            stream.write_bool(false)
        else
            stream.write_bool(true)
            stream.write_int(@shot_sound_type_index)
        end
        if @projectile_hit_sound_type_index.nil?
            stream.write_bool(false)
        else
            stream.write_bool(true)
            stream.write_int(@projectile_hit_sound_type_index)
        end
        stream.write_int(@max_inventory_ammo)
    end

    def to_s
        string_result = "WeaponProperties { "
        string_result += "name: "
        string_result += @name.dump
        string_result += ", "
        string_result += "rounds_per_second: "
        string_result += @rounds_per_second.to_s
        string_result += ", "
        string_result += "spread: "
        string_result += @spread.to_s
        string_result += ", "
        string_result += "aim_time: "
        string_result += @aim_time.to_s
        string_result += ", "
        string_result += "aim_field_of_view: "
        string_result += @aim_field_of_view.to_s
        string_result += ", "
        string_result += "aim_rotation_speed: "
        string_result += @aim_rotation_speed.to_s
        string_result += ", "
        string_result += "aim_movement_speed_modifier: "
        string_result += @aim_movement_speed_modifier.to_s
        string_result += ", "
        string_result += "projectile_speed: "
        string_result += @projectile_speed.to_s
        string_result += ", "
        string_result += "projectile_damage: "
        string_result += @projectile_damage.to_s
        string_result += ", "
        string_result += "projectile_life_time: "
        string_result += @projectile_life_time.to_s
        string_result += ", "
        string_result += "shot_sound_type_index: "
        if @shot_sound_type_index.nil?
            string_result += "nil"
        else
            string_result += @shot_sound_type_index.to_s
        end
        string_result += ", "
        string_result += "projectile_hit_sound_type_index: "
        if @projectile_hit_sound_type_index.nil?
            string_result += "nil"
        else
            string_result += @projectile_hit_sound_type_index.to_s
        end
        string_result += ", "
        string_result += "max_inventory_ammo: "
        string_result += @max_inventory_ammo.to_s
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end