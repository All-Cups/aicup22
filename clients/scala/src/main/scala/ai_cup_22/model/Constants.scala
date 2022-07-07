package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Non changing game state
 *
 * @param ticksPerSecond Number of ticks per game second
 * @param teamSize Starting number of units in each team
 * @param initialZoneRadius Initial zone radius
 * @param zoneSpeed Speed of zone radius
 * @param zoneDamagePerSecond Damage dealt to units outside of the zone per second
 * @param spawnTime Unit spawning time
 * @param spawnCollisionDamagePerSecond Damage dealt to units trying to spawn in incorrect position per second
 * @param lootingTime Time required to perform looting actions (in seconds)
 * @param botPlayers Number of bot players (teams)
 * @param unitRadius Units' radius
 * @param unitHealth Max units' health
 * @param healthRegenerationPerSecond Health automatically restored per second
 * @param healthRegenerationDelay Time until automatic health regeneration since last health damage (in seconds)
 * @param maxShield Max value of unit's shield
 * @param spawnShield Initial value of unit's shield
 * @param extraLives Initial number of extra lives for units
 * @param lastRespawnZoneRadius Zone radius after which respawning is disabled
 * @param fieldOfView Units' field of view without aiming (in degrees)
 * @param viewDistance Units' view distance
 * @param viewBlocking Whether units' view is blocked by obstacles
 * @param rotationSpeed Unit rotation speed without aiming (degrees per second)
 * @param spawnMovementSpeed Units' movement speed while spawning
 * @param maxUnitForwardSpeed Max unit speed when walking forward
 * @param maxUnitBackwardSpeed Max unit speed when walking backward
 * @param unitAcceleration Max unit acceleration
 * @param friendlyFire Whether a unit can damage units of the same team
 * @param killScore Score given for killing enemy unit
 * @param damageScoreMultiplier Score multiplier for damaging enemy units
 * @param scorePerPlace Score given for every team killed before you
 * @param weapons List of properties of every weapon type
 * @param startingWeapon Starting weapon with which units spawn, or None
 * @param startingWeaponAmmo Ammo for starting weapon given when unit spawns
 * @param maxShieldPotionsInInventory Max number of shield potions in unit's inventory
 * @param shieldPerPotion Amount of shield restored using one potion
 * @param shieldPotionUseTime Time required to perform action of using shield potion
 * @param sounds List of properties of every sound type
 * @param stepsSoundTypeIndex Sound type index when moving (starting with 0), or None
 * @param stepsSoundTravelDistance Distance when steps sound will be 100% probability
 * @param obstacles List of obstacles on the map
 */
