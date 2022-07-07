module Model.Game where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Model.Loot (Loot)
import Model.Player (Player)
import Model.Projectile (Projectile)
import Model.Sound (Sound)
import Model.Unit (Unit)
import Model.Zone (Zone)

-- | Current game's state
data Game = Game {
    -- | Your player's id
    myId :: Int32,
    -- | List of players (teams)
    players :: [Player],
    -- | Current tick
    currentTick :: Int32,
    -- | List of units visible by your team
    units :: [Unit],
    -- | List of loot visible by your team
    loot :: [Loot],
    -- | List of projectiles visible by your team
    projectiles :: [Projectile],
    -- | Current state of game zone
    zone :: Zone,
    -- | List of sounds heard by your team during last tick
    sounds :: [Sound] }
    deriving Show

instance Trans Game where
    read = do
        myId <- Trans.read
        players <- Trans.read
        currentTick <- Trans.read
        units <- Trans.read
        loot <- Trans.read
        projectiles <- Trans.read
        zone <- Trans.read
        sounds <- Trans.read
        return Game {
            myId,
            players,
            currentTick,
            units,
            loot,
            projectiles,
            zone,
            sounds }
    
    write Game {
        myId,
        players,
        currentTick,
        units,
        loot,
        projectiles,
        zone,
        sounds } = do
            Trans.write myId
            Trans.write players
            Trans.write currentTick
            Trans.write units
            Trans.write loot
            Trans.write projectiles
            Trans.write zone
            Trans.write sounds