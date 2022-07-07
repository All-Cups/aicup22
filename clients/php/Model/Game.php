<?php

namespace Model {
    require_once 'Model/Loot.php';
    require_once 'Model/Player.php';
    require_once 'Model/Projectile.php';
    require_once 'Model/Sound.php';
    require_once 'Model/Unit.php';
    require_once 'Model/Zone.php';
    require_once 'Stream.php';

    /**
     * Current game's state
     */
    class Game
    {
        /**
         * Your player's id
         */
        public int $myId;
        /**
         * List of players (teams)
         */
        public array $players;
        /**
         * Current tick
         */
        public int $currentTick;
        /**
         * List of units visible by your team
         */
        public array $units;
        /**
         * List of loot visible by your team
         */
        public array $loot;
        /**
         * List of projectiles visible by your team
         */
        public array $projectiles;
        /**
         * Current state of game zone
         */
        public \Model\Zone $zone;
        /**
         * List of sounds heard by your team during last tick
         */
        public array $sounds;
    
        function __construct(int $myId, array $players, int $currentTick, array $units, array $loot, array $projectiles, \Model\Zone $zone, array $sounds)
        {
            $this->myId = $myId;
            $this->players = $players;
            $this->currentTick = $currentTick;
            $this->units = $units;
            $this->loot = $loot;
            $this->projectiles = $projectiles;
            $this->zone = $zone;
            $this->sounds = $sounds;
        }
    
        /**
         * Read Game from input stream
         */
        public static function readFrom(\InputStream $stream): Game
        {
            $myId = $stream->readInt32();
            $players = [];
            $playersSize = $stream->readInt32();
            for ($playersIndex = 0; $playersIndex < $playersSize; $playersIndex++) {
                $playersElement = \Model\Player::readFrom($stream);
                $players[] = $playersElement;
            }
            $currentTick = $stream->readInt32();
            $units = [];
            $unitsSize = $stream->readInt32();
            for ($unitsIndex = 0; $unitsIndex < $unitsSize; $unitsIndex++) {
                $unitsElement = \Model\Unit::readFrom($stream);
                $units[] = $unitsElement;
            }
            $loot = [];
            $lootSize = $stream->readInt32();
            for ($lootIndex = 0; $lootIndex < $lootSize; $lootIndex++) {
                $lootElement = \Model\Loot::readFrom($stream);
                $loot[] = $lootElement;
            }
            $projectiles = [];
            $projectilesSize = $stream->readInt32();
            for ($projectilesIndex = 0; $projectilesIndex < $projectilesSize; $projectilesIndex++) {
                $projectilesElement = \Model\Projectile::readFrom($stream);
                $projectiles[] = $projectilesElement;
            }
            $zone = \Model\Zone::readFrom($stream);
            $sounds = [];
            $soundsSize = $stream->readInt32();
            for ($soundsIndex = 0; $soundsIndex < $soundsSize; $soundsIndex++) {
                $soundsElement = \Model\Sound::readFrom($stream);
                $sounds[] = $soundsElement;
            }
            return new Game($myId, $players, $currentTick, $units, $loot, $projectiles, $zone, $sounds);
        }
        
        /**
         * Write Game to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32($this->myId);
            $stream->writeInt32(count($this->players));
            foreach ($this->players as $element) {
                $element->writeTo($stream);
            }
            $stream->writeInt32($this->currentTick);
            $stream->writeInt32(count($this->units));
            foreach ($this->units as $element) {
                $element->writeTo($stream);
            }
            $stream->writeInt32(count($this->loot));
            foreach ($this->loot as $element) {
                $element->writeTo($stream);
            }
            $stream->writeInt32(count($this->projectiles));
            foreach ($this->projectiles as $element) {
                $element->writeTo($stream);
            }
            $this->zone->writeTo($stream);
            $stream->writeInt32(count($this->sounds));
            foreach ($this->sounds as $element) {
                $element->writeTo($stream);
            }
        }
    }
}