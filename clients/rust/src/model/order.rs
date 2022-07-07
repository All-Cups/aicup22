use super::*;

/// Player's (team's) orders
#[derive(Clone, Debug)]
pub struct Order {
    /// Orders for each of your units
    pub unit_orders: std::collections::HashMap<i32, model::UnitOrder>,
}

impl trans::Trans for Order {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        self.unit_orders.write_to(writer)?;
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let unit_orders: std::collections::HashMap<i32, model::UnitOrder> = trans::Trans::read_from(reader)?;
        Ok(Self {
            unit_orders,
        })
    }
}