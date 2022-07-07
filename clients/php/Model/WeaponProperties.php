<?php

namespace Model {
    require_once 'Stream.php';

    /**
     * Weapon properties
     */
    class WeaponProperties
    {
        /**
         * Name
         */
        public string $name;
        /**
         * Shooting speed (number of shots per second)
         */
        public float $roundsPerSecond;
        /**
         * Accuracy (spread angle) of a shot (in degrees)
         */
        public float $spread;
        /**
         * Aiming time
         */
        public float $aimTime;
        /**
         * Field of view in full aim (in degrees)
         */
        public float $aimFieldOfView;
        /**
         * Rotation speed in full aim (degrees per second)
         */
        public float $aimRotationSpeed;
        /**
         * Movement speed modifier in full aim
         */
        public float $aimMovementSpeedModifier;
        /**
         * Speed of projectiles
         */
        public float $projectileSpeed;
        /**
         * Damage of a projectile
         */
        public float $projectileDamage;
        /**
         * Projectiles' life time
         */
        public float $projectileLifeTime;
        /**
         * Index of the sound when shooting (starting with 0), or None
         */
        public ?int $shotSoundTypeIndex;
        /**
         * Index of the sound when hitting something (starting with 0), or None
         */
        public ?int $projectileHitSoundTypeIndex;
        /**
         * Max amount of ammo unit can hold in their inventory
         */
        public int $maxInventoryAmmo;
    
        function __construct(string $name, float $roundsPerSecond, float $spread, float $aimTime, float $aimFieldOfView, float $aimRotationSpeed, float $aimMovementSpeedModifier, float $projectileSpeed, float $projectileDamage, float $projectileLifeTime, ?int $shotSoundTypeIndex, ?int $projectileHitSoundTypeIndex, int $maxInventoryAmmo)
        {
            $this->name = $name;
            $this->roundsPerSecond = $roundsPerSecond;
            $this->spread = $spread;
            $this->aimTime = $aimTime;
            $this->aimFieldOfView = $aimFieldOfView;
            $this->aimRotationSpeed = $aimRotationSpeed;
            $this->aimMovementSpeedModifier = $aimMovementSpeedModifier;
            $this->projectileSpeed = $projectileSpeed;
            $this->projectileDamage = $projectileDamage;
            $this->projectileLifeTime = $projectileLifeTime;
            $this->shotSoundTypeIndex = $shotSoundTypeIndex;
            $this->projectileHitSoundTypeIndex = $projectileHitSoundTypeIndex;
            $this->maxInventoryAmmo = $maxInventoryAmmo;
        }
    
        /**
         * Read WeaponProperties from input stream
         */
        public static function readFrom(\InputStream $stream): WeaponProperties
        {
            $name = $stream->readString();
            $roundsPerSecond = $stream->readDouble();
            $spread = $stream->readDouble();
            $aimTime = $stream->readDouble();
            $aimFieldOfView = $stream->readDouble();
            $aimRotationSpeed = $stream->readDouble();
            $aimMovementSpeedModifier = $stream->readDouble();
            $projectileSpeed = $stream->readDouble();
            $projectileDamage = $stream->readDouble();
            $projectileLifeTime = $stream->readDouble();
            if ($stream->readBool()) {
                $shotSoundTypeIndex = $stream->readInt32();
            } else {
                $shotSoundTypeIndex = NULL;
            }
            if ($stream->readBool()) {
                $projectileHitSoundTypeIndex = $stream->readInt32();
            } else {
                $projectileHitSoundTypeIndex = NULL;
            }
            $maxInventoryAmmo = $stream->readInt32();
            return new WeaponProperties($name, $roundsPerSecond, $spread, $aimTime, $aimFieldOfView, $aimRotationSpeed, $aimMovementSpeedModifier, $projectileSpeed, $projectileDamage, $projectileLifeTime, $shotSoundTypeIndex, $projectileHitSoundTypeIndex, $maxInventoryAmmo);
        }
        
        /**
         * Write WeaponProperties to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeString($this->name);
            $stream->writeDouble($this->roundsPerSecond);
            $stream->writeDouble($this->spread);
            $stream->writeDouble($this->aimTime);
            $stream->writeDouble($this->aimFieldOfView);
            $stream->writeDouble($this->aimRotationSpeed);
            $stream->writeDouble($this->aimMovementSpeedModifier);
            $stream->writeDouble($this->projectileSpeed);
            $stream->writeDouble($this->projectileDamage);
            $stream->writeDouble($this->projectileLifeTime);
            if (is_null($this->shotSoundTypeIndex)) {
                $stream->writeBool(false);
            } else {
                $stream->writeBool(true);
                $stream->writeInt32($this->shotSoundTypeIndex);
            }
            if (is_null($this->projectileHitSoundTypeIndex)) {
                $stream->writeBool(false);
            } else {
                $stream->writeBool(true);
                $stream->writeInt32($this->projectileHitSoundTypeIndex);
            }
            $stream->writeInt32($this->maxInventoryAmmo);
        }
    }
}