case class Constants(ticksPerSecond: Double, teamSize: Int, initialZoneRadius: Double, zoneSpeed: Double, zoneDamagePerSecond: Double, spawnTime: Double, spawnCollisionDamagePerSecond: Double, lootingTime: Double, botPlayers: Int, unitRadius: Double, unitHealth: Double, healthRegenerationPerSecond: Double, healthRegenerationDelay: Double, maxShield: Double, spawnShield: Double, extraLives: Int, lastRespawnZoneRadius: Double, fieldOfView: Double, viewDistance: Double, viewBlocking: Boolean, rotationSpeed: Double, spawnMovementSpeed: Double, maxUnitForwardSpeed: Double, maxUnitBackwardSpeed: Double, unitAcceleration: Double, friendlyFire: Boolean, killScore: Double, damageScoreMultiplier: Double, scorePerPlace: Double, weapons: Seq[ai_cup_22.model.WeaponProperties], startingWeapon: Option[Int], startingWeaponAmmo: Int, maxShieldPotionsInInventory: Int, shieldPerPotion: Double, shieldPotionUseTime: Double, sounds: Seq[ai_cup_22.model.SoundProperties], stepsSoundTypeIndex: Option[Int], stepsSoundTravelDistance: Double, obstacles: Seq[ai_cup_22.model.Obstacle]) {
    /**
     * Write Constants to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeDouble(stream, ticksPerSecond)
        StreamUtil.writeInt(stream, teamSize)
        StreamUtil.writeDouble(stream, initialZoneRadius)
        StreamUtil.writeDouble(stream, zoneSpeed)
        StreamUtil.writeDouble(stream, zoneDamagePerSecond)
        StreamUtil.writeDouble(stream, spawnTime)
        StreamUtil.writeDouble(stream, spawnCollisionDamagePerSecond)
        StreamUtil.writeDouble(stream, lootingTime)
        StreamUtil.writeInt(stream, botPlayers)
        StreamUtil.writeDouble(stream, unitRadius)
        StreamUtil.writeDouble(stream, unitHealth)
        StreamUtil.writeDouble(stream, healthRegenerationPerSecond)
        StreamUtil.writeDouble(stream, healthRegenerationDelay)
        StreamUtil.writeDouble(stream, maxShield)
        StreamUtil.writeDouble(stream, spawnShield)
        StreamUtil.writeInt(stream, extraLives)
        StreamUtil.writeDouble(stream, lastRespawnZoneRadius)
        StreamUtil.writeDouble(stream, fieldOfView)
        StreamUtil.writeDouble(stream, viewDistance)
        StreamUtil.writeBoolean(stream, viewBlocking)
        StreamUtil.writeDouble(stream, rotationSpeed)
        StreamUtil.writeDouble(stream, spawnMovementSpeed)
        StreamUtil.writeDouble(stream, maxUnitForwardSpeed)
        StreamUtil.writeDouble(stream, maxUnitBackwardSpeed)
        StreamUtil.writeDouble(stream, unitAcceleration)
        StreamUtil.writeBoolean(stream, friendlyFire)
        StreamUtil.writeDouble(stream, killScore)
        StreamUtil.writeDouble(stream, damageScoreMultiplier)
        StreamUtil.writeDouble(stream, scorePerPlace)
        StreamUtil.writeInt(stream, weapons.length)
        weapons.foreach { value =>
            value.writeTo(stream)
        }
        startingWeapon match {
            case None => StreamUtil.writeBoolean(stream, false)
            case Some(value) => {
                StreamUtil.writeBoolean(stream, true)
                StreamUtil.writeInt(stream, value)
            }
        }
        StreamUtil.writeInt(stream, startingWeaponAmmo)
        StreamUtil.writeInt(stream, maxShieldPotionsInInventory)
        StreamUtil.writeDouble(stream, shieldPerPotion)
        StreamUtil.writeDouble(stream, shieldPotionUseTime)
        StreamUtil.writeInt(stream, sounds.length)
        sounds.foreach { value =>
            value.writeTo(stream)
        }
        stepsSoundTypeIndex match {
            case None => StreamUtil.writeBoolean(stream, false)
            case Some(value) => {
                StreamUtil.writeBoolean(stream, true)
                StreamUtil.writeInt(stream, value)
            }
        }
        StreamUtil.writeDouble(stream, stepsSoundTravelDistance)
        StreamUtil.writeInt(stream, obstacles.length)
        obstacles.foreach { value =>
            value.writeTo(stream)
        }
    }

    /**
     * Get string representation of Constants
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Constants { ")
        stringBuilder.append("ticksPerSecond: ")
        stringBuilder.append(ticksPerSecond)
        stringBuilder.append(", ")
        stringBuilder.append("teamSize: ")
        stringBuilder.append(teamSize)
        stringBuilder.append(", ")
        stringBuilder.append("initialZoneRadius: ")
        stringBuilder.append(initialZoneRadius)
        stringBuilder.append(", ")
        stringBuilder.append("zoneSpeed: ")
        stringBuilder.append(zoneSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("zoneDamagePerSecond: ")
        stringBuilder.append(zoneDamagePerSecond)
        stringBuilder.append(", ")
        stringBuilder.append("spawnTime: ")
        stringBuilder.append(spawnTime)
        stringBuilder.append(", ")
        stringBuilder.append("spawnCollisionDamagePerSecond: ")
        stringBuilder.append(spawnCollisionDamagePerSecond)
        stringBuilder.append(", ")
        stringBuilder.append("lootingTime: ")
        stringBuilder.append(lootingTime)
        stringBuilder.append(", ")
        stringBuilder.append("botPlayers: ")
        stringBuilder.append(botPlayers)
        stringBuilder.append(", ")
        stringBuilder.append("unitRadius: ")
        stringBuilder.append(unitRadius)
        stringBuilder.append(", ")
        stringBuilder.append("unitHealth: ")
        stringBuilder.append(unitHealth)
        stringBuilder.append(", ")
        stringBuilder.append("healthRegenerationPerSecond: ")
        stringBuilder.append(healthRegenerationPerSecond)
        stringBuilder.append(", ")
        stringBuilder.append("healthRegenerationDelay: ")
        stringBuilder.append(healthRegenerationDelay)
        stringBuilder.append(", ")
        stringBuilder.append("maxShield: ")
        stringBuilder.append(maxShield)
        stringBuilder.append(", ")
        stringBuilder.append("spawnShield: ")
        stringBuilder.append(spawnShield)
        stringBuilder.append(", ")
        stringBuilder.append("extraLives: ")
        stringBuilder.append(extraLives)
        stringBuilder.append(", ")
        stringBuilder.append("lastRespawnZoneRadius: ")
        stringBuilder.append(lastRespawnZoneRadius)
        stringBuilder.append(", ")
        stringBuilder.append("fieldOfView: ")
        stringBuilder.append(fieldOfView)
        stringBuilder.append(", ")
        stringBuilder.append("viewDistance: ")
        stringBuilder.append(viewDistance)
        stringBuilder.append(", ")
        stringBuilder.append("viewBlocking: ")
        stringBuilder.append(viewBlocking)
        stringBuilder.append(", ")
        stringBuilder.append("rotationSpeed: ")
        stringBuilder.append(rotationSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("spawnMovementSpeed: ")
        stringBuilder.append(spawnMovementSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("maxUnitForwardSpeed: ")
        stringBuilder.append(maxUnitForwardSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("maxUnitBackwardSpeed: ")
        stringBuilder.append(maxUnitBackwardSpeed)
        stringBuilder.append(", ")
        stringBuilder.append("unitAcceleration: ")
        stringBuilder.append(unitAcceleration)
        stringBuilder.append(", ")
        stringBuilder.append("friendlyFire: ")
        stringBuilder.append(friendlyFire)
        stringBuilder.append(", ")
        stringBuilder.append("killScore: ")
        stringBuilder.append(killScore)
        stringBuilder.append(", ")
        stringBuilder.append("damageScoreMultiplier: ")
        stringBuilder.append(damageScoreMultiplier)
        stringBuilder.append(", ")
        stringBuilder.append("scorePerPlace: ")
        stringBuilder.append(scorePerPlace)
        stringBuilder.append(", ")
        stringBuilder.append("weapons: ")
        stringBuilder.append(weapons)
        stringBuilder.append(", ")
        stringBuilder.append("startingWeapon: ")
        stringBuilder.append(startingWeapon)
        stringBuilder.append(", ")
        stringBuilder.append("startingWeaponAmmo: ")
        stringBuilder.append(startingWeaponAmmo)
        stringBuilder.append(", ")
        stringBuilder.append("maxShieldPotionsInInventory: ")
        stringBuilder.append(maxShieldPotionsInInventory)
        stringBuilder.append(", ")
        stringBuilder.append("shieldPerPotion: ")
        stringBuilder.append(shieldPerPotion)
        stringBuilder.append(", ")
        stringBuilder.append("shieldPotionUseTime: ")
        stringBuilder.append(shieldPotionUseTime)
        stringBuilder.append(", ")
        stringBuilder.append("sounds: ")
        stringBuilder.append(sounds)
        stringBuilder.append(", ")
        stringBuilder.append("stepsSoundTypeIndex: ")
        stringBuilder.append(stepsSoundTypeIndex)
        stringBuilder.append(", ")
        stringBuilder.append("stepsSoundTravelDistance: ")
        stringBuilder.append(stepsSoundTravelDistance)
        stringBuilder.append(", ")
        stringBuilder.append("obstacles: ")
        stringBuilder.append(obstacles)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object Constants {
    /**
     * Read Constants from input stream
     */
    def readFrom(stream: java.io.InputStream): Constants = Constants(
        StreamUtil.readDouble(stream),
        StreamUtil.readInt(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readInt(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readInt(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readBoolean(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readBoolean(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        (0 until StreamUtil.readInt(stream)).map { _ =>
            ai_cup_22.model.WeaponProperties.readFrom(stream)
        },
        if (StreamUtil.readBoolean(stream)) Some(
            StreamUtil.readInt(stream)
        ) else None,
        StreamUtil.readInt(stream),
        StreamUtil.readInt(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        (0 until StreamUtil.readInt(stream)).map { _ =>
            ai_cup_22.model.SoundProperties.readFrom(stream)
        },
        if (StreamUtil.readBoolean(stream)) Some(
            StreamUtil.readInt(stream)
        ) else None,
        StreamUtil.readDouble(stream),
        (0 until StreamUtil.readInt(stream)).map { _ =>
            ai_cup_22.model.Obstacle.readFrom(stream)
        }
    )
}