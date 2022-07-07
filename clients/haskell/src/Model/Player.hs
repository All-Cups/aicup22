module Model.Player where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int

-- | Game's participant (team of units)
data Player = Player {
    -- | Unique id
    id :: Int32,
    -- | Number of kills
    kills :: Int32,
    -- | Total damage dealt to enemies
    damage :: Double,
    -- | Survival place (number of survivor teams currently/at the moment of death)
    place :: Int32,
    -- | Team score
    score :: Double }
    deriving Show

instance Trans Player where
    read = do
        id <- Trans.read
        kills <- Trans.read
        damage <- Trans.read
        place <- Trans.read
        score <- Trans.read
        return Player {
            id,
            kills,
            damage,
            place,
            score }
    
    write Player {
        id,
        kills,
        damage,
        place,
        score } = do
            Trans.write id
            Trans.write kills
            Trans.write damage
            Trans.write place
            Trans.write score