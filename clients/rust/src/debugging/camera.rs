use super::*;

/// Camera state
#[derive(Clone, Debug)]
pub struct Camera {
    /// Center
    pub center: model::Vec2,
    /// Rotation
    pub rotation: f64,
    /// Attack angle
    pub attack: f64,
    /// Vertical field of view
    pub fov: f64,
}

impl trans::Trans for Camera {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.center.write_to(writer)?;
        self.rotation.write_to(writer)?;
        self.attack.write_to(writer)?;
        self.fov.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let center: model::Vec2 = trans::Trans::read_from(reader)?;
        let rotation: f64 = trans::Trans::read_from(reader)?;
        let attack: f64 = trans::Trans::read_from(reader)?;
        let fov: f64 = trans::Trans::read_from(reader)?;
        Ok(Self {
            center,
            rotation,
            attack,
            fov,
        })
    }
}