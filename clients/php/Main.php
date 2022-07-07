<?php

require_once 'Codegame/ServerMessage.php';
require_once 'Codegame/ClientMessage.php';
require_once 'TcpStream.php';
require_once 'MyStrategy.php';
require_once 'DebugInterface.php';

class Runner
{
    private TcpStream $tcpStream;

    function __construct(string $host, int $port, string $token)
    {
        $this->tcpStream = new TcpStream($host, $port);
        $this->tcpStream->outputStream->writeString($token);
        $this->tcpStream->outputStream->writeInt32(1);
        $this->tcpStream->outputStream->writeInt32(0);
        $this->tcpStream->outputStream->writeInt32(1);
        $this->tcpStream->outputStream->flush();
    }

    function run()
    {
        $strategy = NULL;
        $debugInterface = new DebugInterface($this->tcpStream);
        while (true) {
            $message = \Codegame\ServerMessage::readFrom($this->tcpStream->inputStream);
            if ($message instanceof \Codegame\ServerMessage\UpdateConstants) {
                $strategy = new MyStrategy($message->constants);
            } else if ($message instanceof \Codegame\ServerMessage\GetOrder) {
                $order = $strategy->getOrder($message->playerView, $message->debugAvailable ? $debugInterface : NULL);
                (new \Codegame\ClientMessage\OrderMessage($order))->writeTo($this->tcpStream->outputStream);
                $this->tcpStream->outputStream->flush();
            } else if ($message instanceof \Codegame\ServerMessage\Finish) {
                $strategy->finish();
                break;
            } else if ($message instanceof \Codegame\ServerMessage\DebugUpdate) {
                $strategy->debugUpdate($debugInterface);
                (new \Codegame\ClientMessage\DebugUpdateDone())->writeTo($this->tcpStream->outputStream);
                $this->tcpStream->outputStream->flush();
            } else {
                throw new Exception("Unexpected server message");
            }
        }
    }
}

$host = $argc < 2 ? "127.0.0.1" : $argv[1];
$port = $argc < 3 ? 31001 : intval($argv[2]);
$token = $argc < 4 ? "0000000000000000" : $argv[3];

(new Runner($host, $port, $token))->run();