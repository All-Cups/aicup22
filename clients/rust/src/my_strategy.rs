use crate::debug_interface::DebugInterface;
use ai_cup_22::*;

pub struct MyStrategy {}

impl MyStrategy {
    pub fn new(constants: model::Constants) -> Self {
        Self {}
    }
    pub fn get_order(
        &mut self,
        game: &model::Game,
        debug_interface: Option<&mut DebugInterface>,
    ) -> model::Order {
        ai_cup_22::model::Order {
            unit_orders: std::collections::HashMap::new(),}
    }
    pub fn debug_update(
        &mut self,
        displayed_tick: i32,
        debug_interface: &mut DebugInterface,
    ) {}
    pub fn finish(&mut self) {}
}