package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Current game's state
 */
class Game {
    /**
     * Your player's id
     */
    var myId: Int
    /**
     * List of players (teams)
     */
    var players: Array<ai_cup_22.model.Player>
    /**
     * Current tick
     */
    var currentTick: Int
    /**
     * List of units visible by your team
     */
    var units: Array<ai_cup_22.model.Unit>
    /**
     * List of loot visible by your team
     */
    var loot: Array<ai_cup_22.model.Loot>
    /**
     * List of projectiles visible by your team
     */
    var projectiles: Array<ai_cup_22.model.Projectile>
    /**
     * Current state of game zone
     */
    var zone: ai_cup_22.model.Zone
    /**
     * List of sounds heard by your team during last tick
     */
    var sounds: Array<ai_cup_22.model.Sound>

    constructor(myId: Int, players: Array<ai_cup_22.model.Player>, currentTick: Int, units: Array<ai_cup_22.model.Unit>, loot: Array<ai_cup_22.model.Loot>, projectiles: Array<ai_cup_22.model.Projectile>, zone: ai_cup_22.model.Zone, sounds: Array<ai_cup_22.model.Sound>) {
        this.myId = myId
        this.players = players
        this.currentTick = currentTick
        this.units = units
        this.loot = loot
        this.projectiles = projectiles
        this.zone = zone
        this.sounds = sounds
    }

    /**
     * Write Game to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeInt(stream, myId)
        StreamUtil.writeInt(stream, players.size)
        for (playersElement in players) {
            playersElement.writeTo(stream)
        }
        StreamUtil.writeInt(stream, currentTick)
        StreamUtil.writeInt(stream, units.size)
        for (unitsElement in units) {
            unitsElement.writeTo(stream)
        }
        StreamUtil.writeInt(stream, loot.size)
        for (lootElement in loot) {
            lootElement.writeTo(stream)
        }
        StreamUtil.writeInt(stream, projectiles.size)
        for (projectilesElement in projectiles) {
            projectilesElement.writeTo(stream)
        }
        zone.writeTo(stream)
        StreamUtil.writeInt(stream, sounds.size)
        for (soundsElement in sounds) {
            soundsElement.writeTo(stream)
        }
    }

    /**
     * Get string representation of Game
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Game { ")
        stringBuilder.append("myId: ")
        stringBuilder.append(myId)
        stringBuilder.append(", ")
        stringBuilder.append("players: ")
        stringBuilder.append("[ ")
        var playersIndex = 0
        for (playersElement in players) {
            if (playersIndex != 0) {
                stringBuilder.append(", ")
            }
            stringBuilder.append(playersElement)
            playersIndex++
        }
        stringBuilder.append(" ]")
        stringBuilder.append(", ")
        stringBuilder.append("currentTick: ")
        stringBuilder.append(currentTick)
        stringBuilder.append(", ")
        stringBuilder.append("units: ")
        stringBuilder.append("[ ")
        var unitsIndex = 0
        for (unitsElement in units) {
            if (unitsIndex != 0) {
                stringBuilder.append(", ")
            }
            stringBuilder.append(unitsElement)
            unitsIndex++
        }
        stringBuilder.append(" ]")
        stringBuilder.append(", ")
        stringBuilder.append("loot: ")
        stringBuilder.append("[ ")
        var lootIndex = 0
        for (lootElement in loot) {
            if (lootIndex != 0) {
                stringBuilder.append(", ")
            }
            stringBuilder.append(lootElement)
            lootIndex++
        }
        stringBuilder.append(" ]")
        stringBuilder.append(", ")
        stringBuilder.append("projectiles: ")
        stringBuilder.append("[ ")
        var projectilesIndex = 0
        for (projectilesElement in projectiles) {
            if (projectilesIndex != 0) {
                stringBuilder.append(", ")
            }
            stringBuilder.append(projectilesElement)
            projectilesIndex++
        }
        stringBuilder.append(" ]")
        stringBuilder.append(", ")
        stringBuilder.append("zone: ")
        stringBuilder.append(zone)
        stringBuilder.append(", ")
        stringBuilder.append("sounds: ")
        stringBuilder.append("[ ")
        var soundsIndex = 0
        for (soundsElement in sounds) {
            if (soundsIndex != 0) {
                stringBuilder.append(", ")
            }
            stringBuilder.append(soundsElement)
            soundsIndex++
        }
        stringBuilder.append(" ]")
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Game from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Game {
            var myId: Int
            myId = StreamUtil.readInt(stream)
            var players: Array<ai_cup_22.model.Player>
            players = Array(StreamUtil.readInt(stream), {
                var playersElement: ai_cup_22.model.Player
                playersElement = ai_cup_22.model.Player.readFrom(stream)
                playersElement
            })
            var currentTick: Int
            currentTick = StreamUtil.readInt(stream)
            var units: Array<ai_cup_22.model.Unit>
            units = Array(StreamUtil.readInt(stream), {
                var unitsElement: ai_cup_22.model.Unit
                unitsElement = ai_cup_22.model.Unit.readFrom(stream)
                unitsElement
            })
            var loot: Array<ai_cup_22.model.Loot>
            loot = Array(StreamUtil.readInt(stream), {
                var lootElement: ai_cup_22.model.Loot
                lootElement = ai_cup_22.model.Loot.readFrom(stream)
                lootElement
            })
            var projectiles: Array<ai_cup_22.model.Projectile>
            projectiles = Array(StreamUtil.readInt(stream), {
                var projectilesElement: ai_cup_22.model.Projectile
                projectilesElement = ai_cup_22.model.Projectile.readFrom(stream)
                projectilesElement
            })
            var zone: ai_cup_22.model.Zone
            zone = ai_cup_22.model.Zone.readFrom(stream)
            var sounds: Array<ai_cup_22.model.Sound>
            sounds = Array(StreamUtil.readInt(stream), {
                var soundsElement: ai_cup_22.model.Sound
                soundsElement = ai_cup_22.model.Sound.readFrom(stream)
                soundsElement
            })
            return Game(myId, players, currentTick, units, loot, projectiles, zone, sounds)
        }
    }
}