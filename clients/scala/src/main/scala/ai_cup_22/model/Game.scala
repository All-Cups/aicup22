package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Current game's state
 *
 * @param myId Your player's id
 * @param players List of players (teams)
 * @param currentTick Current tick
 * @param units List of units visible by your team
 * @param loot List of loot visible by your team
 * @param projectiles List of projectiles visible by your team
 * @param zone Current state of game zone
 * @param sounds List of sounds heard by your team during last tick
 */
case class Game(myId: Int, players: Seq[ai_cup_22.model.Player], currentTick: Int, units: Seq[ai_cup_22.model.Unit], loot: Seq[ai_cup_22.model.Loot], projectiles: Seq[ai_cup_22.model.Projectile], zone: ai_cup_22.model.Zone, sounds: Seq[ai_cup_22.model.Sound]) {
    /**
     * Write Game to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeInt(stream, myId)
        StreamUtil.writeInt(stream, players.length)
        players.foreach { value =>
            value.writeTo(stream)
        }
        StreamUtil.writeInt(stream, currentTick)
        StreamUtil.writeInt(stream, units.length)
        units.foreach { value =>
            value.writeTo(stream)
        }
        StreamUtil.writeInt(stream, loot.length)
        loot.foreach { value =>
            value.writeTo(stream)
        }
        StreamUtil.writeInt(stream, projectiles.length)
        projectiles.foreach { value =>
            value.writeTo(stream)
        }
        zone.writeTo(stream)
        StreamUtil.writeInt(stream, sounds.length)
        sounds.foreach { value =>
            value.writeTo(stream)
        }
    }

    /**
     * Get string representation of Game
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Game { ")
        stringBuilder.append("myId: ")
        stringBuilder.append(myId)
        stringBuilder.append(", ")
        stringBuilder.append("players: ")
        stringBuilder.append(players)
        stringBuilder.append(", ")
        stringBuilder.append("currentTick: ")
        stringBuilder.append(currentTick)
        stringBuilder.append(", ")
        stringBuilder.append("units: ")
        stringBuilder.append(units)
        stringBuilder.append(", ")
        stringBuilder.append("loot: ")
        stringBuilder.append(loot)
        stringBuilder.append(", ")
        stringBuilder.append("projectiles: ")
        stringBuilder.append(projectiles)
        stringBuilder.append(", ")
        stringBuilder.append("zone: ")
        stringBuilder.append(zone)
        stringBuilder.append(", ")
        stringBuilder.append("sounds: ")
        stringBuilder.append(sounds)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object Game {
    /**
     * Read Game from input stream
     */
    def readFrom(stream: java.io.InputStream): Game = Game(
        StreamUtil.readInt(stream),
        (0 until StreamUtil.readInt(stream)).map { _ =>
            ai_cup_22.model.Player.readFrom(stream)
        },
        StreamUtil.readInt(stream),
        (0 until StreamUtil.readInt(stream)).map { _ =>
            ai_cup_22.model.Unit.readFrom(stream)
        },
        (0 until StreamUtil.readInt(stream)).map { _ =>
            ai_cup_22.model.Loot.readFrom(stream)
        },
        (0 until StreamUtil.readInt(stream)).map { _ =>
            ai_cup_22.model.Projectile.readFrom(stream)
        },
        ai_cup_22.model.Zone.readFrom(stream),
        (0 until StreamUtil.readInt(stream)).map { _ =>
            ai_cup_22.model.Sound.readFrom(stream)
        }
    )
}