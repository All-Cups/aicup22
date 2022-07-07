use super::*;

/// Type of action a unit is currently performing
#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub enum ActionType {
    /// Picking up or dropping loot
    Looting,
    /// Using a shield potion
    UseShieldPotion,
}

impl trans::Trans for ActionType {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        let tag: i32 = match self {
            Self::Looting => 0,
            Self::UseShieldPotion => 1,
        };
        trans::Trans::write_to(&tag, writer)
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let tag = <i32 as trans::Trans>::read_from(reader)?;
        match tag {
            0 => Ok(Self::Looting),
            1 => Ok(Self::UseShieldPotion),
            _ => Err(std::io::Error::new(
                std::io::ErrorKind::Other,
                format!("Unexpected tag {:?}", tag))),
        }
    }
}