<?php

require_once 'Stream.php';

define('BUFFER_SIZE', 102_400);

class BufferedInputStream extends InputStream
{
    private InputStream $inner;
    private string $buffer;
    private int $bufferPos;
    function __construct(InputStream $inner)
    {
        $this->inner = $inner;
        $this->buffer = '';
        $this->bufferPos = 0;
    }
    function readAtMost(int $byteCount): string
    {
        if ($this->bufferPos == strlen($this->buffer)) {
            $this->buffer = $this->inner->readAtMost(BUFFER_SIZE);
            $this->bufferPos = 0;
        }
        $chunk = substr($this->buffer, $this->bufferPos, $byteCount);
        $this->bufferPos += strlen($chunk);
        return $chunk;
    }
}

class BufferedOutputStream extends OutputStream
{
    private OutputStream $inner;
    private string $buffer;
    function __construct(OutputStream $inner)
    {
        $this->inner = $inner;
        $this->buffer = '';
    }
    function write(string $bytes): void
    {
        $this->buffer .= $bytes;
    }
    function flush(): void
    {
        $this->inner->write($this->buffer);
        $this->inner->flush();
        $this->buffer = '';
    }
}