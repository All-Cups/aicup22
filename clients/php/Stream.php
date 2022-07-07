<?php

define('LITTLE_ENDIAN', pack('L', 1) === pack('V', 1));
assert(strlen(pack('g', 0.0)) == 4);
assert(strlen(pack('e', 0.0)) == 8);

abstract class InputStream
{
    abstract function readAtMost(int $byteCount): string;
    function read(int $byteCount): string
    {
        $result = '';
        while (strlen($result) < $byteCount) {
            $result .= $this->readAtMost($byteCount - strlen($result));
        }
        return $result;
    }
    function readBool(): bool
    {
        $byte = unpack('C', $this->read(1))[1];
        if ($byte == 0) {
            return false;
        } elseif ($byte == 1) {
            return true;
        } else {
            throw new Exception('bool should be 0 or 1');
        }
    }
    function readInt32(): int
    {
        $bytes = $this->read(4);
        if (!LITTLE_ENDIAN) {
            $bytes = strrev($bytes);
        }
        return unpack('l', $bytes)[1];
    }
    function readInt64(): int
    {
        $bytes = $this->read(8);
        if (!LITTLE_ENDIAN) {
            $bytes = strrev($bytes);
        }
        return unpack('q', $bytes)[1];
    }
    function readFloat32(): float
    {
        return unpack('g', $this->read(4))[1];
    }
    function readDouble(): float
    {
        return unpack('e', $this->read(8))[1];
    }
    function readString(): string
    {
        return $this->read($this->readInt32());
    }
}

abstract class OutputStream
{
    abstract function write(string $bytes): void;
    abstract function flush(): void;
    function writeBool(bool $value): void
    {
        $this->write(pack('C', $value ? 1 : 0));
    }
    function writeInt32(int $value): void
    {
        $bytes = pack('l', $value);
        if (!LITTLE_ENDIAN) {
            $bytes = strrev($bytes);
        }
        $this->write($bytes);
    }
    function writeInt64(int $value): void
    {
        $bytes = pack('q', $value);
        if (!LITTLE_ENDIAN) {
            $bytes = strrev($bytes);
        }
        $this->write($bytes);
    }
    function writeFloat32(float $value): void
    {
        $bytes = pack('g', $value);
        if (!LITTLE_ENDIAN) {
            $bytes = strrev($bytes);
        }
        $this->write($bytes);
    }
    function writeDouble(float $value): void
    {
        $bytes = pack('e', $value);
        if (!LITTLE_ENDIAN) {
            $bytes = strrev($bytes);
        }
        $this->write($bytes);
    }
    function writeString(string $value): void
    {
        $this->writeInt32(strlen($value));
        $this->write($value);
    }
}