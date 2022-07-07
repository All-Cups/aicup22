<?php

namespace Model {
    require_once 'Model/Action.php';
    require_once 'Model/Vec2.php';
    require_once 'Stream.php';

    /**
     * A unit
     */
    class Unit
    {
        /**
         * Unique id
         */
        public int $id;
        /**
         * Id of the player (team) controlling the unit
         */
        public int $playerId;
        /**
         * Current health
         */
        public float $health;
        /**
         * Current shield value
         */
        public float $shield;
        /**
         * Left extra lives of this unit
         */
        public int $extraLives;
        /**
         * Current position of unit's center
         */
        public \Model\Vec2 $position;
        /**
         * Remaining time until unit will be spawned, or None
         */
        public ?float $remainingSpawnTime;
        /**
         * Current velocity
         */
        public \Model\Vec2 $velocity;
        /**
         * Current view direction (vector of length 1)
         */
        public \Model\Vec2 $direction;
        /**
         * Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
         */
        public float $aim;
        /**
         * Current action unit is performing, or None
         */
        public ?\Model\Action $action;
        /**
         * Tick when health regeneration will start (can be less than current game tick)
         */
        public int $healthRegenerationStartTick;
        /**
         * Index of the weapon this unit is holding (starting with 0), or None
         */
        public ?int $weapon;
        /**
         * Next tick when unit can shoot again (can be less than current game tick)
         */
        public int $nextShotTick;
        /**
         * List of ammo in unit's inventory for every weapon type
         */
        public array $ammo;
        /**
         * Number of shield potions in inventory
         */
        public int $shieldPotions;
    
        function __construct(int $id, int $playerId, float $health, float $shield, int $extraLives, \Model\Vec2 $position, ?float $remainingSpawnTime, \Model\Vec2 $velocity, \Model\Vec2 $direction, float $aim, ?\Model\Action $action, int $healthRegenerationStartTick, ?int $weapon, int $nextShotTick, array $ammo, int $shieldPotions)
        {
            $this->id = $id;
            $this->playerId = $playerId;
            $this->health = $health;
            $this->shield = $shield;
            $this->extraLives = $extraLives;
            $this->position = $position;
            $this->remainingSpawnTime = $remainingSpawnTime;
            $this->velocity = $velocity;
            $this->direction = $direction;
            $this->aim = $aim;
            $this->action = $action;
            $this->healthRegenerationStartTick = $healthRegenerationStartTick;
            $this->weapon = $weapon;
            $this->nextShotTick = $nextShotTick;
            $this->ammo = $ammo;
            $this->shieldPotions = $shieldPotions;
        }
    
        /**
         * Read Unit from input stream
         */
        public static function readFrom(\InputStream $stream): Unit
        {
            $id = $stream->readInt32();
            $playerId = $stream->readInt32();
            $health = $stream->readDouble();
            $shield = $stream->readDouble();
            $extraLives = $stream->readInt32();
            $position = \Model\Vec2::readFrom($stream);
            if ($stream->readBool()) {
                $remainingSpawnTime = $stream->readDouble();
            } else {
                $remainingSpawnTime = NULL;
            }
            $velocity = \Model\Vec2::readFrom($stream);
            $direction = \Model\Vec2::readFrom($stream);
            $aim = $stream->readDouble();
            if ($stream->readBool()) {
                $action = \Model\Action::readFrom($stream);
            } else {
                $action = NULL;
            }
            $healthRegenerationStartTick = $stream->readInt32();
            if ($stream->readBool()) {
                $weapon = $stream->readInt32();
            } else {
                $weapon = NULL;
            }
            $nextShotTick = $stream->readInt32();
            $ammo = [];
            $ammoSize = $stream->readInt32();
            for ($ammoIndex = 0; $ammoIndex < $ammoSize; $ammoIndex++) {
                $ammoElement = $stream->readInt32();
                $ammo[] = $ammoElement;
            }
            $shieldPotions = $stream->readInt32();
            return new Unit($id, $playerId, $health, $shield, $extraLives, $position, $remainingSpawnTime, $velocity, $direction, $aim, $action, $healthRegenerationStartTick, $weapon, $nextShotTick, $ammo, $shieldPotions);
        }
        
        /**
         * Write Unit to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32($this->id);
            $stream->writeInt32($this->playerId);
            $stream->writeDouble($this->health);
            $stream->writeDouble($this->shield);
            $stream->writeInt32($this->extraLives);
            $this->position->writeTo($stream);
            if (is_null($this->remainingSpawnTime)) {
                $stream->writeBool(false);
            } else {
                $stream->writeBool(true);
                $stream->writeDouble($this->remainingSpawnTime);
            }
            $this->velocity->writeTo($stream);
            $this->direction->writeTo($stream);
            $stream->writeDouble($this->aim);
            if (is_null($this->action)) {
                $stream->writeBool(false);
            } else {
                $stream->writeBool(true);
                $this->action->writeTo($stream);
            }
            $stream->writeInt32($this->healthRegenerationStartTick);
            if (is_null($this->weapon)) {
                $stream->writeBool(false);
            } else {
                $stream->writeBool(true);
                $stream->writeInt32($this->weapon);
            }
            $stream->writeInt32($this->nextShotTick);
            $stream->writeInt32(count($this->ammo));
            foreach ($this->ammo as $element) {
                $stream->writeInt32($element);
            }
            $stream->writeInt32($this->shieldPotions);
        }
    }
}