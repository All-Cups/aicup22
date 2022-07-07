module Model.Projectile where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Model.Vec2 (Vec2)

-- | Weapon projectile
data Projectile = Projectile {
    -- | Unique id
    id :: Int32,
    -- | Index of the weapon this projectile was shot from (starts with 0)
    weaponTypeIndex :: Int32,
    -- | Id of unit who made the shot
    shooterId :: Int32,
    -- | Id of player (team), whose unit made the shot
    shooterPlayerId :: Int32,
    -- | Current position
    position :: Vec2,
    -- | Projectile's velocity
    velocity :: Vec2,
    -- | Left time of projectile's life
    lifeTime :: Double }
    deriving Show

instance Trans Projectile where
    read = do
        id <- Trans.read
        weaponTypeIndex <- Trans.read
        shooterId <- Trans.read
        shooterPlayerId <- Trans.read
        position <- Trans.read
        velocity <- Trans.read
        lifeTime <- Trans.read
        return Projectile {
            id,
            weaponTypeIndex,
            shooterId,
            shooterPlayerId,
            position,
            velocity,
            lifeTime }
    
    write Projectile {
        id,
        weaponTypeIndex,
        shooterId,
        shooterPlayerId,
        position,
        velocity,
        lifeTime } = do
            Trans.write id
            Trans.write weaponTypeIndex
            Trans.write shooterId
            Trans.write shooterPlayerId
            Trans.write position
            Trans.write velocity
            Trans.write lifeTime