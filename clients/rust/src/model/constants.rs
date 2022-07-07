use super::*;

/// Non changing game state
#[derive(Clone, Debug)]
pub struct Constants {
    /// Number of ticks per game second
    pub ticks_per_second: f64,
    /// Starting number of units in each team
    pub team_size: i32,
    /// Initial zone radius
    pub initial_zone_radius: f64,
    /// Speed of zone radius
    pub zone_speed: f64,
    /// Damage dealt to units outside of the zone per second
    pub zone_damage_per_second: f64,
    /// Unit spawning time
    pub spawn_time: f64,
    /// Damage dealt to units trying to spawn in incorrect position per second
    pub spawn_collision_damage_per_second: f64,
    /// Time required to perform looting actions (in seconds)
    pub looting_time: f64,
    /// Number of bot players (teams)
    pub bot_players: i32,
    /// Units' radius
    pub unit_radius: f64,
    /// Max units' health
    pub unit_health: f64,
    /// Health automatically restored per second
    pub health_regeneration_per_second: f64,
    /// Time until automatic health regeneration since last health damage (in seconds)
    pub health_regeneration_delay: f64,
    /// Max value of unit's shield
    pub max_shield: f64,
    /// Initial value of unit's shield
    pub spawn_shield: f64,
    /// Initial number of extra lives for units
    pub extra_lives: i32,
    /// Zone radius after which respawning is disabled
    pub last_respawn_zone_radius: f64,
    /// Units' field of view without aiming (in degrees)
    pub field_of_view: f64,
    /// Units' view distance
    pub view_distance: f64,
    /// Whether units' view is blocked by obstacles
    pub view_blocking: bool,
    /// Unit rotation speed without aiming (degrees per second)
    pub rotation_speed: f64,
    /// Units' movement speed while spawning
    pub spawn_movement_speed: f64,
    /// Max unit speed when walking forward
    pub max_unit_forward_speed: f64,
    /// Max unit speed when walking backward
    pub max_unit_backward_speed: f64,
    /// Max unit acceleration
    pub unit_acceleration: f64,
    /// Whether a unit can damage units of the same team
    pub friendly_fire: bool,
    /// Score given for killing enemy unit
    pub kill_score: f64,
    /// Score multiplier for damaging enemy units
    pub damage_score_multiplier: f64,
    /// Score given for every team killed before you
    pub score_per_place: f64,
    /// List of properties of every weapon type
    pub weapons: Vec<model::WeaponProperties>,
    /// Starting weapon with which units spawn, or None
    pub starting_weapon: Option<i32>,
    /// Ammo for starting weapon given when unit spawns
    pub starting_weapon_ammo: i32,
    /// Max number of shield potions in unit's inventory
    pub max_shield_potions_in_inventory: i32,
    /// Amount of shield restored using one potion
    pub shield_per_potion: f64,
    /// Time required to perform action of using shield potion
    pub shield_potion_use_time: f64,
    /// List of properties of every sound type
    pub sounds: Vec<model::SoundProperties>,
    /// Sound type index when moving (starting with 0), or None
    pub steps_sound_type_index: Option<i32>,
    /// Distance when steps sound will be 100% probability
    pub steps_sound_travel_distance: f64,
    /// List of obstacles on the map
    pub obstacles: Vec<model::Obstacle>,
}

