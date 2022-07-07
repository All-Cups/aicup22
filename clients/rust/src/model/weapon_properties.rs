use super::*;

/// Weapon properties
#[derive(Clone, Debug)]
pub struct WeaponProperties {
    /// Name
    pub name: String,
    /// Shooting speed (number of shots per second)
    pub rounds_per_second: f64,
    /// Accuracy (spread angle) of a shot (in degrees)
    pub spread: f64,
    /// Aiming time
    pub aim_time: f64,
    /// Field of view in full aim (in degrees)
    pub aim_field_of_view: f64,
    /// Rotation speed in full aim (degrees per second)
    pub aim_rotation_speed: f64,
    /// Movement speed modifier in full aim
    pub aim_movement_speed_modifier: f64,
    /// Speed of projectiles
    pub projectile_speed: f64,
    /// Damage of a projectile
    pub projectile_damage: f64,
    /// Projectiles' life time
    pub projectile_life_time: f64,
    /// Index of the sound when shooting (starting with 0), or None
    pub shot_sound_type_index: Option<i32>,
    /// Index of the sound when hitting something (starting with 0), or None
    pub projectile_hit_sound_type_index: Option<i32>,
    /// Max amount of ammo unit can hold in their inventory
    pub max_inventory_ammo: i32,
}

impl trans::Trans for WeaponProperties {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.name.write_to(writer)?;
        self.rounds_per_second.write_to(writer)?;
        self.spread.write_to(writer)?;
        self.aim_time.write_to(writer)?;
        self.aim_field_of_view.write_to(writer)?;
        self.aim_rotation_speed.write_to(writer)?;
        self.aim_movement_speed_modifier.write_to(writer)?;
        self.projectile_speed.write_to(writer)?;
        self.projectile_damage.write_to(writer)?;
        self.projectile_life_time.write_to(writer)?;
        self.shot_sound_type_index.write_to(writer)?;
        self.projectile_hit_sound_type_index.write_to(writer)?;
        self.max_inventory_ammo.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let name: String = trans::Trans::read_from(reader)?;
        let rounds_per_second: f64 = trans::Trans::read_from(reader)?;
        let spread: f64 = trans::Trans::read_from(reader)?;
        let aim_time: f64 = trans::Trans::read_from(reader)?;
        let aim_field_of_view: f64 = trans::Trans::read_from(reader)?;
        let aim_rotation_speed: f64 = trans::Trans::read_from(reader)?;
        let aim_movement_speed_modifier: f64 = trans::Trans::read_from(reader)?;
        let projectile_speed: f64 = trans::Trans::read_from(reader)?;
        let projectile_damage: f64 = trans::Trans::read_from(reader)?;
        let projectile_life_time: f64 = trans::Trans::read_from(reader)?;
        let shot_sound_type_index: Option<i32> = trans::Trans::read_from(reader)?;
        let projectile_hit_sound_type_index: Option<i32> = trans::Trans::read_from(reader)?;
        let max_inventory_ammo: i32 = trans::Trans::read_from(reader)?;
        Ok(Self {
            name,
            rounds_per_second,
            spread,
            aim_time,
            aim_field_of_view,
            aim_rotation_speed,
            aim_movement_speed_modifier,
            projectile_speed,
            projectile_damage,
            projectile_life_time,
            shot_sound_type_index,
            projectile_hit_sound_type_index,
            max_inventory_ammo,
        })
    }
}