package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * A unit
 */
public class Unit {
    /**
     * Unique id
     */
    private int id;

    /**
     * Unique id
     */
    public int getId() {
        return id;
    }

    /**
     * Unique id
     */
    public void setId(int value) {
        this.id = value;
    }
    /**
     * Id of the player (team) controlling the unit
     */
    private int playerId;

    /**
     * Id of the player (team) controlling the unit
     */
    public int getPlayerId() {
        return playerId;
    }

    /**
     * Id of the player (team) controlling the unit
     */
    public void setPlayerId(int value) {
        this.playerId = value;
    }
    /**
     * Current health
     */
    private double health;

    /**
     * Current health
     */
    public double getHealth() {
        return health;
    }

    /**
     * Current health
     */
    public void setHealth(double value) {
        this.health = value;
    }
    /**
     * Current shield value
     */
    private double shield;

    /**
     * Current shield value
     */
    public double getShield() {
        return shield;
    }

    /**
     * Current shield value
     */
    public void setShield(double value) {
        this.shield = value;
    }
    /**
     * Left extra lives of this unit
     */
    private int extraLives;

    /**
     * Left extra lives of this unit
     */
    public int getExtraLives() {
        return extraLives;
    }

    /**
     * Left extra lives of this unit
     */
    public void setExtraLives(int value) {
        this.extraLives = value;
    }
    /**
     * Current position of unit's center
     */
    private ai_cup_22.model.Vec2 position;

    /**
     * Current position of unit's center
     */
    public ai_cup_22.model.Vec2 getPosition() {
        return position;
    }

    /**
     * Current position of unit's center
     */
    public void setPosition(ai_cup_22.model.Vec2 value) {
        this.position = value;
    }
    /**
     * Remaining time until unit will be spawned, or None
     */
    private Double remainingSpawnTime;

    /**
     * Remaining time until unit will be spawned, or None
     */
    public Double getRemainingSpawnTime() {
        return remainingSpawnTime;
    }

    /**
     * Remaining time until unit will be spawned, or None
     */
    public void setRemainingSpawnTime(Double value) {
        this.remainingSpawnTime = value;
    }
    /**
     * Current velocity
     */
    private ai_cup_22.model.Vec2 velocity;

    /**
     * Current velocity
     */
    public ai_cup_22.model.Vec2 getVelocity() {
        return velocity;
    }

    /**
     * Current velocity
     */
    public void setVelocity(ai_cup_22.model.Vec2 value) {
        this.velocity = value;
    }
    /**
     * Current view direction (vector of length 1)
     */
    private ai_cup_22.model.Vec2 direction;

    /**
     * Current view direction (vector of length 1)
     */
    public ai_cup_22.model.Vec2 getDirection() {
        return direction;
    }

    /**
     * Current view direction (vector of length 1)
     */
    public void setDirection(ai_cup_22.model.Vec2 value) {
        this.direction = value;
    }
    /**
     * Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
     */
    private double aim;

    /**
     * Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
     */
    public double getAim() {
        return aim;
    }

    /**
     * Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
     */
    public void setAim(double value) {
        this.aim = value;
    }
    /**
     * Current action unit is performing, or None
     */
    private ai_cup_22.model.Action action;

    /**
     * Current action unit is performing, or None
     */
    public ai_cup_22.model.Action getAction() {
        return action;
    }

    /**
     * Current action unit is performing, or None
     */
    public void setAction(ai_cup_22.model.Action value) {
        this.action = value;
    }
    /**
     * Tick when health regeneration will start (can be less than current game tick)
     */
    private int healthRegenerationStartTick;

    /**
     * Tick when health regeneration will start (can be less than current game tick)
     */
    public int getHealthRegenerationStartTick() {
        return healthRegenerationStartTick;
    }

    /**
     * Tick when health regeneration will start (can be less than current game tick)
     */
    public void setHealthRegenerationStartTick(int value) {
        this.healthRegenerationStartTick = value;
    }
    /**
     * Index of the weapon this unit is holding (starting with 0), or None
     */
    private Integer weapon;