impl trans::Trans for Constants {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.ticks_per_second.write_to(writer)?;
        self.team_size.write_to(writer)?;
        self.initial_zone_radius.write_to(writer)?;
        self.zone_speed.write_to(writer)?;
        self.zone_damage_per_second.write_to(writer)?;
        self.spawn_time.write_to(writer)?;
        self.spawn_collision_damage_per_second.write_to(writer)?;
        self.looting_time.write_to(writer)?;
        self.bot_players.write_to(writer)?;
        self.unit_radius.write_to(writer)?;
        self.unit_health.write_to(writer)?;
        self.health_regeneration_per_second.write_to(writer)?;
        self.health_regeneration_delay.write_to(writer)?;
        self.max_shield.write_to(writer)?;
        self.spawn_shield.write_to(writer)?;
        self.extra_lives.write_to(writer)?;
        self.last_respawn_zone_radius.write_to(writer)?;
        self.field_of_view.write_to(writer)?;
        self.view_distance.write_to(writer)?;
        self.view_blocking.write_to(writer)?;
        self.rotation_speed.write_to(writer)?;
        self.spawn_movement_speed.write_to(writer)?;
        self.max_unit_forward_speed.write_to(writer)?;
        self.max_unit_backward_speed.write_to(writer)?;
        self.unit_acceleration.write_to(writer)?;
        self.friendly_fire.write_to(writer)?;
        self.kill_score.write_to(writer)?;
        self.damage_score_multiplier.write_to(writer)?;
        self.score_per_place.write_to(writer)?;
        self.weapons.write_to(writer)?;
        self.starting_weapon.write_to(writer)?;
        self.starting_weapon_ammo.write_to(writer)?;
        self.max_shield_potions_in_inventory.write_to(writer)?;
        self.shield_per_potion.write_to(writer)?;
        self.shield_potion_use_time.write_to(writer)?;
        self.sounds.write_to(writer)?;
        self.steps_sound_type_index.write_to(writer)?;
        self.steps_sound_travel_distance.write_to(writer)?;
        self.obstacles.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let ticks_per_second: f64 = trans::Trans::read_from(reader)?;
        let team_size: i32 = trans::Trans::read_from(reader)?;
        let initial_zone_radius: f64 = trans::Trans::read_from(reader)?;
        let zone_speed: f64 = trans::Trans::read_from(reader)?;
        let zone_damage_per_second: f64 = trans::Trans::read_from(reader)?;
        let spawn_time: f64 = trans::Trans::read_from(reader)?;
        let spawn_collision_damage_per_second: f64 = trans::Trans::read_from(reader)?;
        let looting_time: f64 = trans::Trans::read_from(reader)?;
        let bot_players: i32 = trans::Trans::read_from(reader)?;
        let unit_radius: f64 = trans::Trans::read_from(reader)?;
        let unit_health: f64 = trans::Trans::read_from(reader)?;
        let health_regeneration_per_second: f64 = trans::Trans::read_from(reader)?;
        let health_regeneration_delay: f64 = trans::Trans::read_from(reader)?;
        let max_shield: f64 = trans::Trans::read_from(reader)?;
        let spawn_shield: f64 = trans::Trans::read_from(reader)?;
        let extra_lives: i32 = trans::Trans::read_from(reader)?;
        let last_respawn_zone_radius: f64 = trans::Trans::read_from(reader)?;
        let field_of_view: f64 = trans::Trans::read_from(reader)?;
        let view_distance: f64 = trans::Trans::read_from(reader)?;
        let view_blocking: bool = trans::Trans::read_from(reader)?;
        let rotation_speed: f64 = trans::Trans::read_from(reader)?;
        let spawn_movement_speed: f64 = trans::Trans::read_from(reader)?;
        let max_unit_forward_speed: f64 = trans::Trans::read_from(reader)?;
        let max_unit_backward_speed: f64 = trans::Trans::read_from(reader)?;
        let unit_acceleration: f64 = trans::Trans::read_from(reader)?;
        let friendly_fire: bool = trans::Trans::read_from(reader)?;
        let kill_score: f64 = trans::Trans::read_from(reader)?;
        let damage_score_multiplier: f64 = trans::Trans::read_from(reader)?;
        let score_per_place: f64 = trans::Trans::read_from(reader)?;
        let weapons: Vec<model::WeaponProperties> = trans::Trans::read_from(reader)?;
        let starting_weapon: Option<i32> = trans::Trans::read_from(reader)?;
        let starting_weapon_ammo: i32 = trans::Trans::read_from(reader)?;
        let max_shield_potions_in_inventory: i32 = trans::Trans::read_from(reader)?;
        let shield_per_potion: f64 = trans::Trans::read_from(reader)?;
        let shield_potion_use_time: f64 = trans::Trans::read_from(reader)?;
        let sounds: Vec<model::SoundProperties> = trans::Trans::read_from(reader)?;
        let steps_sound_type_index: Option<i32> = trans::Trans::read_from(reader)?;
        let steps_sound_travel_distance: f64 = trans::Trans::read_from(reader)?;
        let obstacles: Vec<model::Obstacle> = trans::Trans::read_from(reader)?;
        Ok(Self {
            ticks_per_second,
            team_size,
            initial_zone_radius,
            zone_speed,
            zone_damage_per_second,
            spawn_time,
            spawn_collision_damage_per_second,
            looting_time,
            bot_players,
            unit_radius,
            unit_health,
            health_regeneration_per_second,
            health_regeneration_delay,
            max_shield,
            spawn_shield,
            extra_lives,
            last_respawn_zone_radius,
            field_of_view,
            view_distance,
            view_blocking,
            rotation_speed,
            spawn_movement_speed,
            max_unit_forward_speed,
            max_unit_backward_speed,
            unit_acceleration,
            friendly_fire,
            kill_score,
            damage_score_multiplier,
            score_per_place,
            weapons,
            starting_weapon,
            starting_weapon_ammo,
            max_shield_potions_in_inventory,
            shield_per_potion,
            shield_potion_use_time,
            sounds,
            steps_sound_type_index,
            steps_sound_travel_distance,
            obstacles,
        })
    }
}