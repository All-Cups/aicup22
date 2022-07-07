module model.unit;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.action;
import model.vec2;

/// A unit
struct Unit {
    /// Unique id
    int id;
    /// Id of the player (team) controlling the unit
    int playerId;
    /// Current health
    double health;
    /// Current shield value
    double shield;
    /// Left extra lives of this unit
    int extraLives;
    /// Current position of unit's center
    model.Vec2 position;
    /// Remaining time until unit will be spawned, or None
    Nullable!(double) remainingSpawnTime;
    /// Current velocity
    model.Vec2 velocity;
    /// Current view direction (vector of length 1)
    model.Vec2 direction;
    /// Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
    double aim;
    /// Current action unit is performing, or None
    Nullable!(model.Action) action;
    /// Tick when health regeneration will start (can be less than current game tick)
    int healthRegenerationStartTick;
    /// Index of the weapon this unit is holding (starting with 0), or None
    Nullable!(int) weapon;
    /// Next tick when unit can shoot again (can be less than current game tick)
    int nextShotTick;
    /// List of ammo in unit's inventory for every weapon type
    int[] ammo;
    /// Number of shield potions in inventory
    int shieldPotions;

    this(int id, int playerId, double health, double shield, int extraLives, model.Vec2 position, Nullable!(double) remainingSpawnTime, model.Vec2 velocity, model.Vec2 direction, double aim, Nullable!(model.Action) action, int healthRegenerationStartTick, Nullable!(int) weapon, int nextShotTick, int[] ammo, int shieldPotions) {
        this.id = id;
        this.playerId = playerId;
        this.health = health;
        this.shield = shield;
        this.extraLives = extraLives;
        this.position = position;
        this.remainingSpawnTime = remainingSpawnTime;
        this.velocity = velocity;
        this.direction = direction;
        this.aim = aim;
        this.action = action;
        this.healthRegenerationStartTick = healthRegenerationStartTick;
        this.weapon = weapon;
        this.nextShotTick = nextShotTick;
        this.ammo = ammo;
        this.shieldPotions = shieldPotions;
    }

    /// Read Unit from reader
    static Unit readFrom(Stream reader) {
        int id;
        id = reader.readInt();
        int playerId;
        playerId = reader.readInt();
        double health;
        health = reader.readDouble();
        double shield;
        shield = reader.readDouble();
        int extraLives;
        extraLives = reader.readInt();
        model.Vec2 position;
        position = model.Vec2.readFrom(reader);
        Nullable!(double) remainingSpawnTime;
        if (reader.readBool()) {
            remainingSpawnTime = reader.readDouble();
        } else {
            remainingSpawnTime.nullify();
        }
        model.Vec2 velocity;
        velocity = model.Vec2.readFrom(reader);
        model.Vec2 direction;
        direction = model.Vec2.readFrom(reader);
        double aim;
        aim = reader.readDouble();
        Nullable!(model.Action) action;
        if (reader.readBool()) {
            action = model.Action.readFrom(reader);
        } else {
            action.nullify();
        }
        int healthRegenerationStartTick;
        healthRegenerationStartTick = reader.readInt();
        Nullable!(int) weapon;
        if (reader.readBool()) {
            weapon = reader.readInt();
        } else {
            weapon.nullify();
        }
        int nextShotTick;
        nextShotTick = reader.readInt();
        int[] ammo;
        ammo = new int[reader.readInt()];
        for (int ammoIndex = 0; ammoIndex < ammo.length; ammoIndex++) {
            int ammoKey;
            ammoKey = reader.readInt();
            ammo[ammoIndex] = ammoKey;
        }
        int shieldPotions;
        shieldPotions = reader.readInt();
        return Unit(id, playerId, health, shield, extraLives, position, remainingSpawnTime, velocity, direction, aim, action, healthRegenerationStartTick, weapon, nextShotTick, ammo, shieldPotions);
    }

    /// Write Unit to writer
    void writeTo(Stream writer) const {
        writer.write(id);
        writer.write(playerId);
        writer.write(health);
        writer.write(shield);
        writer.write(extraLives);
        position.writeTo(writer);
        if (remainingSpawnTime.isNull()) {
            writer.write(false);
        } else {
            writer.write(true);
            auto remainingSpawnTimeValue = remainingSpawnTime.get;
            writer.write(remainingSpawnTimeValue);
        }
        velocity.writeTo(writer);
        direction.writeTo(writer);
        writer.write(aim);
        if (action.isNull()) {
            writer.write(false);
        } else {
            writer.write(true);
            auto actionValue = action.get;
            actionValue.writeTo(writer);
        }
        writer.write(healthRegenerationStartTick);
        if (weapon.isNull()) {
            writer.write(false);
        } else {
            writer.write(true);
            auto weaponValue = weapon.get;
            writer.write(weaponValue);
        }
        writer.write(nextShotTick);
        writer.write(cast(int)(ammo.length));
        foreach (ammoElement; ammo) {
            writer.write(ammoElement);
        }
        writer.write(shieldPotions);
    }
}