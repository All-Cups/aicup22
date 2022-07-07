use super::*;

/// Action unit is currently performing
#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct Action {
    /// Tick when the action will be finished
    pub finish_tick: i32,
    /// Type of the action
    pub action_type: model::ActionType,
}

impl trans::Trans for Action {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.finish_tick.write_to(writer)?;
        self.action_type.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let finish_tick: i32 = trans::Trans::read_from(reader)?;
        let action_type: model::ActionType = trans::Trans::read_from(reader)?;
        Ok(Self {
            finish_tick,
            action_type,
        })
    }
}