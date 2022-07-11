<?php

use Model\Constants;
use Model\Game;
use Model\Order;
use Model\Unit;
use Model\UnitOrder;
use Model\Vec2;

require_once 'Model/Game.php';
require_once 'Model/Order.php';
require_once 'Model/Constants.php';

class MyStrategy
{
    function __construct(Constants $constants)
    {
    }

    function getOrder(Game $game, ?DebugInterface $debugInterface): Order
    {
        $order = [];

        /** @var Unit[] $units */
        $units = $game->units;

        foreach ($units as $unit) {
            if ($unit->playerId != $game->myId) {
                continue;
            }

            $order[] = new UnitOrder(
                new Vec2(-$unit->position->x, -$unit->position->y),
                new Vec2(-$unit->direction->x, $unit->direction->y),
                new Model\ActionOrder\Aim(true)
            );
        }
        return new Order($order);
    }

    function debugUpdate(DebugInterface $debug_interface)
    {
    }

    function finish()
    {
    }
}