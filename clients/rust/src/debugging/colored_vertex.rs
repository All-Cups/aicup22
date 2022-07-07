use super::*;

/// Point + color
#[derive(Clone, Debug)]
pub struct ColoredVertex {
    /// Position
    pub position: model::Vec2,
    /// Color
    pub color: debugging::Color,
}

impl trans::Trans for ColoredVertex {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.position.write_to(writer)?;
        self.color.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let position: model::Vec2 = trans::Trans::read_from(reader)?;
        let color: debugging::Color = trans::Trans::read_from(reader)?;
        Ok(Self {
            position,
            color,
        })
    }
}