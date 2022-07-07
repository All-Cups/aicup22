use super::*;

/// Message sent from server
#[derive(Clone, Debug)]
pub enum ServerMessage {
    /// Update constants
    UpdateConstants {
        /// New constants
        constants: model::Constants,
    },
    /// Get order for next tick
    GetOrder {
        /// Player's view
        player_view: model::Game,
        /// Whether app is running with debug interface available
        debug_available: bool,
    },
    /// Signifies end of the game
    Finish {
    },
    /// Debug update
    DebugUpdate {
    },
}

impl trans::Trans for ServerMessage {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        match self {
            Self::UpdateConstants {
                constants,
            } => {
                <i32 as trans::Trans>::write_to(&0, writer)?;
                constants.write_to(writer)?;
            }
            Self::GetOrder {
                player_view,
                debug_available,
            } => {
                <i32 as trans::Trans>::write_to(&1, writer)?;
                player_view.write_to(writer)?;
                debug_available.write_to(writer)?;
            }
            Self::Finish {
            } => {
                <i32 as trans::Trans>::write_to(&2, writer)?;
            }
            Self::DebugUpdate {
            } => {
                <i32 as trans::Trans>::write_to(&3, writer)?;
            }
        }
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let tag = <i32 as trans::Trans>::read_from(reader)?;
        match tag {
            0 => {
                let constants: model::Constants = trans::Trans::read_from(reader)?;
                Ok(Self::UpdateConstants {
                    constants,
                })
            }
            1 => {
                let player_view: model::Game = trans::Trans::read_from(reader)?;
                let debug_available: bool = trans::Trans::read_from(reader)?;
                Ok(Self::GetOrder {
                    player_view,
                    debug_available,
                })
            }
            2 => {
                Ok(Self::Finish {
                })
            }
            3 => {
                Ok(Self::DebugUpdate {
                })
            }
            _ => Err(std::io::Error::new(
                std::io::ErrorKind::Other,
                format!("Unexpected tag {:?}", tag))),
        }
    }
}