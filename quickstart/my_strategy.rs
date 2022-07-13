use crate::debug_interface::DebugInterface;
use ai_cup_22::*;
use ai_cup_22::model::UnitOrder;
use std::collections::HashMap;

pub struct MyStrategy {}

impl MyStrategy {
    pub fn new(_constants: model::Constants) -> Self {
        Self {}
    }
    pub fn get_order(
        &mut self,
        game: &model::Game,
        _debug_interface: Option<&mut DebugInterface>,
    ) -> model::Order {
        let mut orders: HashMap<i32, UnitOrder> = HashMap::new();

        for unit in &game.units {
            if unit.player_id != game.my_id {
                continue;
            }

            orders.insert(
                unit.id,
                UnitOrder {
                    target_velocity: model::Vec2 {
                        x: -unit.position.x,
                        y: -unit.position.y,
                    },
                    target_direction: model::Vec2 {
                        x: -unit.direction.y,
                        y: unit.direction.x,
                    },
                    action: Option::from(model::ActionOrder::Aim { shoot: true }),
                },
            );
        }

        model::Order {
            unit_orders: orders,
        }
    }
    pub fn debug_update(&mut self, _displayed_tick: i32, _debug_interface: &mut DebugInterface) {}
    pub fn finish(&mut self) {}
}
