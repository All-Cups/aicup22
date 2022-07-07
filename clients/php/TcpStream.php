<?php

require_once 'Stream.php';
require_once 'BufferedStream.php';

class TcpStream
{
    private $socket;
    public InputStream $inputStream;
    public OutputStream $outputStream;
    function __construct(string $host, int $port)
    {
        $this->socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
        if (!socket_set_option($this->socket, SOL_TCP, TCP_NODELAY, 1)) {
            throw new Exception("Failed to set TCP_NODELAY");
        }
        if (!socket_connect($this->socket, $host, $port)) {
            throw new Exception("Failed to connect");
        }
        $this->inputStream = new BufferedInputStream(new TcpInputStream($this->socket));
        $this->outputStream = new BufferedOutputStream(new TcpOutputStream($this->socket));
    }
    function __destruct()
    {
        socket_close($this->socket);
    }
}

class TcpInputStream extends InputStream
{
    private $socket;
    function __construct($socket)
    {
        $this->socket = $socket;
    }
    public function readAtMost(int $byteCount): string
    {
        return socket_read($this->socket, $byteCount);
    }
}

class TcpOutputStream extends OutputStream
{
    private $socket;
    function __construct($socket)
    {
        $this->socket = $socket;
    }
    public function write(string $bytes): void
    {
        socket_write($this->socket, $bytes);
    }
    public function flush(): void
    {
    }
}