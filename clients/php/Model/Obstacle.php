<?php

namespace Model {
    require_once 'Model/Vec2.php';
    require_once 'Stream.php';

    /**
     * An obstacle on the map
     */
    class Obstacle
    {
        /**
         * Unique id
         */
        public int $id;
        /**
         * Center position
         */
        public \Model\Vec2 $position;
        /**
         * Obstacle's radius
         */
        public float $radius;
        /**
         * Whether units can see through this obstacle, or it blocks the view
         */
        public bool $canSeeThrough;
        /**
         * Whether projectiles can go through this obstacle
         */
        public bool $canShootThrough;
    
        function __construct(int $id, \Model\Vec2 $position, float $radius, bool $canSeeThrough, bool $canShootThrough)
        {
            $this->id = $id;
            $this->position = $position;
            $this->radius = $radius;
            $this->canSeeThrough = $canSeeThrough;
            $this->canShootThrough = $canShootThrough;
        }
    
        /**
         * Read Obstacle from input stream
         */
        public static function readFrom(\InputStream $stream): Obstacle
        {
            $id = $stream->readInt32();
            $position = \Model\Vec2::readFrom($stream);
            $radius = $stream->readDouble();
            $canSeeThrough = $stream->readBool();
            $canShootThrough = $stream->readBool();
            return new Obstacle($id, $position, $radius, $canSeeThrough, $canShootThrough);
        }
        
        /**
         * Write Obstacle to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32($this->id);
            $this->position->writeTo($stream);
            $stream->writeDouble($this->radius);
            $stream->writeBool($this->canSeeThrough);
            $stream->writeBool($this->canShootThrough);
        }
    }
}