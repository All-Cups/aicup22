use super::*;

/// 2 dimensional vector.
#[derive(Clone, Debug)]
pub struct Vec2 {
    /// `x` coordinate of the vector
    pub x: f64,
    /// `y` coordinate of the vector
    pub y: f64,
}

impl trans::Trans for Vec2 {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.x.write_to(writer)?;
        self.y.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let x: f64 = trans::Trans::read_from(reader)?;
        let y: f64 = trans::Trans::read_from(reader)?;
        Ok(Self {
            x,
            y,
        })
    }
}