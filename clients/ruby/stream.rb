class Stream
    @@BYTE_FORMAT_STRING = "c"
    @@INT_FORMAT_STRING = "l<"
    @@LONG_FORMAT_STRING = "q<"
    @@FLOAT_FORMAT_STRING = "e"
    @@DOUBLE_FORMAT_STRING = "E"

    # Reading primitives

    def read_bool()
        read_bytes(1).unpack(@@BYTE_FORMAT_STRING)[0] != 0
    end

    def read_int()
        read_bytes(4).unpack(@@INT_FORMAT_STRING)[0]
    end

    def read_long()
        read_bytes(8).unpack(@@LONG_FORMAT_STRING)[0]
    end

    def read_float()
        read_bytes(4).unpack(@@FLOAT_FORMAT_STRING)[0]
    end

    def read_double()
        read_bytes(8).unpack(@@DOUBLE_FORMAT_STRING)[0]
    end

    def read_string()
        length = read_int()
        read_bytes(length)
    end

    # Writing primitives

    def write_bool(value)
        write_bytes([value ? 1 : 0].pack(@@BYTE_FORMAT_STRING))
    end

    def write_int(value)
        write_bytes([value].pack(@@INT_FORMAT_STRING))
    end

    def write_long(value)
        write_bytes([value].pack(@@LONG_FORMAT_STRING))
    end

    def write_float(value)
        write_bytes([value].pack(@@FLOAT_FORMAT_STRING))
    end

    def write_double(value)
        write_bytes([value].pack(@@DOUBLE_FORMAT_STRING))
    end

    def write_string(value)
        data = value.unpack("U*")
        write_int(data.length())
        write_bytes(data.pack("C*"))
    end
end