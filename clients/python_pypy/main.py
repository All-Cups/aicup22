from codegame.server_message import ServerMessage
from codegame.client_message import ClientMessage
from stream_wrapper import StreamWrapper
from my_strategy import MyStrategy
from debug_interface import DebugInterface
import socket
import sys


class Runner:
    def __init__(self, host, port, token):
        self.socket = socket.socket()
        self.socket.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, True)
        self.socket.connect((host, port))
        socket_stream = self.socket.makefile('rwb')
        self.reader = StreamWrapper(socket_stream)
        self.writer = StreamWrapper(socket_stream)
        self.token = token
        self.writer.write_string(self.token)
        self.writer.write_int(1)
        self.writer.write_int(0)
        self.writer.write_int(1)
        self.writer.flush()

    def run(self):
        strategy = None
        debug_interface = DebugInterface(self.reader, self.writer)
        while True:
            message = ServerMessage.read_from(self.reader)
            if isinstance(message, ServerMessage.UpdateConstants):
                strategy = MyStrategy(message.constants)
            elif isinstance(message, ServerMessage.GetOrder):
                order = strategy.get_order(message.player_view, debug_interface if message.debug_available else None)
                ClientMessage.OrderMessage(order).write_to(self.writer)
                self.writer.flush()
            elif isinstance(message, ServerMessage.Finish):
                strategy.finish();
                break
            elif isinstance(message, ServerMessage.DebugUpdate):
                strategy.debug_update(debug_interface)
                ClientMessage.DebugUpdateDone().write_to(self.writer)
                self.writer.flush()
            else:
                raise Exception("Unexpected server message")


if __name__ == "__main__":
    host = "127.0.0.1" if len(sys.argv) < 2 else sys.argv[1]
    port = 31001 if len(sys.argv) < 3 else int(sys.argv[2])
    token = "0000000000000000" if len(sys.argv) < 4 else sys.argv[3]
    Runner(host, port, token).run()