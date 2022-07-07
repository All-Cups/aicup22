module Model.Action where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Model.ActionType (ActionType)

-- | Action unit is currently performing
data Action = Action {
    -- | Tick when the action will be finished
    finishTick :: Int32,
    -- | Type of the action
    actionType :: ActionType }
    deriving Show

instance Trans Action where
    read = do
        finishTick <- Trans.read
        actionType <- Trans.read
        return Action {
            finishTick,
            actionType }
    
    write Action {
        finishTick,
        actionType } = do
            Trans.write finishTick
            Trans.write actionType