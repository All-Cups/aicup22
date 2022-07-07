<?php

namespace Model {
    require_once 'Model/Obstacle.php';
    require_once 'Model/SoundProperties.php';
    require_once 'Model/WeaponProperties.php';
    require_once 'Stream.php';

    /**
     * Non changing game state
     */
    class Constants
    {
        /**
         * Number of ticks per game second
         */
        public float $ticksPerSecond;
        /**
         * Starting number of units in each team
         */
        public int $teamSize;
        /**
         * Initial zone radius
         */
        public float $initialZoneRadius;
        /**
         * Speed of zone radius
         */
        public float $zoneSpeed;
        /**
         * Damage dealt to units outside of the zone per second
         */
        public float $zoneDamagePerSecond;
        /**
         * Unit spawning time
         */
        public float $spawnTime;
        /**
         * Damage dealt to units trying to spawn in incorrect position per second
         */
        public float $spawnCollisionDamagePerSecond;
        /**
         * Time required to perform looting actions (in seconds)
         */
        public float $lootingTime;
        /**
         * Number of bot players (teams)
         */
        public int $botPlayers;
        /**
         * Units' radius
         */
        public float $unitRadius;
        /**
         * Max units' health
         */
        public float $unitHealth;
        /**
         * Health automatically restored per second
         */
        public float $healthRegenerationPerSecond;
        /**
         * Time until automatic health regeneration since last health damage (in seconds)
         */
        public float $healthRegenerationDelay;
        /**
         * Max value of unit's shield
         */
        public float $maxShield;
        /**
         * Initial value of unit's shield
         */
        public float $spawnShield;
        /**
         * Initial number of extra lives for units
         */
        public int $extraLives;
        /**
         * Zone radius after which respawning is disabled
         */
        public float $lastRespawnZoneRadius;
        /**
         * Units' field of view without aiming (in degrees)
         */
        public float $fieldOfView;
        /**
         * Units' view distance
         */
        public float $viewDistance;
        /**
         * Whether units' view is blocked by obstacles
         */
        public bool $viewBlocking;
        /**
         * Unit rotation speed without aiming (degrees per second)
         */
        public float $rotationSpeed;
        /**
         * Units' movement speed while spawning
         */
        public float $spawnMovementSpeed;
        /**
         * Max unit speed when walking forward
         */
        public float $maxUnitForwardSpeed;
        /**
         * Max unit speed when walking backward
         */
        public float $maxUnitBackwardSpeed;
        /**
         * Max unit acceleration
         */
        public float $unitAcceleration;
        /**
         * Whether a unit can damage units of the same team
         */
        public bool $friendlyFire;
        /**
         * Score given for killing enemy unit
         */
        public float $killScore;
        /**
         * Score multiplier for damaging enemy units
         */
        public float $damageScoreMultiplier;
        /**
         * Score given for every team killed before you
         */
        public float $scorePerPlace;
        /**
         * List of properties of every weapon type
         */
        public array $weapons;
        /**
         * Starting weapon with which units spawn, or None
         */
        public ?int $startingWeapon;
        /**
         * Ammo for starting weapon given when unit spawns
         */
        public int $startingWeaponAmmo;
        /**
         * Max number of shield potions in unit's inventory
         */
        public int $maxShieldPotionsInInventory;
        /**
         * Amount of shield restored using one potion
         */
        public float $shieldPerPotion;
        /**
         * Time required to perform action of using shield potion
         */
        public float $shieldPotionUseTime;
        /**
         * List of properties of every sound type
         */
        public array $sounds;
        /**
         * Sound type index when moving (starting with 0), or None
         */
        public ?int $stepsSoundTypeIndex;
        /**
         * Distance when steps sound will be 100% probability
         */
        public float $stepsSoundTravelDistance;
        /**
         * List of obstacles on the map
         */
        public array $obstacles;
    
