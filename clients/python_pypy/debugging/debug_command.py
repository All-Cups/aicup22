from debugging.debug_data import DebugData
from stream_wrapper import StreamWrapper

class DebugCommand:
    """Debug commands that can be sent while debugging with the app"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "DebugCommand":
        """Read DebugCommand from input stream
        """
        tag = stream.read_int()
        if tag == Add.TAG:
            return DebugCommand.Add.read_from(stream)
        if tag == Clear.TAG:
            return DebugCommand.Clear.read_from(stream)
        if tag == SetAutoFlush.TAG:
            return DebugCommand.SetAutoFlush.read_from(stream)
        if tag == Flush.TAG:
            return DebugCommand.Flush.read_from(stream)
        raise Exception("Unexpected tag value")

class Add(DebugCommand):
    """Add debug data to current tick"""

    TAG = 0

    __slots__ = ("debug_data",)

    debug_data: DebugData

    def __init__(self, debug_data: DebugData):
        self.debug_data = debug_data
        """Data to add"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Add":
        """Read Add from input stream
        """
        debug_data = DebugData.read_from(stream)
        return Add(debug_data)
    
    def write_to(self, stream: StreamWrapper):
        """Write Add to output stream
        """
        stream.write_int(self.TAG)
        self.debug_data.write_to(stream)
    
    def __repr__(self):
        return "Add(" + \
            repr(self.debug_data) + \
            ")"

DebugCommand.Add = Add

class Clear(DebugCommand):
    """Clear current tick's debug data"""

    TAG = 1

    __slots__ = ()


    def __init__(self):
        pass

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Clear":
        """Read Clear from input stream
        """
        return Clear()
    
    def write_to(self, stream: StreamWrapper):
        """Write Clear to output stream
        """
        stream.write_int(self.TAG)
    
    def __repr__(self):
        return "Clear(" + \
            ")"

DebugCommand.Clear = Clear

class SetAutoFlush(DebugCommand):
    """Enable/disable auto performing of commands"""

    TAG = 2

    __slots__ = ("enable",)

    enable: bool

    def __init__(self, enable: bool):
        self.enable = enable
        """Enable/disable autoflush"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "SetAutoFlush":
        """Read SetAutoFlush from input stream
        """
        enable = stream.read_bool()
        return SetAutoFlush(enable)
    
    def write_to(self, stream: StreamWrapper):
        """Write SetAutoFlush to output stream
        """
        stream.write_int(self.TAG)
        stream.write_bool(self.enable)
    
    def __repr__(self):
        return "SetAutoFlush(" + \
            repr(self.enable) + \
            ")"

DebugCommand.SetAutoFlush = SetAutoFlush

class Flush(DebugCommand):
    """Perform all previously sent commands"""

    TAG = 3

    __slots__ = ()


    def __init__(self):
        pass

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Flush":
        """Read Flush from input stream
        """
        return Flush()
    
    def write_to(self, stream: StreamWrapper):
        """Write Flush to output stream
        """
        stream.write_int(self.TAG)
    
    def __repr__(self):
        return "Flush(" + \
            ")"

DebugCommand.Flush = Flush