use super::*;

/// A unit
#[derive(Clone, Debug)]
pub struct Unit {
    /// Unique id
    pub id: i32,
    /// Id of the player (team) controlling the unit
    pub player_id: i32,
    /// Current health
    pub health: f64,
    /// Current shield value
    pub shield: f64,
    /// Left extra lives of this unit
    pub extra_lives: i32,
    /// Current position of unit's center
    pub position: model::Vec2,
    /// Remaining time until unit will be spawned, or None
    pub remaining_spawn_time: Option<f64>,
    /// Current velocity
    pub velocity: model::Vec2,
    /// Current view direction (vector of length 1)
    pub direction: model::Vec2,
    /// Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
    pub aim: f64,
    /// Current action unit is performing, or None
    pub action: Option<model::Action>,
    /// Tick when health regeneration will start (can be less than current game tick)
    pub health_regeneration_start_tick: i32,
    /// Index of the weapon this unit is holding (starting with 0), or None
    pub weapon: Option<i32>,
    /// Next tick when unit can shoot again (can be less than current game tick)
    pub next_shot_tick: i32,
    /// List of ammo in unit's inventory for every weapon type
    pub ammo: Vec<i32>,
    /// Number of shield potions in inventory
    pub shield_potions: i32,
}

impl trans::Trans for Unit {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.id.write_to(writer)?;
        self.player_id.write_to(writer)?;
        self.health.write_to(writer)?;
        self.shield.write_to(writer)?;
        self.extra_lives.write_to(writer)?;
        self.position.write_to(writer)?;
        self.remaining_spawn_time.write_to(writer)?;
        self.velocity.write_to(writer)?;
        self.direction.write_to(writer)?;
        self.aim.write_to(writer)?;
        self.action.write_to(writer)?;
        self.health_regeneration_start_tick.write_to(writer)?;
        self.weapon.write_to(writer)?;
        self.next_shot_tick.write_to(writer)?;
        self.ammo.write_to(writer)?;
        self.shield_potions.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let id: i32 = trans::Trans::read_from(reader)?;
        let player_id: i32 = trans::Trans::read_from(reader)?;
        let health: f64 = trans::Trans::read_from(reader)?;
        let shield: f64 = trans::Trans::read_from(reader)?;
        let extra_lives: i32 = trans::Trans::read_from(reader)?;
        let position: model::Vec2 = trans::Trans::read_from(reader)?;
        let remaining_spawn_time: Option<f64> = trans::Trans::read_from(reader)?;
        let velocity: model::Vec2 = trans::Trans::read_from(reader)?;
        let direction: model::Vec2 = trans::Trans::read_from(reader)?;
        let aim: f64 = trans::Trans::read_from(reader)?;
        let action: Option<model::Action> = trans::Trans::read_from(reader)?;
        let health_regeneration_start_tick: i32 = trans::Trans::read_from(reader)?;
        let weapon: Option<i32> = trans::Trans::read_from(reader)?;
        let next_shot_tick: i32 = trans::Trans::read_from(reader)?;
        let ammo: Vec<i32> = trans::Trans::read_from(reader)?;
        let shield_potions: i32 = trans::Trans::read_from(reader)?;
        Ok(Self {
            id,
            player_id,
            health,
            shield,
            extra_lives,
            position,
            remaining_spawn_time,
            velocity,
            direction,
            aim,
            action,
            health_regeneration_start_tick,
            weapon,
            next_shot_tick,
            ammo,
            shield_potions,
        })
    }
}