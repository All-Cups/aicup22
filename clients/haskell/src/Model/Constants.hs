module Model.Constants where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Model.Obstacle (Obstacle)
import Model.SoundProperties (SoundProperties)
import Model.WeaponProperties (WeaponProperties)

-- | Non changing game state
data Constants = Constants {
    -- | Number of ticks per game second
    ticksPerSecond :: Double,
    -- | Starting number of units in each team
    teamSize :: Int32,
    -- | Initial zone radius
    initialZoneRadius :: Double,
    -- | Speed of zone radius
    zoneSpeed :: Double,
    -- | Damage dealt to units outside of the zone per second
    zoneDamagePerSecond :: Double,
    -- | Unit spawning time
    spawnTime :: Double,
    -- | Damage dealt to units trying to spawn in incorrect position per second
    spawnCollisionDamagePerSecond :: Double,
    -- | Time required to perform looting actions (in seconds)
    lootingTime :: Double,
    -- | Number of bot players (teams)
    botPlayers :: Int32,
    -- | Units' radius
    unitRadius :: Double,
    -- | Max units' health
    unitHealth :: Double,
    -- | Health automatically restored per second
    healthRegenerationPerSecond :: Double,
    -- | Time until automatic health regeneration since last health damage (in seconds)
    healthRegenerationDelay :: Double,
    -- | Max value of unit's shield
    maxShield :: Double,
    -- | Initial value of unit's shield
    spawnShield :: Double,
    -- | Initial number of extra lives for units
    extraLives :: Int32,
    -- | Zone radius after which respawning is disabled
    lastRespawnZoneRadius :: Double,
    -- | Units' field of view without aiming (in degrees)
    fieldOfView :: Double,
    -- | Units' view distance
    viewDistance :: Double,
    -- | Whether units' view is blocked by obstacles
    viewBlocking :: Bool,
    -- | Unit rotation speed without aiming (degrees per second)
    rotationSpeed :: Double,
    -- | Units' movement speed while spawning
    spawnMovementSpeed :: Double,
    -- | Max unit speed when walking forward
    maxUnitForwardSpeed :: Double,
    -- | Max unit speed when walking backward
    maxUnitBackwardSpeed :: Double,
    -- | Max unit acceleration
    unitAcceleration :: Double,
    -- | Whether a unit can damage units of the same team
    friendlyFire :: Bool,
    -- | Score given for killing enemy unit
    killScore :: Double,
    -- | Score multiplier for damaging enemy units
    damageScoreMultiplier :: Double,
    -- | Score given for every team killed before you
    scorePerPlace :: Double,
    -- | List of properties of every weapon type
    weapons :: [WeaponProperties],
    -- | Starting weapon with which units spawn, or None
    startingWeapon :: Maybe Int32,
    -- | Ammo for starting weapon given when unit spawns
    startingWeaponAmmo :: Int32,
    -- | Max number of shield potions in unit's inventory
    maxShieldPotionsInInventory :: Int32,
    -- | Amount of shield restored using one potion
    shieldPerPotion :: Double,
    -- | Time required to perform action of using shield potion
    shieldPotionUseTime :: Double,
    -- | List of properties of every sound type
    sounds :: [SoundProperties],
    -- | Sound type index when moving (starting with 0), or None
    stepsSoundTypeIndex :: Maybe Int32,
    -- | Distance when steps sound will be 100% probability
    stepsSoundTravelDistance :: Double,
    -- | List of obstacles on the map
    obstacles :: [Obstacle] }
    deriving Show

