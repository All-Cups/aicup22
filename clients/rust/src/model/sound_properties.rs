use super::*;

/// Sound properties
#[derive(Clone, Debug)]
pub struct SoundProperties {
    /// Name
    pub name: String,
    /// Distance from which the sound can be heard
    pub distance: f64,
    /// Offset modifier
    pub offset: f64,
}

impl trans::Trans for SoundProperties {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.name.write_to(writer)?;
        self.distance.write_to(writer)?;
        self.offset.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let name: String = trans::Trans::read_from(reader)?;
        let distance: f64 = trans::Trans::read_from(reader)?;
        let offset: f64 = trans::Trans::read_from(reader)?;
        Ok(Self {
            name,
            distance,
            offset,
        })
    }
}