        function __construct(float $ticksPerSecond, int $teamSize, float $initialZoneRadius, float $zoneSpeed, float $zoneDamagePerSecond, float $spawnTime, float $spawnCollisionDamagePerSecond, float $lootingTime, int $botPlayers, float $unitRadius, float $unitHealth, float $healthRegenerationPerSecond, float $healthRegenerationDelay, float $maxShield, float $spawnShield, int $extraLives, float $lastRespawnZoneRadius, float $fieldOfView, float $viewDistance, bool $viewBlocking, float $rotationSpeed, float $spawnMovementSpeed, float $maxUnitForwardSpeed, float $maxUnitBackwardSpeed, float $unitAcceleration, bool $friendlyFire, float $killScore, float $damageScoreMultiplier, float $scorePerPlace, array $weapons, ?int $startingWeapon, int $startingWeaponAmmo, int $maxShieldPotionsInInventory, float $shieldPerPotion, float $shieldPotionUseTime, array $sounds, ?int $stepsSoundTypeIndex, float $stepsSoundTravelDistance, array $obstacles)
        {
            $this->ticksPerSecond = $ticksPerSecond;
            $this->teamSize = $teamSize;
            $this->initialZoneRadius = $initialZoneRadius;
            $this->zoneSpeed = $zoneSpeed;
            $this->zoneDamagePerSecond = $zoneDamagePerSecond;
            $this->spawnTime = $spawnTime;
            $this->spawnCollisionDamagePerSecond = $spawnCollisionDamagePerSecond;
            $this->lootingTime = $lootingTime;
            $this->botPlayers = $botPlayers;
            $this->unitRadius = $unitRadius;
            $this->unitHealth = $unitHealth;
            $this->healthRegenerationPerSecond = $healthRegenerationPerSecond;
            $this->healthRegenerationDelay = $healthRegenerationDelay;
            $this->maxShield = $maxShield;
            $this->spawnShield = $spawnShield;
            $this->extraLives = $extraLives;
            $this->lastRespawnZoneRadius = $lastRespawnZoneRadius;
            $this->fieldOfView = $fieldOfView;
            $this->viewDistance = $viewDistance;
            $this->viewBlocking = $viewBlocking;
            $this->rotationSpeed = $rotationSpeed;
            $this->spawnMovementSpeed = $spawnMovementSpeed;
            $this->maxUnitForwardSpeed = $maxUnitForwardSpeed;
            $this->maxUnitBackwardSpeed = $maxUnitBackwardSpeed;
            $this->unitAcceleration = $unitAcceleration;
            $this->friendlyFire = $friendlyFire;
            $this->killScore = $killScore;
            $this->damageScoreMultiplier = $damageScoreMultiplier;
            $this->scorePerPlace = $scorePerPlace;
            $this->weapons = $weapons;
            $this->startingWeapon = $startingWeapon;
            $this->startingWeaponAmmo = $startingWeaponAmmo;
            $this->maxShieldPotionsInInventory = $maxShieldPotionsInInventory;
            $this->shieldPerPotion = $shieldPerPotion;
            $this->shieldPotionUseTime = $shieldPotionUseTime;
            $this->sounds = $sounds;
            $this->stepsSoundTypeIndex = $stepsSoundTypeIndex;
            $this->stepsSoundTravelDistance = $stepsSoundTravelDistance;
            $this->obstacles = $obstacles;
        }
    
        /**
         * Read Constants from input stream
         */
        public static function readFrom(\InputStream $stream): Constants
        {
            $ticksPerSecond = $stream->readDouble();
            $teamSize = $stream->readInt32();
            $initialZoneRadius = $stream->readDouble();
            $zoneSpeed = $stream->readDouble();
            $zoneDamagePerSecond = $stream->readDouble();
            $spawnTime = $stream->readDouble();
            $spawnCollisionDamagePerSecond = $stream->readDouble();
            $lootingTime = $stream->readDouble();
            $botPlayers = $stream->readInt32();
            $unitRadius = $stream->readDouble();
            $unitHealth = $stream->readDouble();
            $healthRegenerationPerSecond = $stream->readDouble();
            $healthRegenerationDelay = $stream->readDouble();
            $maxShield = $stream->readDouble();
            $spawnShield = $stream->readDouble();
            $extraLives = $stream->readInt32();
            $lastRespawnZoneRadius = $stream->readDouble();
            $fieldOfView = $stream->readDouble();
            $viewDistance = $stream->readDouble();
            $viewBlocking = $stream->readBool();
            $rotationSpeed = $stream->readDouble();
            $spawnMovementSpeed = $stream->readDouble();
            $maxUnitForwardSpeed = $stream->readDouble();
            $maxUnitBackwardSpeed = $stream->readDouble();
            $unitAcceleration = $stream->readDouble();
            $friendlyFire = $stream->readBool();
            $killScore = $stream->readDouble();
            $damageScoreMultiplier = $stream->readDouble();
            $scorePerPlace = $stream->readDouble();
            $weapons = [];
            $weaponsSize = $stream->readInt32();
            for ($weaponsIndex = 0; $weaponsIndex < $weaponsSize; $weaponsIndex++) {
                $weaponsElement = \Model\WeaponProperties::readFrom($stream);
                $weapons[] = $weaponsElement;
            }
            if ($stream->readBool()) {
                $startingWeapon = $stream->readInt32();
            } else {
                $startingWeapon = NULL;
            }
            $startingWeaponAmmo = $stream->readInt32();
            $maxShieldPotionsInInventory = $stream->readInt32();
            $shieldPerPotion = $stream->readDouble();
            $shieldPotionUseTime = $stream->readDouble();
            $sounds = [];
            $soundsSize = $stream->readInt32();
            for ($soundsIndex = 0; $soundsIndex < $soundsSize; $soundsIndex++) {
                $soundsElement = \Model\SoundProperties::readFrom($stream);
                $sounds[] = $soundsElement;
            }
            if ($stream->readBool()) {
                $stepsSoundTypeIndex = $stream->readInt32();
            } else {
                $stepsSoundTypeIndex = NULL;
            }
            $stepsSoundTravelDistance = $stream->readDouble();
            $obstacles = [];
            $obstaclesSize = $stream->readInt32();
            for ($obstaclesIndex = 0; $obstaclesIndex < $obstaclesSize; $obstaclesIndex++) {
                $obstaclesElement = \Model\Obstacle::readFrom($stream);
                $obstacles[] = $obstaclesElement;
            }
            return new Constants($ticksPerSecond, $teamSize, $initialZoneRadius, $zoneSpeed, $zoneDamagePerSecond, $spawnTime, $spawnCollisionDamagePerSecond, $lootingTime, $botPlayers, $unitRadius, $unitHealth, $healthRegenerationPerSecond, $healthRegenerationDelay, $maxShield, $spawnShield, $extraLives, $lastRespawnZoneRadius, $fieldOfView, $viewDistance, $viewBlocking, $rotationSpeed, $spawnMovementSpeed, $maxUnitForwardSpeed, $maxUnitBackwardSpeed, $unitAcceleration, $friendlyFire, $killScore, $damageScoreMultiplier, $scorePerPlace, $weapons, $startingWeapon, $startingWeaponAmmo, $maxShieldPotionsInInventory, $shieldPerPotion, $shieldPotionUseTime, $sounds, $stepsSoundTypeIndex, $stepsSoundTravelDistance, $obstacles);
        }
        
