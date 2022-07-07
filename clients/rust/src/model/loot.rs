use super::*;

/// Loot lying on the ground
#[derive(Clone, Debug)]
pub struct Loot {
    /// Unique id
    pub id: i32,
    /// Position
    pub position: model::Vec2,
    /// Item
    pub item: model::Item,
}

impl trans::Trans for Loot {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.id.write_to(writer)?;
        self.position.write_to(writer)?;
        self.item.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let id: i32 = trans::Trans::read_from(reader)?;
        let position: model::Vec2 = trans::Trans::read_from(reader)?;
        let item: model::Item = trans::Trans::read_from(reader)?;
        Ok(Self {
            id,
            position,
            item,
        })
    }
}