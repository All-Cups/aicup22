from model.game import Game
from model.order import Order
from model.constants import Constants
from typing import Optional
from debug_interface import DebugInterface


class MyStrategy:
    def __init__(self, constants: Constants):
        pass
    def get_order(self, game: Game, debug_interface: Optional[DebugInterface]) -> Order:
        return Order({})
    def debug_update(self, debug_interface: DebugInterface):
        pass
    def finish(self):
        pass