instance Trans Constants where
    read = do
        ticksPerSecond <- Trans.read
        teamSize <- Trans.read
        initialZoneRadius <- Trans.read
        zoneSpeed <- Trans.read
        zoneDamagePerSecond <- Trans.read
        spawnTime <- Trans.read
        spawnCollisionDamagePerSecond <- Trans.read
        lootingTime <- Trans.read
        botPlayers <- Trans.read
        unitRadius <- Trans.read
        unitHealth <- Trans.read
        healthRegenerationPerSecond <- Trans.read
        healthRegenerationDelay <- Trans.read
        maxShield <- Trans.read
        spawnShield <- Trans.read
        extraLives <- Trans.read
        lastRespawnZoneRadius <- Trans.read
        fieldOfView <- Trans.read
        viewDistance <- Trans.read
        viewBlocking <- Trans.read
        rotationSpeed <- Trans.read
        spawnMovementSpeed <- Trans.read
        maxUnitForwardSpeed <- Trans.read
        maxUnitBackwardSpeed <- Trans.read
        unitAcceleration <- Trans.read
        friendlyFire <- Trans.read
        killScore <- Trans.read
        damageScoreMultiplier <- Trans.read
        scorePerPlace <- Trans.read
        weapons <- Trans.read
        startingWeapon <- Trans.read
        startingWeaponAmmo <- Trans.read
        maxShieldPotionsInInventory <- Trans.read
        shieldPerPotion <- Trans.read
        shieldPotionUseTime <- Trans.read
        sounds <- Trans.read
        stepsSoundTypeIndex <- Trans.read
        stepsSoundTravelDistance <- Trans.read
        obstacles <- Trans.read
        return Constants {
            ticksPerSecond,
            teamSize,
            initialZoneRadius,
            zoneSpeed,
            zoneDamagePerSecond,
            spawnTime,
            spawnCollisionDamagePerSecond,
            lootingTime,
            botPlayers,
            unitRadius,
            unitHealth,
            healthRegenerationPerSecond,
            healthRegenerationDelay,
            maxShield,
            spawnShield,
            extraLives,
            lastRespawnZoneRadius,
            fieldOfView,
            viewDistance,
            viewBlocking,
            rotationSpeed,
            spawnMovementSpeed,
            maxUnitForwardSpeed,
            maxUnitBackwardSpeed,
            unitAcceleration,
            friendlyFire,
            killScore,
            damageScoreMultiplier,
            scorePerPlace,
            weapons,
            startingWeapon,
            startingWeaponAmmo,
            maxShieldPotionsInInventory,
            shieldPerPotion,
            shieldPotionUseTime,
            sounds,
            stepsSoundTypeIndex,
            stepsSoundTravelDistance,
            obstacles }
    
    write Constants {
        ticksPerSecond,
        teamSize,
        initialZoneRadius,
        zoneSpeed,
        zoneDamagePerSecond,
        spawnTime,
        spawnCollisionDamagePerSecond,
        lootingTime,
        botPlayers,
        unitRadius,
        unitHealth,
        healthRegenerationPerSecond,
        healthRegenerationDelay,
        maxShield,
        spawnShield,
        extraLives,
        lastRespawnZoneRadius,
        fieldOfView,
        viewDistance,
        viewBlocking,
        rotationSpeed,
        spawnMovementSpeed,
        maxUnitForwardSpeed,
        maxUnitBackwardSpeed,
        unitAcceleration,
        friendlyFire,
        killScore,
        damageScoreMultiplier,
        scorePerPlace,
        weapons,
        startingWeapon,
        startingWeaponAmmo,
        maxShieldPotionsInInventory,
        shieldPerPotion,
        shieldPotionUseTime,
        sounds,
        stepsSoundTypeIndex,
        stepsSoundTravelDistance,
        obstacles } = do
            Trans.write ticksPerSecond
            Trans.write teamSize
            Trans.write initialZoneRadius
            Trans.write zoneSpeed
            Trans.write zoneDamagePerSecond
            Trans.write spawnTime
            Trans.write spawnCollisionDamagePerSecond
            Trans.write lootingTime
            Trans.write botPlayers
            Trans.write unitRadius
            Trans.write unitHealth
            Trans.write healthRegenerationPerSecond
            Trans.write healthRegenerationDelay
            Trans.write maxShield
            Trans.write spawnShield
            Trans.write extraLives
            Trans.write lastRespawnZoneRadius
            Trans.write fieldOfView
            Trans.write viewDistance
            Trans.write viewBlocking
            Trans.write rotationSpeed
            Trans.write spawnMovementSpeed
            Trans.write maxUnitForwardSpeed
            Trans.write maxUnitBackwardSpeed
            Trans.write unitAcceleration
            Trans.write friendlyFire
            Trans.write killScore
            Trans.write damageScoreMultiplier
            Trans.write scorePerPlace
            Trans.write weapons
            Trans.write startingWeapon
            Trans.write startingWeaponAmmo
            Trans.write maxShieldPotionsInInventory
            Trans.write shieldPerPotion
            Trans.write shieldPotionUseTime
            Trans.write sounds
            Trans.write stepsSoundTypeIndex
            Trans.write stepsSoundTravelDistance
            Trans.write obstacles