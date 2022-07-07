use super::*;

/// Order for specific unit
#[derive(Clone, Debug)]
pub struct UnitOrder {
    /// Target moving velocity
    pub target_velocity: model::Vec2,
    /// Target view direction (vector length doesn't matter)
    pub target_direction: model::Vec2,
    /// Order to perform an action, or None
    pub action: Option<model::ActionOrder>,
}

impl trans::Trans for UnitOrder {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.target_velocity.write_to(writer)?;
        self.target_direction.write_to(writer)?;
        self.action.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let target_velocity: model::Vec2 = trans::Trans::read_from(reader)?;
        let target_direction: model::Vec2 = trans::Trans::read_from(reader)?;
        let action: Option<model::ActionOrder> = trans::Trans::read_from(reader)?;
        Ok(Self {
            target_velocity,
            target_direction,
            action,
        })
    }
}