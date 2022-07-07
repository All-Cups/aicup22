<?php

namespace Debugging {
    require_once 'Debugging/DebugData.php';
    require_once 'Stream.php';

    /**
     * Debug commands that can be sent while debugging with the app
     */
    abstract class DebugCommand
    {
        /**
         * Write DebugCommand to output stream
         */
        abstract function writeTo(\OutputStream $stream): void;

        /**
         * Read DebugCommand from input stream
         */
        static function readFrom(\InputStream $stream): DebugCommand
        {
            $tag = $stream->readInt32();
            if ($tag == \Debugging\DebugCommand\Add::TAG) {
                return \Debugging\DebugCommand\Add::readFrom($stream);
            }
            if ($tag == \Debugging\DebugCommand\Clear::TAG) {
                return \Debugging\DebugCommand\Clear::readFrom($stream);
            }
            if ($tag == \Debugging\DebugCommand\SetAutoFlush::TAG) {
                return \Debugging\DebugCommand\SetAutoFlush::readFrom($stream);
            }
            if ($tag == \Debugging\DebugCommand\Flush::TAG) {
                return \Debugging\DebugCommand\Flush::readFrom($stream);
            }
            throw new Exception('Unexpected tag value');
        }
    }
}

namespace Debugging\DebugCommand {
    /**
     * Add debug data to current tick
     */
    class Add extends \Debugging\DebugCommand
    {
        const TAG = 0;
    
        /**
         * Data to add
         */
        public \Debugging\DebugData $debugData;
    
        function __construct(\Debugging\DebugData $debugData)
        {
            $this->debugData = $debugData;
        }
    
        /**
         * Read Add from input stream
         */
        public static function readFrom(\InputStream $stream): Add
        {
            $debugData = \Debugging\DebugData::readFrom($stream);
            return new Add($debugData);
        }
        
        /**
         * Write Add to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Add::TAG);
            $this->debugData->writeTo($stream);
        }
    }

    /**
     * Clear current tick's debug data
     */
    class Clear extends \Debugging\DebugCommand
    {
        const TAG = 1;
    
    
        function __construct()
        {
        }
    
        /**
         * Read Clear from input stream
         */
        public static function readFrom(\InputStream $stream): Clear
        {
            return new Clear();
        }
        
        /**
         * Write Clear to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Clear::TAG);
        }
    }

    /**
     * Enable/disable auto performing of commands
     */
    class SetAutoFlush extends \Debugging\DebugCommand
    {
        const TAG = 2;
    
        /**
         * Enable/disable autoflush
         */
        public bool $enable;
    
        function __construct(bool $enable)
        {
            $this->enable = $enable;
        }
    
        /**
         * Read SetAutoFlush from input stream
         */
        public static function readFrom(\InputStream $stream): SetAutoFlush
        {
            $enable = $stream->readBool();
            return new SetAutoFlush($enable);
        }
        
        /**
         * Write SetAutoFlush to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(SetAutoFlush::TAG);
            $stream->writeBool($this->enable);
        }
    }

    /**
     * Perform all previously sent commands
     */
    class Flush extends \Debugging\DebugCommand
    {
        const TAG = 3;
    
    
        function __construct()
        {
        }
    
        /**
         * Read Flush from input stream
         */
        public static function readFrom(\InputStream $stream): Flush
        {
            return new Flush();
        }
        
        /**
         * Write Flush to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(Flush::TAG);
        }
    }
}