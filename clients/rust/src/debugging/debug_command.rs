use super::*;

/// Debug commands that can be sent while debugging with the app
#[derive(Clone, Debug)]
pub enum DebugCommand {
    /// Add debug data to current tick
    Add {
        /// Data to add
        debug_data: debugging::DebugData,
    },
    /// Clear current tick's debug data
    Clear {
    },
    /// Enable/disable auto performing of commands
    SetAutoFlush {
        /// Enable/disable autoflush
        enable: bool,
    },
    /// Perform all previously sent commands
    Flush {
    },
}

impl trans::Trans for DebugCommand {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        match self {
            Self::Add {
                debug_data,
            } => {
                <i32 as trans::Trans>::write_to(&0, writer)?;
                debug_data.write_to(writer)?;
            }
            Self::Clear {
            } => {
                <i32 as trans::Trans>::write_to(&1, writer)?;
            }
            Self::SetAutoFlush {
                enable,
            } => {
                <i32 as trans::Trans>::write_to(&2, writer)?;
                enable.write_to(writer)?;
            }
            Self::Flush {
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
                let debug_data: debugging::DebugData = trans::Trans::read_from(reader)?;
                Ok(Self::Add {
                    debug_data,
                })
            }
            1 => {
                Ok(Self::Clear {
                })
            }
            2 => {
                let enable: bool = trans::Trans::read_from(reader)?;
                Ok(Self::SetAutoFlush {
                    enable,
                })
            }
            3 => {
                Ok(Self::Flush {
                })
            }
            _ => Err(std::io::Error::new(
                std::io::ErrorKind::Other,
                format!("Unexpected tag {:?}", tag))),
        }
    }
}