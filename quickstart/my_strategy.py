from model.game import Game
from model.order import Order
from model.constants import Constants
from typing import Optional
from debug_interface import DebugInterface


class MyStrategy:
    def __init__(self, constants: Constants):
        pass
    def get_order(self, game: Game, debug_interface: Optional[DebugInterface]) -> Order:
        orders = {}
        for unit in game.units:
            if unit.player_id != game.my_id:
                continue
            orders[unit.id] = Order(
                Vec2(-unit.position.x, -unit.position.y),
                Vec2(-unit.direction.y, unit.direction.x),
                Action.Aim(true))
        print(orders)
        return orders
    def debug_update(self, debug_interface: DebugInterface):
        pass
    def finish(self):
        pass