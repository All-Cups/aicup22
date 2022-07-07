from model.unit_order import UnitOrder
from stream_wrapper import StreamWrapper
from typing import Dict

class Order:
    """Player's (team's) orders"""

    __slots__ = ("unit_orders",)

    unit_orders: Dict[int, UnitOrder]

    def __init__(self, unit_orders: Dict[int, UnitOrder]):
        self.unit_orders = unit_orders
        """Orders for each of your units"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Order":
        """Read Order from input stream
        """
        unit_orders = {}
        for _ in range(stream.read_int()):
            unit_orders_key = stream.read_int()
            unit_orders_value = UnitOrder.read_from(stream)
            unit_orders[unit_orders_key] = unit_orders_value
        return Order(unit_orders)
    
    def write_to(self, stream: StreamWrapper):
        """Write Order to output stream
        """
        stream.write_int(len(self.unit_orders))
        for key, value in self.unit_orders.items():
            stream.write_int(key)
            value.write_to(stream)
    
    def __repr__(self):
        return "Order(" + \
            repr(self.unit_orders) + \
            ")"