require 'stringio'
require 'socket'
require_relative 'stream'

class TcpStream < Stream
    def initialize(host, port)
        @socket = TCPSocket.open(host, port)
        @socket.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)
        @read_buffer = StringIO.new('', 'a+b')
        @write_buffer = ''
    end

    def close
        @socket.close
    end

    def read_bytes(byte_count)
        data = @read_buffer.read(byte_count) || ''
        while data.length < byte_count
            data << @socket.recv(102_400)
        end
        if data.length > byte_count
            @read_buffer = StringIO.new(data[byte_count..-1], 'a+b')
            data = data[0..byte_count-1]
        end
        data
    end

    def write_bytes(data)
        @write_buffer << data
    end

    def flush
        @socket.write(@write_buffer)
        @write_buffer = ''
        @socket.flush
    end
end