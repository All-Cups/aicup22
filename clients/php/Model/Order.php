<?php

namespace Model {
    require_once 'Model/UnitOrder.php';
    require_once 'Stream.php';

    /**
     * Player's (team's) orders
     */
    class Order
    {
        /**
         * Orders for each of your units
         */
        public array $unitOrders;
    
        function __construct(array $unitOrders)
        {
            $this->unitOrders = $unitOrders;
        }
    
        /**
         * Read Order from input stream
         */
        public static function readFrom(\InputStream $stream): Order
        {
            $unitOrders = [];
            $unitOrdersSize = $stream->readInt32();
            for ($unitOrdersIndex = 0; $unitOrdersIndex < $unitOrdersSize; $unitOrdersIndex++) {
                $unitOrdersKey = $stream->readInt32();
                $unitOrdersValue = \Model\UnitOrder::readFrom($stream);
                $unitOrders[$unitOrdersKey] = $unitOrdersValue;
            }
            return new Order($unitOrders);
        }
        
        /**
         * Write Order to output stream
         */
        public function writeTo(\OutputStream $stream): void
        {
            $stream->writeInt32(count($this->unitOrders));
            foreach ($this->unitOrders as $key => $value) {
                $stream->writeInt32($key);
                $value->writeTo($stream);
            }
        }
    }
}