    /**
     * Index of the weapon this unit is holding (starting with 0), or None
     */
    public Integer getWeapon() {
        return weapon;
    }

    /**
     * Index of the weapon this unit is holding (starting with 0), or None
     */
    public void setWeapon(Integer value) {
        this.weapon = value;
    }
    /**
     * Next tick when unit can shoot again (can be less than current game tick)
     */
    private int nextShotTick;

    /**
     * Next tick when unit can shoot again (can be less than current game tick)
     */
    public int getNextShotTick() {
        return nextShotTick;
    }

    /**
     * Next tick when unit can shoot again (can be less than current game tick)
     */
    public void setNextShotTick(int value) {
        this.nextShotTick = value;
    }
    /**
     * List of ammo in unit's inventory for every weapon type
     */
    private int[] ammo;

    /**
     * List of ammo in unit's inventory for every weapon type
     */
    public int[] getAmmo() {
        return ammo;
    }

    /**
     * List of ammo in unit's inventory for every weapon type
     */
    public void setAmmo(int[] value) {
        this.ammo = value;
    }
    /**
     * Number of shield potions in inventory
     */
    private int shieldPotions;

    /**
     * Number of shield potions in inventory
     */
    public int getShieldPotions() {
        return shieldPotions;
    }

    /**
     * Number of shield potions in inventory
     */
    public void setShieldPotions(int value) {
        this.shieldPotions = value;
    }

