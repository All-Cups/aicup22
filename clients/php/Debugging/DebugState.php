<?php

namespace Debugging {
    require_once 'Debugging/Camera.php';
    require_once 'Model/Vec2.php';
    require_once 'Stream.php';

    /**
     * Renderer's state
     */
    class DebugState
    {
        /**
         * Pressed keys
         */
        public array $pressedKeys;
        /**
         * Cursor's position in game coordinates
         */
        public \Model\Vec2 $cursorWorldPosition;
        /**
         * Id of unit which is followed by the camera, or None
         */
        public ?int $lockedUnit;
        /**
         * Current camera state
         */
        public \Debugging\Camera $camera;
    
        function __construct(array $pressedKeys, \Model\Vec2 $cursorWorldPosition, ?int $lockedUnit, \Debugging\Camera $camera)
        {
            $this->pressedKeys = $pressedKeys;
            $this->cursorWorldPosition = $cursorWorldPosition;
            $this->lockedUnit = $lockedUnit;
            $this->camera = $camera;
        }
    
        /**
         * Read DebugState from input stream
         */
        public static function readFrom(\InputStream $stream): DebugState
        {
            $pressedKeys = [];
            $pressedKeysSize = $stream->readInt32();
            for ($pressedKeysIndex = 0; $pressedKeysIndex < $pressedKeysSize; $pressedKeysIndex++) {
                $pressedKeysElement = $stream->readString();
                $pressedKeys[] = $pressedKeysElement;
            }
            $cursorWorldPosition = \Model\Vec2::readFrom($stream);
            if ($stream->readBool()) {
                $lockedUnit = $stream->readInt32();
            } else {
                $lockedUnit = NULL;
            }
            $camera = \Debugging\Camera::readFrom($stream);
            return new DebugState($pressedKeys, $cursorWorldPosition, $lockedUnit, $camera);
        }
        
        /**
         * Write DebugState to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(count($this->pressedKeys));
            foreach ($this->pressedKeys as $element) {
                $stream->writeString($element);
            }
            $this->cursorWorldPosition->writeTo($stream);
            if (is_null($this->lockedUnit)) {
                $stream->writeBool(false);
            } else {
                $stream->writeBool(true);
                $stream->writeInt32($this->lockedUnit);
            }
            $this->camera->writeTo($stream);
        }
    }
}