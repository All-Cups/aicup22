module Model.Order where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Data.Map
import Model.UnitOrder (UnitOrder)

-- | Player's (team's) orders
data Order = Order {
    -- | Orders for each of your units
    unitOrders :: Map Int32 UnitOrder }
    deriving Show

instance Trans Order where
    read = do
        unitOrders <- Trans.read
        return Order {
            unitOrders }
    
    write Order {
        unitOrders } = do
            Trans.write unitOrders