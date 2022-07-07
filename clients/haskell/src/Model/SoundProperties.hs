module Model.SoundProperties where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)


-- | Sound properties
data SoundProperties = SoundProperties {
    -- | Name
    name :: String,
    -- | Distance from which the sound can be heard
    distance :: Double,
    -- | Offset modifier
    offset :: Double }
    deriving Show

instance Trans SoundProperties where
    read = do
        name <- Trans.read
        distance <- Trans.read
        offset <- Trans.read
        return SoundProperties {
            name,
            distance,
            offset }
    
    write SoundProperties {
        name,
        distance,
        offset } = do
            Trans.write name
            Trans.write distance
            Trans.write offset