<?php

require_once 'Codegame/ClientMessage.php';
require_once 'Debugging/DebugCommand.php';
require_once 'Debugging/DebugState.php';

class DebugInterface
{
    private TcpStream $tcpStream;

    function __construct(TcpStream $tcpStream)
    {
        $this->tcpStream = $tcpStream;
    }

    public function send(\Debugging\DebugCommand $command): void
    {
        (new \Codegame\ClientMessage\DebugMessage($command))->writeTo($this->tcpStream->outputStream);
        $this->tcpStream->outputStream->flush();
    }

    public function getState(): \Debugging\DebugState
    {
        (new \Codegame\ClientMessage\RequestDebugState())->writeTo($this->tcpStream->outputStream);
        $this->tcpStream->outputStream->flush();
        return \Debugging\DebugState\readFrom($this->tcpStream->inputStream);
    }

    function addPlacedText(\Model\Vec2 $position, string $text, \Model\Vec2 $alignment, float $size, \Debugging\Color $color): void
    {
        $this->add(new \Debugging\DebugData\PlacedText($position, $text, $alignment, $size, $color));
    }
    function addCircle(\Model\Vec2 $position, float $radius, \Debugging\Color $color): void
    {
        $this->add(new \Debugging\DebugData\Circle($position, $radius, $color));
    }
    function addGradientCircle(\Model\Vec2 $position, float $radius, \Debugging\Color $innerColor, \Debugging\Color $outerColor): void
    {
        $this->add(new \Debugging\DebugData\GradientCircle($position, $radius, $innerColor, $outerColor));
    }
    function addRing(\Model\Vec2 $position, float $radius, float $width, \Debugging\Color $color): void
    {
        $this->add(new \Debugging\DebugData\Ring($position, $radius, $width, $color));
    }
    function addPie(\Model\Vec2 $position, float $radius, float $startAngle, float $endAngle, \Debugging\Color $color): void
    {
        $this->add(new \Debugging\DebugData\Pie($position, $radius, $startAngle, $endAngle, $color));
    }
    function addArc(\Model\Vec2 $position, float $radius, float $width, float $startAngle, float $endAngle, \Debugging\Color $color): void
    {
        $this->add(new \Debugging\DebugData\Arc($position, $radius, $width, $startAngle, $endAngle, $color));
    }
    function addRect(\Model\Vec2 $bottomLeft, \Model\Vec2 $size, \Debugging\Color $color): void
    {
        $this->add(new \Debugging\DebugData\Rect($bottomLeft, $size, $color));
    }
    function addPolygon(array $vertices, \Debugging\Color $color): void
    {
        $this->add(new \Debugging\DebugData\Polygon($vertices, $color));
    }
    function addGradientPolygon(array $vertices): void
    {
        $this->add(new \Debugging\DebugData\GradientPolygon($vertices));
    }
    function addSegment(\Model\Vec2 $firstEnd, \Model\Vec2 $secondEnd, float $width, \Debugging\Color $color): void
    {
        $this->add(new \Debugging\DebugData\Segment($firstEnd, $secondEnd, $width, $color));
    }
    function addGradientSegment(\Model\Vec2 $firstEnd, \Debugging\Color $firstColor, \Model\Vec2 $secondEnd, \Debugging\Color $secondColor, float $width): void
    {
        $this->add(new \Debugging\DebugData\GradientSegment($firstEnd, $firstColor, $secondEnd, $secondColor, $width));
    }
    function addPolyLine(array $vertices, float $width, \Debugging\Color $color): void
    {
        $this->add(new \Debugging\DebugData\PolyLine($vertices, $width, $color));
    }
    function addGradientPolyLine(array $vertices, float $width): void
    {
        $this->add(new \Debugging\DebugData\GradientPolyLine($vertices, $width));
    }

    function add(\Debugging\DebugData $debugData): void
    {
        $this->send(new \Debugging\DebugCommand\Add($debugData));
    }
    function clear(): void
    {
        $this->send(new \Debugging\DebugCommand\Clear());
    }
    function setAutoFlush(bool $enable): void
    {
        $this->send(new \Debugging\DebugCommand\SetAutoFlush($enable));
    }
    function flush(): void
    {
        $this->send(new \Debugging\DebugCommand\Flush());
    }
}