use super::*;

/// Renderer's state
#[derive(Clone, Debug)]
pub struct DebugState {
    /// Pressed keys
    pub pressed_keys: Vec<String>,
    /// Cursor's position in game coordinates
    pub cursor_world_position: model::Vec2,
    /// Id of unit which is followed by the camera, or None
    pub locked_unit: Option<i32>,
    /// Current camera state
    pub camera: debugging::Camera,
}

impl trans::Trans for DebugState {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.pressed_keys.write_to(writer)?;
        self.cursor_world_position.write_to(writer)?;
        self.locked_unit.write_to(writer)?;
        self.camera.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let pressed_keys: Vec<String> = trans::Trans::read_from(reader)?;
        let cursor_world_position: model::Vec2 = trans::Trans::read_from(reader)?;
        let locked_unit: Option<i32> = trans::Trans::read_from(reader)?;
        let camera: debugging::Camera = trans::Trans::read_from(reader)?;
        Ok(Self {
            pressed_keys,
            cursor_world_position,
            locked_unit,
            camera,
        })
    }
}