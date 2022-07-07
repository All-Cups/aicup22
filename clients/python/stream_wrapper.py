import struct


class StreamWrapper:
    BOOL_FORMAT_STRUCT = struct.Struct("?")
    INT_FORMAT_STRUCT = struct.Struct("<i")
    LONG_FORMAT_STRUCT = struct.Struct("<q")
    FLOAT_FORMAT_STRUCT = struct.Struct("<f")
    DOUBLE_FORMAT_STRUCT = struct.Struct("<d")

    def __init__(self, stream):
        self.stream = stream

    def flush(self):
        self.stream.flush()

    def close(self):
        self.stream.close()

    # Reading primitives

    def read_bool(self) -> bool:
        return self.BOOL_FORMAT_STRUCT.unpack(self.stream.read(1))[0]

    def read_int(self) -> int:
        return self.INT_FORMAT_STRUCT.unpack(self.stream.read(4))[0]

    def read_long(self) -> int:
        return self.LONG_FORMAT_STRUCT.unpack(self.stream.read(8))[0]

    def read_float(self) -> float:
        return self.FLOAT_FORMAT_STRUCT.unpack(self.stream.read(4))[0]

    def read_double(self) -> float:
        return self.DOUBLE_FORMAT_STRUCT.unpack(self.stream.read(8))[0]

    def read_string(self) -> str:
        length = self.read_int()
        data = self.stream.read(length)
        if len(data) != length:
            raise IOError("Unexpected EOF")
        return data.decode("utf-8")

    # Writing primitives

    def write_bool(self, value: bool):
        self.stream.write(self.BOOL_FORMAT_STRUCT.pack(value))

    def write_int(self, value: int):
        self.stream.write(self.INT_FORMAT_STRUCT.pack(value))

    def write_long(self, value: int):
        self.stream.write(self.LONG_FORMAT_STRUCT.pack(value))

    def write_float(self, value: float):
        self.stream.write(self.FLOAT_FORMAT_STRUCT.pack(value))

    def write_double(self, value: float):
        self.stream.write(self.DOUBLE_FORMAT_STRUCT.pack(value))

    def write_string(self, value: str):
        data = value.encode("utf-8")
        self.write_int(len(data))
        self.stream.write(data)
