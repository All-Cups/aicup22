module MyStrategy (MyStrategy, createMyStrategy, getOrder) where

import Control.Monad.Trans.State.Lazy (State)
import Model.Constants
import Model.Game
import Model.Order
import Data.Int
import Data.Map
import Model.UnitOrder

data MyStrategy = MyStrategy

createMyStrategy :: Constants -> MyStrategy
createMyStrategy _ = MyStrategy

getOrder :: Game -> State MyStrategy Order
getOrder _ = return Order { unitOrders = empty }