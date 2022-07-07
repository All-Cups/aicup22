from debugging.debug_command import DebugCommand
from model.order import Order
from stream_wrapper import StreamWrapper

class ClientMessage:
    """Message sent from client"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "ClientMessage":
        """Read ClientMessage from input stream
        """
        tag = stream.read_int()
        if tag == DebugMessage.TAG:
            return ClientMessage.DebugMessage.read_from(stream)
        if tag == OrderMessage.TAG:
            return ClientMessage.OrderMessage.read_from(stream)
        if tag == DebugUpdateDone.TAG:
            return ClientMessage.DebugUpdateDone.read_from(stream)
        if tag == RequestDebugState.TAG:
            return ClientMessage.RequestDebugState.read_from(stream)
        raise Exception("Unexpected tag value")

class DebugMessage(ClientMessage):
    """Ask app to perform new debug command"""

    TAG = 0

    __slots__ = ("command",)

    command: DebugCommand

    def __init__(self, command: DebugCommand):
        self.command = command
        """Command to perform"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "DebugMessage":
        """Read DebugMessage from input stream
        """
        command = DebugCommand.read_from(stream)
        return DebugMessage(command)
    
    def write_to(self, stream: StreamWrapper):
        """Write DebugMessage to output stream
        """
        stream.write_int(self.TAG)
        self.command.write_to(stream)
    
    def __repr__(self):
        return "DebugMessage(" + \
            repr(self.command) + \
            ")"

ClientMessage.DebugMessage = DebugMessage

class OrderMessage(ClientMessage):
    """Reply for ServerMessage::GetOrder"""

    TAG = 1

    __slots__ = ("order",)

    order: Order

    def __init__(self, order: Order):
        self.order = order
        """Player's order"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "OrderMessage":
        """Read OrderMessage from input stream
        """
        order = Order.read_from(stream)
        return OrderMessage(order)
    
    def write_to(self, stream: StreamWrapper):
        """Write OrderMessage to output stream
        """
        stream.write_int(self.TAG)
        self.order.write_to(stream)
    
    def __repr__(self):
        return "OrderMessage(" + \
            repr(self.order) + \
            ")"

ClientMessage.OrderMessage = OrderMessage

class DebugUpdateDone(ClientMessage):
    """Signifies finish of the debug update"""

    TAG = 2

    __slots__ = ()


    def __init__(self):
        pass

    @staticmethod
    def read_from(stream: StreamWrapper) -> "DebugUpdateDone":
        """Read DebugUpdateDone from input stream
        """
        return DebugUpdateDone()
    
    def write_to(self, stream: StreamWrapper):
        """Write DebugUpdateDone to output stream
        """
        stream.write_int(self.TAG)
    
    def __repr__(self):
        return "DebugUpdateDone(" + \
            ")"

ClientMessage.DebugUpdateDone = DebugUpdateDone

class RequestDebugState(ClientMessage):
    """Request debug state from the app"""

    TAG = 3

    __slots__ = ()


    def __init__(self):
        pass

    @staticmethod
    def read_from(stream: StreamWrapper) -> "RequestDebugState":
        """Read RequestDebugState from input stream
        """
        return RequestDebugState()
    
    def write_to(self, stream: StreamWrapper):
        """Write RequestDebugState to output stream
        """
        stream.write_int(self.TAG)
    
    def __repr__(self):
        return "RequestDebugState(" + \
            ")"

ClientMessage.RequestDebugState = RequestDebugState