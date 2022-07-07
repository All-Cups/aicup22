use super::*;

/// Message sent from client
#[derive(Clone, Debug)]
pub enum ClientMessage {
    /// Ask app to perform new debug command
    DebugMessage {
        /// Command to perform
        command: debugging::DebugCommand,
    },
    /// Reply for ServerMessage::GetOrder
    OrderMessage {
        /// Player's order
        order: model::Order,
    },
    /// Signifies finish of the debug update
    DebugUpdateDone {
    },
    /// Request debug state from the app
    RequestDebugState {
    },
}

impl trans::Trans for ClientMessage {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        match self {
            Self::DebugMessage {
                command,
            } => {
                <i32 as trans::Trans>::write_to(&0, writer)?;
                command.write_to(writer)?;
            }
            Self::OrderMessage {
                order,
            } => {
                <i32 as trans::Trans>::write_to(&1, writer)?;
                order.write_to(writer)?;
            }
            Self::DebugUpdateDone {
            } => {
                <i32 as trans::Trans>::write_to(&2, writer)?;
            }
            Self::RequestDebugState {
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
                let command: debugging::DebugCommand = trans::Trans::read_from(reader)?;
                Ok(Self::DebugMessage {
                    command,
                })
            }
            1 => {
                let order: model::Order = trans::Trans::read_from(reader)?;
                Ok(Self::OrderMessage {
                    order,
                })
            }
            2 => {
                Ok(Self::DebugUpdateDone {
                })
            }
            3 => {
                Ok(Self::RequestDebugState {
                })
            }
            _ => Err(std::io::Error::new(
                std::io::ErrorKind::Other,
                format!("Unexpected tag {:?}", tag))),
        }
    }
}