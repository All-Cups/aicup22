package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * A unit
 *
 * @param id Unique id
 * @param playerId Id of the player (team) controlling the unit
 * @param health Current health
 * @param shield Current shield value
 * @param extraLives Left extra lives of this unit
 * @param position Current position of unit's center
 * @param remainingSpawnTime Remaining time until unit will be spawned, or None
 * @param velocity Current velocity
 * @param direction Current view direction (vector of length 1)
 * @param aim Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
 * @param action Current action unit is performing, or None
 * @param healthRegenerationStartTick Tick when health regeneration will start (can be less than current game tick)
 * @param weapon Index of the weapon this unit is holding (starting with 0), or None
 * @param nextShotTick Next tick when unit can shoot again (can be less than current game tick)
 * @param ammo List of ammo in unit's inventory for every weapon type
 * @param shieldPotions Number of shield potions in inventory
 */
case class Unit(id: Int, playerId: Int, health: Double, shield: Double, extraLives: Int, position: ai_cup_22.model.Vec2, remainingSpawnTime: Option[Double], velocity: ai_cup_22.model.Vec2, direction: ai_cup_22.model.Vec2, aim: Double, action: Option[ai_cup_22.model.Action], healthRegenerationStartTick: Int, weapon: Option[Int], nextShotTick: Int, ammo: Seq[Int], shieldPotions: Int) {
    /**
     * Write Unit to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeInt(stream, id)
        StreamUtil.writeInt(stream, playerId)
        StreamUtil.writeDouble(stream, health)
        StreamUtil.writeDouble(stream, shield)
        StreamUtil.writeInt(stream, extraLives)
        position.writeTo(stream)
        remainingSpawnTime match {
            case None => StreamUtil.writeBoolean(stream, false)
            case Some(value) => {
                StreamUtil.writeBoolean(stream, true)
                StreamUtil.writeDouble(stream, value)
            }
        }
        velocity.writeTo(stream)
        direction.writeTo(stream)
        StreamUtil.writeDouble(stream, aim)
        action match {
            case None => StreamUtil.writeBoolean(stream, false)
            case Some(value) => {
                StreamUtil.writeBoolean(stream, true)
                value.writeTo(stream)
            }
        }
        StreamUtil.writeInt(stream, healthRegenerationStartTick)
        weapon match {
            case None => StreamUtil.writeBoolean(stream, false)
            case Some(value) => {
                StreamUtil.writeBoolean(stream, true)
                StreamUtil.writeInt(stream, value)
            }
        }
        StreamUtil.writeInt(stream, nextShotTick)
        StreamUtil.writeInt(stream, ammo.length)
        ammo.foreach { value =>
            StreamUtil.writeInt(stream, value)
        }
        StreamUtil.writeInt(stream, shieldPotions)
    }

    /**
     * Get string representation of Unit
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Unit { ")
        stringBuilder.append("id: ")
        stringBuilder.append(id)
        stringBuilder.append(", ")
        stringBuilder.append("playerId: ")
        stringBuilder.append(playerId)
        stringBuilder.append(", ")
        stringBuilder.append("health: ")
        stringBuilder.append(health)
        stringBuilder.append(", ")
        stringBuilder.append("shield: ")
        stringBuilder.append(shield)
        stringBuilder.append(", ")
        stringBuilder.append("extraLives: ")
        stringBuilder.append(extraLives)
        stringBuilder.append(", ")
        stringBuilder.append("position: ")
        stringBuilder.append(position)
        stringBuilder.append(", ")
        stringBuilder.append("remainingSpawnTime: ")
        stringBuilder.append(remainingSpawnTime)
        stringBuilder.append(", ")
        stringBuilder.append("velocity: ")
        stringBuilder.append(velocity)
        stringBuilder.append(", ")
        stringBuilder.append("direction: ")
        stringBuilder.append(direction)
        stringBuilder.append(", ")
        stringBuilder.append("aim: ")
        stringBuilder.append(aim)
        stringBuilder.append(", ")
        stringBuilder.append("action: ")
        stringBuilder.append(action)
        stringBuilder.append(", ")
        stringBuilder.append("healthRegenerationStartTick: ")
        stringBuilder.append(healthRegenerationStartTick)
        stringBuilder.append(", ")
        stringBuilder.append("weapon: ")
        stringBuilder.append(weapon)
        stringBuilder.append(", ")
        stringBuilder.append("nextShotTick: ")
        stringBuilder.append(nextShotTick)
        stringBuilder.append(", ")
        stringBuilder.append("ammo: ")
        stringBuilder.append(ammo)
        stringBuilder.append(", ")
        stringBuilder.append("shieldPotions: ")
        stringBuilder.append(shieldPotions)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object Unit {
    /**
     * Read Unit from input stream
     */
    def readFrom(stream: java.io.InputStream): Unit = Unit(
        StreamUtil.readInt(stream),
        StreamUtil.readInt(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readDouble(stream),
        StreamUtil.readInt(stream),
        ai_cup_22.model.Vec2.readFrom(stream),
        if (StreamUtil.readBoolean(stream)) Some(
            StreamUtil.readDouble(stream)
        ) else None,
        ai_cup_22.model.Vec2.readFrom(stream),
        ai_cup_22.model.Vec2.readFrom(stream),
        StreamUtil.readDouble(stream),
        if (StreamUtil.readBoolean(stream)) Some(
            ai_cup_22.model.Action.readFrom(stream)
        ) else None,
        StreamUtil.readInt(stream),
        if (StreamUtil.readBoolean(stream)) Some(
            StreamUtil.readInt(stream)
        ) else None,
        StreamUtil.readInt(stream),
        (0 until StreamUtil.readInt(stream)).map { _ =>
            StreamUtil.readInt(stream)
        },
        StreamUtil.readInt(stream)
    )
}