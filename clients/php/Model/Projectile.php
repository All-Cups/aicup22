<?php

namespace Model {
    require_once 'Model/Vec2.php';
    require_once 'Stream.php';

    /**
     * Weapon projectile
     */
    class Projectile
    {
        /**
         * Unique id
         */
        public int $id;
        /**
         * Index of the weapon this projectile was shot from (starts with 0)
         */
        public int $weaponTypeIndex;
        /**
         * Id of unit who made the shot
         */
        public int $shooterId;
        /**
         * Id of player (team), whose unit made the shot
         */
        public int $shooterPlayerId;
        /**
         * Current position
         */
        public \Model\Vec2 $position;
        /**
         * Projectile's velocity
         */
        public \Model\Vec2 $velocity;
        /**
         * Left time of projectile's life
         */
        public float $lifeTime;
    
        function __construct(int $id, int $weaponTypeIndex, int $shooterId, int $shooterPlayerId, \Model\Vec2 $position, \Model\Vec2 $velocity, float $lifeTime)
        {
            $this->id = $id;
            $this->weaponTypeIndex = $weaponTypeIndex;
            $this->shooterId = $shooterId;
            $this->shooterPlayerId = $shooterPlayerId;
            $this->position = $position;
            $this->velocity = $velocity;
            $this->lifeTime = $lifeTime;
        }
    
        /**
         * Read Projectile from input stream
         */
        public static function readFrom(\InputStream $stream): Projectile
        {
            $id = $stream->readInt32();
            $weaponTypeIndex = $stream->readInt32();
            $shooterId = $stream->readInt32();
            $shooterPlayerId = $stream->readInt32();
            $position = \Model\Vec2::readFrom($stream);
            $velocity = \Model\Vec2::readFrom($stream);
            $lifeTime = $stream->readDouble();
            return new Projectile($id, $weaponTypeIndex, $shooterId, $shooterPlayerId, $position, $velocity, $lifeTime);
        }
        
        /**
         * Write Projectile to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32($this->id);
            $stream->writeInt32($this->weaponTypeIndex);
            $stream->writeInt32($this->shooterId);
            $stream->writeInt32($this->shooterPlayerId);
            $this->position->writeTo($stream);
            $this->velocity->writeTo($stream);
            $stream->writeDouble($this->lifeTime);
        }
    }
}