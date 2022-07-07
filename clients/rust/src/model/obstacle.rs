use super::*;

/// An obstacle on the map
#[derive(Clone, Debug)]
pub struct Obstacle {
    /// Unique id
    pub id: i32,
    /// Center position
    pub position: model::Vec2,
    /// Obstacle's radius
    pub radius: f64,
    /// Whether units can see through this obstacle, or it blocks the view
    pub can_see_through: bool,
    /// Whether projectiles can go through this obstacle
    pub can_shoot_through: bool,
}

impl trans::Trans for Obstacle {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.id.write_to(writer)?;
        self.position.write_to(writer)?;
        self.radius.write_to(writer)?;
        self.can_see_through.write_to(writer)?;
        self.can_shoot_through.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let id: i32 = trans::Trans::read_from(reader)?;
        let position: model::Vec2 = trans::Trans::read_from(reader)?;
        let radius: f64 = trans::Trans::read_from(reader)?;
        let can_see_through: bool = trans::Trans::read_from(reader)?;
        let can_shoot_through: bool = trans::Trans::read_from(reader)?;
        Ok(Self {
            id,
            position,
            radius,
            can_see_through,
            can_shoot_through,
        })
    }
}