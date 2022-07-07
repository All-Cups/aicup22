module Model.WeaponProperties where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int

-- | Weapon properties
data WeaponProperties = WeaponProperties {
    -- | Name
    name :: String,
    -- | Shooting speed (number of shots per second)
    roundsPerSecond :: Double,
    -- | Accuracy (spread angle) of a shot (in degrees)
    spread :: Double,
    -- | Aiming time
    aimTime :: Double,
    -- | Field of view in full aim (in degrees)
    aimFieldOfView :: Double,
    -- | Rotation speed in full aim (degrees per second)
    aimRotationSpeed :: Double,
    -- | Movement speed modifier in full aim
    aimMovementSpeedModifier :: Double,
    -- | Speed of projectiles
    projectileSpeed :: Double,
    -- | Damage of a projectile
    projectileDamage :: Double,
    -- | Projectiles' life time
    projectileLifeTime :: Double,
    -- | Index of the sound when shooting (starting with 0), or None
    shotSoundTypeIndex :: Maybe Int32,
    -- | Index of the sound when hitting something (starting with 0), or None
    projectileHitSoundTypeIndex :: Maybe Int32,
    -- | Max amount of ammo unit can hold in their inventory
    maxInventoryAmmo :: Int32 }
    deriving Show

instance Trans WeaponProperties where
    read = do
        name <- Trans.read
        roundsPerSecond <- Trans.read
        spread <- Trans.read
        aimTime <- Trans.read
        aimFieldOfView <- Trans.read
        aimRotationSpeed <- Trans.read
        aimMovementSpeedModifier <- Trans.read
        projectileSpeed <- Trans.read
        projectileDamage <- Trans.read
        projectileLifeTime <- Trans.read
        shotSoundTypeIndex <- Trans.read
        projectileHitSoundTypeIndex <- Trans.read
        maxInventoryAmmo <- Trans.read
        return WeaponProperties {
            name,
            roundsPerSecond,
            spread,
            aimTime,
            aimFieldOfView,
            aimRotationSpeed,
            aimMovementSpeedModifier,
            projectileSpeed,
            projectileDamage,
            projectileLifeTime,
            shotSoundTypeIndex,
            projectileHitSoundTypeIndex,
            maxInventoryAmmo }
    
    write WeaponProperties {
        name,
        roundsPerSecond,
        spread,
        aimTime,
        aimFieldOfView,
        aimRotationSpeed,
        aimMovementSpeedModifier,
        projectileSpeed,
        projectileDamage,
        projectileLifeTime,
        shotSoundTypeIndex,
        projectileHitSoundTypeIndex,
        maxInventoryAmmo } = do
            Trans.write name
            Trans.write roundsPerSecond
            Trans.write spread
            Trans.write aimTime
            Trans.write aimFieldOfView
            Trans.write aimRotationSpeed
            Trans.write aimMovementSpeedModifier
            Trans.write projectileSpeed
            Trans.write projectileDamage
            Trans.write projectileLifeTime
            Trans.write shotSoundTypeIndex
            Trans.write projectileHitSoundTypeIndex
            Trans.write maxInventoryAmmo