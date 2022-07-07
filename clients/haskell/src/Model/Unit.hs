module Model.Unit where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Model.Action (Action)
import Model.Vec2 (Vec2)

-- | A unit
data Unit = Unit {
    -- | Unique id
    id :: Int32,
    -- | Id of the player (team) controlling the unit
    playerId :: Int32,
    -- | Current health
    health :: Double,
    -- | Current shield value
    shield :: Double,
    -- | Left extra lives of this unit
    extraLives :: Int32,
    -- | Current position of unit's center
    position :: Vec2,
    -- | Remaining time until unit will be spawned, or None
    remainingSpawnTime :: Maybe Double,
    -- | Current velocity
    velocity :: Vec2,
    -- | Current view direction (vector of length 1)
    direction :: Vec2,
    -- | Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
    aim :: Double,
    -- | Current action unit is performing, or None
    action :: Maybe Action,
    -- | Tick when health regeneration will start (can be less than current game tick)
    healthRegenerationStartTick :: Int32,
    -- | Index of the weapon this unit is holding (starting with 0), or None
    weapon :: Maybe Int32,
    -- | Next tick when unit can shoot again (can be less than current game tick)
    nextShotTick :: Int32,
    -- | List of ammo in unit's inventory for every weapon type
    ammo :: [Int32],
    -- | Number of shield potions in inventory
    shieldPotions :: Int32 }
    deriving Show

instance Trans Unit where
    read = do
        id <- Trans.read
        playerId <- Trans.read
        health <- Trans.read
        shield <- Trans.read
        extraLives <- Trans.read
        position <- Trans.read
        remainingSpawnTime <- Trans.read
        velocity <- Trans.read
        direction <- Trans.read
        aim <- Trans.read
        action <- Trans.read
        healthRegenerationStartTick <- Trans.read
        weapon <- Trans.read
        nextShotTick <- Trans.read
        ammo <- Trans.read
        shieldPotions <- Trans.read
        return Unit {
            id,
            playerId,
            health,
            shield,
            extraLives,
            position,
            remainingSpawnTime,
            velocity,
            direction,
            aim,
            action,
            healthRegenerationStartTick,
            weapon,
            nextShotTick,
            ammo,
            shieldPotions }
    
    write Unit {
        id,
        playerId,
        health,
        shield,
        extraLives,
        position,
        remainingSpawnTime,
        velocity,
        direction,
        aim,
        action,
        healthRegenerationStartTick,
        weapon,
        nextShotTick,
        ammo,
        shieldPotions } = do
            Trans.write id
            Trans.write playerId
            Trans.write health
            Trans.write shield
            Trans.write extraLives
            Trans.write position
            Trans.write remainingSpawnTime
            Trans.write velocity
            Trans.write direction
            Trans.write aim
            Trans.write action
            Trans.write healthRegenerationStartTick
            Trans.write weapon
            Trans.write nextShotTick
            Trans.write ammo
            Trans.write shieldPotions