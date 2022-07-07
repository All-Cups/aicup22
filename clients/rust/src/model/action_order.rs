use super::*;

/// Order to perform an action for unit
#[derive(Clone, Debug)]
pub enum ActionOrder {
    /// Pick up loot
    Pickup {
        /// Loot id
        loot: i32,
    },
    /// Use shield potion
    UseShieldPotion {
    },
    /// Drop shield potions on the ground
    DropShieldPotions {
        /// Amount of potions
        amount: i32,
    },
    /// Drop current weapon
    DropWeapon {
    },
    /// Drop ammo
    DropAmmo {
        /// Weapon type index (starting with 0)
        weapon_type_index: i32,
        /// Amount of ammo
        amount: i32,
    },
    /// Start/continue aiming
    Aim {
        /// Shoot (only possible in full aim)
        shoot: bool,
    },
}

impl trans::Trans for ActionOrder {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        match self {
            Self::Pickup {
                loot,
            } => {
                <i32 as trans::Trans>::write_to(&0, writer)?;
                loot.write_to(writer)?;
            }
            Self::UseShieldPotion {
            } => {
                <i32 as trans::Trans>::write_to(&1, writer)?;
            }
            Self::DropShieldPotions {
                amount,
            } => {
                <i32 as trans::Trans>::write_to(&2, writer)?;
                amount.write_to(writer)?;
            }
            Self::DropWeapon {
            } => {
                <i32 as trans::Trans>::write_to(&3, writer)?;
            }
            Self::DropAmmo {
                weapon_type_index,
                amount,
            } => {
                <i32 as trans::Trans>::write_to(&4, writer)?;
                weapon_type_index.write_to(writer)?;
                amount.write_to(writer)?;
            }
            Self::Aim {
                shoot,
            } => {
                <i32 as trans::Trans>::write_to(&5, writer)?;
                shoot.write_to(writer)?;
            }
        }
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let tag = <i32 as trans::Trans>::read_from(reader)?;
        match tag {
            0 => {
                let loot: i32 = trans::Trans::read_from(reader)?;
                Ok(Self::Pickup {
                    loot,
                })
            }
            1 => {
                Ok(Self::UseShieldPotion {
                })
            }
            2 => {
                let amount: i32 = trans::Trans::read_from(reader)?;
                Ok(Self::DropShieldPotions {
                    amount,
                })
            }
            3 => {
                Ok(Self::DropWeapon {
                })
            }
            4 => {
                let weapon_type_index: i32 = trans::Trans::read_from(reader)?;
                let amount: i32 = trans::Trans::read_from(reader)?;
                Ok(Self::DropAmmo {
                    weapon_type_index,
                    amount,
                })
            }
            5 => {
                let shoot: bool = trans::Trans::read_from(reader)?;
                Ok(Self::Aim {
                    shoot,
                })
            }
            _ => Err(std::io::Error::new(
                std::io::ErrorKind::Other,
                format!("Unexpected tag {:?}", tag))),
        }
    }
}