    public Unit(int id, int playerId, double health, double shield, int extraLives, ai_cup_22.model.Vec2 position, Double remainingSpawnTime, ai_cup_22.model.Vec2 velocity, ai_cup_22.model.Vec2 direction, double aim, ai_cup_22.model.Action action, int healthRegenerationStartTick, Integer weapon, int nextShotTick, int[] ammo, int shieldPotions) {
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

    /**
     * Read Unit from input stream
     */
    public static Unit readFrom(java.io.InputStream stream) throws java.io.IOException {
        int id;
        id = StreamUtil.readInt(stream);
        int playerId;
        playerId = StreamUtil.readInt(stream);
        double health;
        health = StreamUtil.readDouble(stream);
        double shield;
        shield = StreamUtil.readDouble(stream);
        int extraLives;
        extraLives = StreamUtil.readInt(stream);
        ai_cup_22.model.Vec2 position;
        position = ai_cup_22.model.Vec2.readFrom(stream);
        Double remainingSpawnTime;
        if (StreamUtil.readBoolean(stream)) {
            remainingSpawnTime = StreamUtil.readDouble(stream);
        } else {
            remainingSpawnTime = null;
        }
        ai_cup_22.model.Vec2 velocity;
        velocity = ai_cup_22.model.Vec2.readFrom(stream);
        ai_cup_22.model.Vec2 direction;
        direction = ai_cup_22.model.Vec2.readFrom(stream);
        double aim;
        aim = StreamUtil.readDouble(stream);
        ai_cup_22.model.Action action;
        if (StreamUtil.readBoolean(stream)) {
            action = ai_cup_22.model.Action.readFrom(stream);
        } else {
            action = null;
        }
        int healthRegenerationStartTick;
        healthRegenerationStartTick = StreamUtil.readInt(stream);
        Integer weapon;
        if (StreamUtil.readBoolean(stream)) {
            weapon = StreamUtil.readInt(stream);
        } else {
            weapon = null;
        }
        int nextShotTick;
        nextShotTick = StreamUtil.readInt(stream);
        int[] ammo;
        ammo = new int[StreamUtil.readInt(stream)];
        for (int ammoIndex = 0; ammoIndex < ammo.length; ammoIndex++) {
            int ammoElement;
            ammoElement = StreamUtil.readInt(stream);
            ammo[ammoIndex] = ammoElement;
        }
        int shieldPotions;
        shieldPotions = StreamUtil.readInt(stream);
        return new Unit(id, playerId, health, shield, extraLives, position, remainingSpawnTime, velocity, direction, aim, action, healthRegenerationStartTick, weapon, nextShotTick, ammo, shieldPotions);
    }

    /**
     * Write Unit to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeInt(stream, id);
        StreamUtil.writeInt(stream, playerId);
        StreamUtil.writeDouble(stream, health);
        StreamUtil.writeDouble(stream, shield);
        StreamUtil.writeInt(stream, extraLives);
        position.writeTo(stream);
        if (remainingSpawnTime == null) {
            StreamUtil.writeBoolean(stream, false);
        } else {
            StreamUtil.writeBoolean(stream, true);
            StreamUtil.writeDouble(stream, remainingSpawnTime);
        }
        velocity.writeTo(stream);
        direction.writeTo(stream);
        StreamUtil.writeDouble(stream, aim);
        if (action == null) {
            StreamUtil.writeBoolean(stream, false);
        } else {
            StreamUtil.writeBoolean(stream, true);
            action.writeTo(stream);
        }
        StreamUtil.writeInt(stream, healthRegenerationStartTick);
        if (weapon == null) {
            StreamUtil.writeBoolean(stream, false);
        } else {
            StreamUtil.writeBoolean(stream, true);
            StreamUtil.writeInt(stream, weapon);
        }
        StreamUtil.writeInt(stream, nextShotTick);
        StreamUtil.writeInt(stream, ammo.length);
        for (int ammoElement : ammo) {
            StreamUtil.writeInt(stream, ammoElement);
        }
        StreamUtil.writeInt(stream, shieldPotions);
    }

    /**
     * Get string representation of Unit
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Unit { ");
        stringBuilder.append("id: ");
        stringBuilder.append(String.valueOf(id));
        stringBuilder.append(", ");
        stringBuilder.append("playerId: ");
        stringBuilder.append(String.valueOf(playerId));
        stringBuilder.append(", ");
        stringBuilder.append("health: ");
        stringBuilder.append(String.valueOf(health));
        stringBuilder.append(", ");
        stringBuilder.append("shield: ");
        stringBuilder.append(String.valueOf(shield));
        stringBuilder.append(", ");
        stringBuilder.append("extraLives: ");
        stringBuilder.append(String.valueOf(extraLives));
        stringBuilder.append(", ");
        stringBuilder.append("position: ");
        stringBuilder.append(String.valueOf(position));
        stringBuilder.append(", ");
        stringBuilder.append("remainingSpawnTime: ");
        stringBuilder.append(String.valueOf(remainingSpawnTime));
        stringBuilder.append(", ");
        stringBuilder.append("velocity: ");
        stringBuilder.append(String.valueOf(velocity));
        stringBuilder.append(", ");
        stringBuilder.append("direction: ");
        stringBuilder.append(String.valueOf(direction));
        stringBuilder.append(", ");
        stringBuilder.append("aim: ");
        stringBuilder.append(String.valueOf(aim));
        stringBuilder.append(", ");
        stringBuilder.append("action: ");
        stringBuilder.append(String.valueOf(action));
        stringBuilder.append(", ");
        stringBuilder.append("healthRegenerationStartTick: ");
        stringBuilder.append(String.valueOf(healthRegenerationStartTick));
        stringBuilder.append(", ");
        stringBuilder.append("weapon: ");
        stringBuilder.append(String.valueOf(weapon));
        stringBuilder.append(", ");
        stringBuilder.append("nextShotTick: ");
        stringBuilder.append(String.valueOf(nextShotTick));
        stringBuilder.append(", ");
        stringBuilder.append("ammo: ");
        stringBuilder.append("[ ");
        for (int ammoIndex = 0; ammoIndex < ammo.length; ammoIndex++) {
            if (ammoIndex != 0) {
                stringBuilder.append(", ");
            }
            int ammoElement = ammo[ammoIndex];
            stringBuilder.append(String.valueOf(ammoElement));
        }
        stringBuilder.append(" ]");
        stringBuilder.append(", ");
        stringBuilder.append("shieldPotions: ");
        stringBuilder.append(String.valueOf(shieldPotions));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}