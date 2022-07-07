use super::*;

/// Lootable item
#[derive(Clone, Debug)]
pub enum Item {
    /// Weapon
    Weapon {
        /// Weapon type index (starting with 0)
        type_index: i32,
    },
    /// Shield potions
    ShieldPotions {
        /// Amount of potions
        amount: i32,
    },
    /// Ammo
    Ammo {
        /// Weapon type index (starting with 0)
        weapon_type_index: i32,
        /// Amount of ammo
        amount: i32,
    },
}

impl trans::Trans for Item {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        match self {
            Self::Weapon {
                type_index,
            } => {
                <i32 as trans::Trans>::write_to(&0, writer)?;
                type_index.write_to(writer)?;
            }
            Self::ShieldPotions {
                amount,
            } => {
                <i32 as trans::Trans>::write_to(&1, writer)?;
                amount.write_to(writer)?;
            }
            Self::Ammo {
                weapon_type_index,
                amount,
            } => {
                <i32 as trans::Trans>::write_to(&2, writer)?;
                weapon_type_index.write_to(writer)?;
                amount.write_to(writer)?;
            }
        }
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let tag = <i32 as trans::Trans>::read_from(reader)?;
        match tag {
            0 => {
                let type_index: i32 = trans::Trans::read_from(reader)?;
                Ok(Self::Weapon {
                    type_index,
                })
            }
            1 => {
                let amount: i32 = trans::Trans::read_from(reader)?;
                Ok(Self::ShieldPotions {
                    amount,
                })
            }
            2 => {
                let weapon_type_index: i32 = trans::Trans::read_from(reader)?;
                let amount: i32 = trans::Trans::read_from(reader)?;
                Ok(Self::Ammo {
                    weapon_type_index,
                    amount,
                })
            }
            _ => Err(std::io::Error::new(
                std::io::ErrorKind::Other,
                format!("Unexpected tag {:?}", tag))),
        }
    }
}