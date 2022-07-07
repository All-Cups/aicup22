use super::*;

/// Game's participant (team of units)
#[derive(Clone, Debug)]
pub struct Player {
    /// Unique id
    pub id: i32,
    /// Number of kills
    pub kills: i32,
    /// Total damage dealt to enemies
    pub damage: f64,
    /// Survival place (number of survivor teams currently/at the moment of death)
    pub place: i32,
    /// Team score
    pub score: f64,
}

impl trans::Trans for Player {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.id.write_to(writer)?;
        self.kills.write_to(writer)?;
        self.damage.write_to(writer)?;
        self.place.write_to(writer)?;
        self.score.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let id: i32 = trans::Trans::read_from(reader)?;
        let kills: i32 = trans::Trans::read_from(reader)?;
        let damage: f64 = trans::Trans::read_from(reader)?;
        let place: i32 = trans::Trans::read_from(reader)?;
        let score: f64 = trans::Trans::read_from(reader)?;
        Ok(Self {
            id,
            kills,
            damage,
            place,
            score,
        })
    }
}