        /**
         * Write Constants to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeDouble($this->ticksPerSecond);
            $stream->writeInt32($this->teamSize);
            $stream->writeDouble($this->initialZoneRadius);
            $stream->writeDouble($this->zoneSpeed);
            $stream->writeDouble($this->zoneDamagePerSecond);
            $stream->writeDouble($this->spawnTime);
            $stream->writeDouble($this->spawnCollisionDamagePerSecond);
            $stream->writeDouble($this->lootingTime);
            $stream->writeInt32($this->botPlayers);
            $stream->writeDouble($this->unitRadius);
            $stream->writeDouble($this->unitHealth);
            $stream->writeDouble($this->healthRegenerationPerSecond);
            $stream->writeDouble($this->healthRegenerationDelay);
            $stream->writeDouble($this->maxShield);
            $stream->writeDouble($this->spawnShield);
            $stream->writeInt32($this->extraLives);
            $stream->writeDouble($this->lastRespawnZoneRadius);
            $stream->writeDouble($this->fieldOfView);
            $stream->writeDouble($this->viewDistance);
            $stream->writeBool($this->viewBlocking);
            $stream->writeDouble($this->rotationSpeed);
            $stream->writeDouble($this->spawnMovementSpeed);
            $stream->writeDouble($this->maxUnitForwardSpeed);
            $stream->writeDouble($this->maxUnitBackwardSpeed);
            $stream->writeDouble($this->unitAcceleration);
            $stream->writeBool($this->friendlyFire);
            $stream->writeDouble($this->killScore);
            $stream->writeDouble($this->damageScoreMultiplier);
            $stream->writeDouble($this->scorePerPlace);
            $stream->writeInt32(count($this->weapons));
            foreach ($this->weapons as $element) {
                $element->writeTo($stream);
            }
            if (is_null($this->startingWeapon)) {
                $stream->writeBool(false);
            } else {
                $stream->writeBool(true);
                $stream->writeInt32($this->startingWeapon);
            }
            $stream->writeInt32($this->startingWeaponAmmo);
            $stream->writeInt32($this->maxShieldPotionsInInventory);
            $stream->writeDouble($this->shieldPerPotion);
            $stream->writeDouble($this->shieldPotionUseTime);
            $stream->writeInt32(count($this->sounds));
            foreach ($this->sounds as $element) {
                $element->writeTo($stream);
            }
            if (is_null($this->stepsSoundTypeIndex)) {
                $stream->writeBool(false);
            } else {
                $stream->writeBool(true);
                $stream->writeInt32($this->stepsSoundTypeIndex);
            }
            $stream->writeDouble($this->stepsSoundTravelDistance);
            $stream->writeInt32(count($this->obstacles));
            foreach ($this->obstacles as $element) {
                $element->writeTo($stream);
            }
        }
    }
}