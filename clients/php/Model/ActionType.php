<?php

namespace Model {
    require_once 'Stream.php';

    /**
     * Type of action a unit is currently performing
     */
    abstract class ActionType
    {
        /**
         * Picking up or dropping loot
         */
        const LOOTING = 0;

        /**
         * Using a shield potion
         */
        const USE_SHIELD_POTION = 1;

        /**
         * Read ActionType from input stream
         */
        public static function readFrom(\InputStream $stream): int
        {
            $result = $stream->readInt32();
            if (0 <= $result && $result < 2) {
                return $result;
            }
            throw new Exception('Unexpected tag value');
        }
    }
}