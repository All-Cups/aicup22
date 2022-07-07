<?php

require_once 'Model/Game.php';
require_once 'Model/Order.php';
require_once 'Model/Constants.php';

class MyStrategy
{
    function __construct(\Model\Constants $constants) {}
    function getOrder(\Model\Game $game, ?DebugInterface $debugInterface): \Model\Order
    {
        return new \Model\Order([]);
    }
    function debugUpdate(DebugInterface $debug_interface) {}
    function finish() {}
}