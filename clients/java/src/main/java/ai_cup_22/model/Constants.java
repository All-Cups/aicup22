package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Non changing game state
 */
public class Constants {
    /**
     * Number of ticks per game second
     */
    private double ticksPerSecond;

    /**
     * Number of ticks per game second
     */
    public double getTicksPerSecond() {
        return ticksPerSecond;
    }

    /**
     * Number of ticks per game second
     */
    public void setTicksPerSecond(double value) {
        this.ticksPerSecond = value;
    }
    /**
     * Starting number of units in each team
     */
    private int teamSize;

    /**
     * Starting number of units in each team
     */
    public int getTeamSize() {
        return teamSize;
    }

    /**
     * Starting number of units in each team
     */
    public void setTeamSize(int value) {
        this.teamSize = value;
    }
    /**
     * Initial zone radius
     */
    private double initialZoneRadius;

    /**
     * Initial zone radius
     */
    public double getInitialZoneRadius() {
        return initialZoneRadius;
    }

    /**
     * Initial zone radius
     */
    public void setInitialZoneRadius(double value) {
        this.initialZoneRadius = value;
    }
    /**
     * Speed of zone radius
     */
    private double zoneSpeed;

    /**
     * Speed of zone radius
     */
    public double getZoneSpeed() {
        return zoneSpeed;
    }

    /**
     * Speed of zone radius
     */
    public void setZoneSpeed(double value) {
        this.zoneSpeed = value;
    }
    /**
     * Damage dealt to units outside of the zone per second
     */
    private double zoneDamagePerSecond;

    /**
     * Damage dealt to units outside of the zone per second
     */
    public double getZoneDamagePerSecond() {
        return zoneDamagePerSecond;
    }

    /**
     * Damage dealt to units outside of the zone per second
     */
    public void setZoneDamagePerSecond(double value) {
        this.zoneDamagePerSecond = value;
    }
    /**
     * Unit spawning time
     */
    private double spawnTime;

    /**
     * Unit spawning time
     */
    public double getSpawnTime() {
        return spawnTime;
    }

    /**
     * Unit spawning time
     */
    public void setSpawnTime(double value) {
        this.spawnTime = value;
    }
    /**
     * Damage dealt to units trying to spawn in incorrect position per second
     */
    private double spawnCollisionDamagePerSecond;

    /**
     * Damage dealt to units trying to spawn in incorrect position per second
     */
    public double getSpawnCollisionDamagePerSecond() {
        return spawnCollisionDamagePerSecond;
    }

    /**
     * Damage dealt to units trying to spawn in incorrect position per second
     */
    public void setSpawnCollisionDamagePerSecond(double value) {
        this.spawnCollisionDamagePerSecond = value;
    }
    /**
     * Time required to perform looting actions (in seconds)
     */
    private double lootingTime;

    /**
     * Time required to perform looting actions (in seconds)
     */
    public double getLootingTime() {
        return lootingTime;
    }

    /**
     * Time required to perform looting actions (in seconds)
     */
    public void setLootingTime(double value) {
        this.lootingTime = value;
    }
    /**
     * Number of bot players (teams)
     */
    private int botPlayers;

    /**
     * Number of bot players (teams)
     */
    public int getBotPlayers() {
        return botPlayers;
    }

    /**
     * Number of bot players (teams)
     */
    public void setBotPlayers(int value) {
        this.botPlayers = value;
    }
    /**
     * Units' radius
     */
    private double unitRadius;

    /**
     * Units' radius
     */
    public double getUnitRadius() {
        return unitRadius;
    }

    /**
     * Units' radius
     */
    public void setUnitRadius(double value) {
        this.unitRadius = value;
    }
    /**
     * Max units' health
     */
    private double unitHealth;

    /**
     * Max units' health
     */
    public double getUnitHealth() {
        return unitHealth;
    }

    /**
     * Max units' health
     */
    public void setUnitHealth(double value) {
        this.unitHealth = value;
    }
    /**
     * Health automatically restored per second
     */
    private double healthRegenerationPerSecond;

    /**
     * Health automatically restored per second
     */
    public double getHealthRegenerationPerSecond() {
        return healthRegenerationPerSecond;
    }

    /**
     * Health automatically restored per second
     */
    public void setHealthRegenerationPerSecond(double value) {
        this.healthRegenerationPerSecond = value;
    }
    /**
     * Time until automatic health regeneration since last health damage (in seconds)
     */
    private double healthRegenerationDelay;

    /**
     * Time until automatic health regeneration since last health damage (in seconds)
     */
    public double getHealthRegenerationDelay() {
        return healthRegenerationDelay;
    }

    /**
     * Time until automatic health regeneration since last health damage (in seconds)
     */
    public void setHealthRegenerationDelay(double value) {
        this.healthRegenerationDelay = value;
    }
    /**
     * Max value of unit's shield
     */
    private double maxShield;

    /**
     * Max value of unit's shield
     */
    public double getMaxShield() {
        return maxShield;
    }

    /**
     * Max value of unit's shield
     */
    public void setMaxShield(double value) {
        this.maxShield = value;
    }
    /**
     * Initial value of unit's shield
     */
    private double spawnShield;

    /**
     * Initial value of unit's shield
     */
    public double getSpawnShield() {
        return spawnShield;
    }

    /**
     * Initial value of unit's shield
     */
    public void setSpawnShield(double value) {
        this.spawnShield = value;
    }
    /**
     * Initial number of extra lives for units
     */
    private int extraLives;

    /**
     * Initial number of extra lives for units
     */
    public int getExtraLives() {
        return extraLives;
    }

    /**
     * Initial number of extra lives for units
     */
    public void setExtraLives(int value) {
        this.extraLives = value;
    }
    /**
     * Zone radius after which respawning is disabled
     */
    private double lastRespawnZoneRadius;

    /**
     * Zone radius after which respawning is disabled
     */
    public double getLastRespawnZoneRadius() {
        return lastRespawnZoneRadius;
    }

    /**
     * Zone radius after which respawning is disabled
     */
    public void setLastRespawnZoneRadius(double value) {
        this.lastRespawnZoneRadius = value;
    }
    /**
     * Units' field of view without aiming (in degrees)
     */
    private double fieldOfView;

    /**
     * Units' field of view without aiming (in degrees)
     */
    public double getFieldOfView() {
        return fieldOfView;
    }

    /**
     * Units' field of view without aiming (in degrees)
     */
    public void setFieldOfView(double value) {
        this.fieldOfView = value;
    }
    /**
     * Units' view distance
     */
    private double viewDistance;

    /**
     * Units' view distance
     */
    public double getViewDistance() {
        return viewDistance;
    }

    /**
     * Units' view distance
     */
    public void setViewDistance(double value) {
        this.viewDistance = value;
    }
    /**
     * Whether units' view is blocked by obstacles
     */
    private boolean viewBlocking;

    /**
     * Whether units' view is blocked by obstacles
     */
    public boolean isViewBlocking() {
        return viewBlocking;
    }

    /**
     * Whether units' view is blocked by obstacles
     */
    public void setViewBlocking(boolean value) {
        this.viewBlocking = value;
    }
    /**
     * Unit rotation speed without aiming (degrees per second)
     */
    private double rotationSpeed;

    /**
     * Unit rotation speed without aiming (degrees per second)
     */
    public double getRotationSpeed() {
        return rotationSpeed;
    }

    /**
     * Unit rotation speed without aiming (degrees per second)
     */
    public void setRotationSpeed(double value) {
        this.rotationSpeed = value;
    }
    /**
     * Units' movement speed while spawning
     */
    private double spawnMovementSpeed;

    /**
     * Units' movement speed while spawning
     */
    public double getSpawnMovementSpeed() {
        return spawnMovementSpeed;
    }

    /**
     * Units' movement speed while spawning
     */
    public void setSpawnMovementSpeed(double value) {
        this.spawnMovementSpeed = value;
    }
    /**
     * Max unit speed when walking forward
     */
    private double maxUnitForwardSpeed;

    /**
     * Max unit speed when walking forward
     */
    public double getMaxUnitForwardSpeed() {
        return maxUnitForwardSpeed;
    }

    /**
     * Max unit speed when walking forward
     */
    public void setMaxUnitForwardSpeed(double value) {
        this.maxUnitForwardSpeed = value;
    }
    /**
     * Max unit speed when walking backward
     */
    private double maxUnitBackwardSpeed;

    /**
     * Max unit speed when walking backward
     */
    public double getMaxUnitBackwardSpeed() {
        return maxUnitBackwardSpeed;
    }

    /**
     * Max unit speed when walking backward
     */
    public void setMaxUnitBackwardSpeed(double value) {
        this.maxUnitBackwardSpeed = value;
    }
    /**
     * Max unit acceleration
     */
    private double unitAcceleration;

    /**
     * Max unit acceleration
     */
    public double getUnitAcceleration() {
        return unitAcceleration;
    }

    /**
     * Max unit acceleration
     */
    public void setUnitAcceleration(double value) {
        this.unitAcceleration = value;
    }
    /**
     * Whether a unit can damage units of the same team
     */
    private boolean friendlyFire;

    /**
     * Whether a unit can damage units of the same team
     */
    public boolean isFriendlyFire() {
        return friendlyFire;
    }

    /**
     * Whether a unit can damage units of the same team
     */
    public void setFriendlyFire(boolean value) {
        this.friendlyFire = value;
    }
    /**
     * Score given for killing enemy unit
     */
    private double killScore;

    /**
     * Score given for killing enemy unit
     */
    public double getKillScore() {
        return killScore;
    }

    /**
     * Score given for killing enemy unit
     */
    public void setKillScore(double value) {
        this.killScore = value;
    }
    /**
     * Score multiplier for damaging enemy units
     */
    private double damageScoreMultiplier;

    /**
     * Score multiplier for damaging enemy units
     */
    public double getDamageScoreMultiplier() {
        return damageScoreMultiplier;
    }

    /**
     * Score multiplier for damaging enemy units
     */
    public void setDamageScoreMultiplier(double value) {
        this.damageScoreMultiplier = value;
    }
    /**
     * Score given for every team killed before you
     */
    private double scorePerPlace;

    /**
     * Score given for every team killed before you
     */
    public double getScorePerPlace() {
        return scorePerPlace;
    }

    /**
     * Score given for every team killed before you
     */
    public void setScorePerPlace(double value) {
        this.scorePerPlace = value;
    }
    /**
     * List of properties of every weapon type
     */
    private ai_cup_22.model.WeaponProperties[] weapons;

    /**
     * List of properties of every weapon type
     */
    public ai_cup_22.model.WeaponProperties[] getWeapons() {
        return weapons;
    }

    /**
     * List of properties of every weapon type
     */
    public void setWeapons(ai_cup_22.model.WeaponProperties[] value) {
        this.weapons = value;
    }
    /**
     * Starting weapon with which units spawn, or None
     */
    private Integer startingWeapon;

    /**
     * Starting weapon with which units spawn, or None
     */
    public Integer getStartingWeapon() {
        return startingWeapon;
    }

    /**
     * Starting weapon with which units spawn, or None
     */
    public void setStartingWeapon(Integer value) {
        this.startingWeapon = value;
    }
    /**
     * Ammo for starting weapon given when unit spawns
     */
    private int startingWeaponAmmo;

    /**
     * Ammo for starting weapon given when unit spawns
     */
    public int getStartingWeaponAmmo() {
        return startingWeaponAmmo;
    }

    /**
     * Ammo for starting weapon given when unit spawns
     */
    public void setStartingWeaponAmmo(int value) {
        this.startingWeaponAmmo = value;
    }
    /**
     * Max number of shield potions in unit's inventory
     */
    private int maxShieldPotionsInInventory;

    /**
     * Max number of shield potions in unit's inventory
     */
    public int getMaxShieldPotionsInInventory() {
        return maxShieldPotionsInInventory;
    }

    /**
     * Max number of shield potions in unit's inventory
     */
    public void setMaxShieldPotionsInInventory(int value) {
        this.maxShieldPotionsInInventory = value;
    }
    /**
     * Amount of shield restored using one potion
     */
    private double shieldPerPotion;

    /**
     * Amount of shield restored using one potion
     */
    public double getShieldPerPotion() {
        return shieldPerPotion;
    }

    /**
     * Amount of shield restored using one potion
     */
    public void setShieldPerPotion(double value) {
        this.shieldPerPotion = value;
    }
    /**
     * Time required to perform action of using shield potion
     */
    private double shieldPotionUseTime;

    /**
     * Time required to perform action of using shield potion
     */
    public double getShieldPotionUseTime() {
        return shieldPotionUseTime;
    }

    /**
     * Time required to perform action of using shield potion
     */
    public void setShieldPotionUseTime(double value) {
        this.shieldPotionUseTime = value;
    }
    /**
     * List of properties of every sound type
     */
    private ai_cup_22.model.SoundProperties[] sounds;

    /**
     * List of properties of every sound type
     */
    public ai_cup_22.model.SoundProperties[] getSounds() {
        return sounds;
    }

    /**
     * List of properties of every sound type
     */
    public void setSounds(ai_cup_22.model.SoundProperties[] value) {
        this.sounds = value;
    }
    /**
     * Sound type index when moving (starting with 0), or None
     */
    private Integer stepsSoundTypeIndex;

    /**
     * Sound type index when moving (starting with 0), or None
     */
    public Integer getStepsSoundTypeIndex() {
        return stepsSoundTypeIndex;
    }

    /**
     * Sound type index when moving (starting with 0), or None
     */
    public void setStepsSoundTypeIndex(Integer value) {
        this.stepsSoundTypeIndex = value;
    }
    /**
     * Distance when steps sound will be 100% probability
     */
    private double stepsSoundTravelDistance;

    /**
     * Distance when steps sound will be 100% probability
     */
    public double getStepsSoundTravelDistance() {
        return stepsSoundTravelDistance;
    }

    /**
     * Distance when steps sound will be 100% probability
     */
    public void setStepsSoundTravelDistance(double value) {
        this.stepsSoundTravelDistance = value;
    }
    /**
     * List of obstacles on the map
     */
    private ai_cup_22.model.Obstacle[] obstacles;

    /**
     * List of obstacles on the map
     */
    public ai_cup_22.model.Obstacle[] getObstacles() {
        return obstacles;
    }

    /**
     * List of obstacles on the map
     */
    public void setObstacles(ai_cup_22.model.Obstacle[] value) {
        this.obstacles = value;
    }

    public Constants(double ticksPerSecond, int teamSize, double initialZoneRadius, double zoneSpeed, double zoneDamagePerSecond, double spawnTime, double spawnCollisionDamagePerSecond, double lootingTime, int botPlayers, double unitRadius, double unitHealth, double healthRegenerationPerSecond, double healthRegenerationDelay, double maxShield, double spawnShield, int extraLives, double lastRespawnZoneRadius, double fieldOfView, double viewDistance, boolean viewBlocking, double rotationSpeed, double spawnMovementSpeed, double maxUnitForwardSpeed, double maxUnitBackwardSpeed, double unitAcceleration, boolean friendlyFire, double killScore, double damageScoreMultiplier, double scorePerPlace, ai_cup_22.model.WeaponProperties[] weapons, Integer startingWeapon, int startingWeaponAmmo, int maxShieldPotionsInInventory, double shieldPerPotion, double shieldPotionUseTime, ai_cup_22.model.SoundProperties[] sounds, Integer stepsSoundTypeIndex, double stepsSoundTravelDistance, ai_cup_22.model.Obstacle[] obstacles) {
        this.ticksPerSecond = ticksPerSecond;
        this.teamSize = teamSize;
        this.initialZoneRadius = initialZoneRadius;
        this.zoneSpeed = zoneSpeed;
        this.zoneDamagePerSecond = zoneDamagePerSecond;
        this.spawnTime = spawnTime;
        this.spawnCollisionDamagePerSecond = spawnCollisionDamagePerSecond;
        this.lootingTime = lootingTime;
        this.botPlayers = botPlayers;
        this.unitRadius = unitRadius;
        this.unitHealth = unitHealth;
        this.healthRegenerationPerSecond = healthRegenerationPerSecond;
        this.healthRegenerationDelay = healthRegenerationDelay;
        this.maxShield = maxShield;
        this.spawnShield = spawnShield;
        this.extraLives = extraLives;
        this.lastRespawnZoneRadius = lastRespawnZoneRadius;
        this.fieldOfView = fieldOfView;
        this.viewDistance = viewDistance;
        this.viewBlocking = viewBlocking;
        this.rotationSpeed = rotationSpeed;
        this.spawnMovementSpeed = spawnMovementSpeed;
        this.maxUnitForwardSpeed = maxUnitForwardSpeed;
        this.maxUnitBackwardSpeed = maxUnitBackwardSpeed;
        this.unitAcceleration = unitAcceleration;
        this.friendlyFire = friendlyFire;
        this.killScore = killScore;
        this.damageScoreMultiplier = damageScoreMultiplier;
        this.scorePerPlace = scorePerPlace;
        this.weapons = weapons;
        this.startingWeapon = startingWeapon;
        this.startingWeaponAmmo = startingWeaponAmmo;
        this.maxShieldPotionsInInventory = maxShieldPotionsInInventory;
        this.shieldPerPotion = shieldPerPotion;
        this.shieldPotionUseTime = shieldPotionUseTime;
        this.sounds = sounds;
        this.stepsSoundTypeIndex = stepsSoundTypeIndex;
        this.stepsSoundTravelDistance = stepsSoundTravelDistance;
        this.obstacles = obstacles;
    }

    /**
     * Read Constants from input stream
     */
    public static Constants readFrom(java.io.InputStream stream) throws java.io.IOException {
        double ticksPerSecond;
        ticksPerSecond = StreamUtil.readDouble(stream);
        int teamSize;
        teamSize = StreamUtil.readInt(stream);
        double initialZoneRadius;
        initialZoneRadius = StreamUtil.readDouble(stream);
        double zoneSpeed;
        zoneSpeed = StreamUtil.readDouble(stream);
        double zoneDamagePerSecond;
        zoneDamagePerSecond = StreamUtil.readDouble(stream);
        double spawnTime;
        spawnTime = StreamUtil.readDouble(stream);
        double spawnCollisionDamagePerSecond;
        spawnCollisionDamagePerSecond = StreamUtil.readDouble(stream);
        double lootingTime;
        lootingTime = StreamUtil.readDouble(stream);
        int botPlayers;
        botPlayers = StreamUtil.readInt(stream);
        double unitRadius;
        unitRadius = StreamUtil.readDouble(stream);
        double unitHealth;
        unitHealth = StreamUtil.readDouble(stream);
        double healthRegenerationPerSecond;
        healthRegenerationPerSecond = StreamUtil.readDouble(stream);
        double healthRegenerationDelay;
        healthRegenerationDelay = StreamUtil.readDouble(stream);
        double maxShield;
        maxShield = StreamUtil.readDouble(stream);
        double spawnShield;
        spawnShield = StreamUtil.readDouble(stream);
        int extraLives;
        extraLives = StreamUtil.readInt(stream);
        double lastRespawnZoneRadius;
        lastRespawnZoneRadius = StreamUtil.readDouble(stream);
        double fieldOfView;
        fieldOfView = StreamUtil.readDouble(stream);
        double viewDistance;
        viewDistance = StreamUtil.readDouble(stream);
        boolean viewBlocking;
        viewBlocking = StreamUtil.readBoolean(stream);
        double rotationSpeed;
        rotationSpeed = StreamUtil.readDouble(stream);
        double spawnMovementSpeed;
        spawnMovementSpeed = StreamUtil.readDouble(stream);
        double maxUnitForwardSpeed;
        maxUnitForwardSpeed = StreamUtil.readDouble(stream);
        double maxUnitBackwardSpeed;
        maxUnitBackwardSpeed = StreamUtil.readDouble(stream);
        double unitAcceleration;
        unitAcceleration = StreamUtil.readDouble(stream);
        boolean friendlyFire;
        friendlyFire = StreamUtil.readBoolean(stream);
        double killScore;
        killScore = StreamUtil.readDouble(stream);
        double damageScoreMultiplier;
        damageScoreMultiplier = StreamUtil.readDouble(stream);
        double scorePerPlace;
        scorePerPlace = StreamUtil.readDouble(stream);
        ai_cup_22.model.WeaponProperties[] weapons;
        weapons = new ai_cup_22.model.WeaponProperties[StreamUtil.readInt(stream)];
        for (int weaponsIndex = 0; weaponsIndex < weapons.length; weaponsIndex++) {
            ai_cup_22.model.WeaponProperties weaponsElement;
            weaponsElement = ai_cup_22.model.WeaponProperties.readFrom(stream);
            weapons[weaponsIndex] = weaponsElement;
        }
        Integer startingWeapon;
        if (StreamUtil.readBoolean(stream)) {
            startingWeapon = StreamUtil.readInt(stream);
        } else {
            startingWeapon = null;
        }
        int startingWeaponAmmo;
        startingWeaponAmmo = StreamUtil.readInt(stream);
        int maxShieldPotionsInInventory;
        maxShieldPotionsInInventory = StreamUtil.readInt(stream);
        double shieldPerPotion;
        shieldPerPotion = StreamUtil.readDouble(stream);
        double shieldPotionUseTime;
        shieldPotionUseTime = StreamUtil.readDouble(stream);
        ai_cup_22.model.SoundProperties[] sounds;
        sounds = new ai_cup_22.model.SoundProperties[StreamUtil.readInt(stream)];
        for (int soundsIndex = 0; soundsIndex < sounds.length; soundsIndex++) {
            ai_cup_22.model.SoundProperties soundsElement;
            soundsElement = ai_cup_22.model.SoundProperties.readFrom(stream);
            sounds[soundsIndex] = soundsElement;
        }
        Integer stepsSoundTypeIndex;
        if (StreamUtil.readBoolean(stream)) {
            stepsSoundTypeIndex = StreamUtil.readInt(stream);
        } else {
            stepsSoundTypeIndex = null;
        }
        double stepsSoundTravelDistance;
        stepsSoundTravelDistance = StreamUtil.readDouble(stream);
        ai_cup_22.model.Obstacle[] obstacles;
        obstacles = new ai_cup_22.model.Obstacle[StreamUtil.readInt(stream)];
        for (int obstaclesIndex = 0; obstaclesIndex < obstacles.length; obstaclesIndex++) {
            ai_cup_22.model.Obstacle obstaclesElement;
            obstaclesElement = ai_cup_22.model.Obstacle.readFrom(stream);
            obstacles[obstaclesIndex] = obstaclesElement;
        }
        return new Constants(ticksPerSecond, teamSize, initialZoneRadius, zoneSpeed, zoneDamagePerSecond, spawnTime, spawnCollisionDamagePerSecond, lootingTime, botPlayers, unitRadius, unitHealth, healthRegenerationPerSecond, healthRegenerationDelay, maxShield, spawnShield, extraLives, lastRespawnZoneRadius, fieldOfView, viewDistance, viewBlocking, rotationSpeed, spawnMovementSpeed, maxUnitForwardSpeed, maxUnitBackwardSpeed, unitAcceleration, friendlyFire, killScore, damageScoreMultiplier, scorePerPlace, weapons, startingWeapon, startingWeaponAmmo, maxShieldPotionsInInventory, shieldPerPotion, shieldPotionUseTime, sounds, stepsSoundTypeIndex, stepsSoundTravelDistance, obstacles);
    }

    /**
     * Write Constants to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeDouble(stream, ticksPerSecond);
        StreamUtil.writeInt(stream, teamSize);
        StreamUtil.writeDouble(stream, initialZoneRadius);
        StreamUtil.writeDouble(stream, zoneSpeed);
        StreamUtil.writeDouble(stream, zoneDamagePerSecond);
        StreamUtil.writeDouble(stream, spawnTime);
        StreamUtil.writeDouble(stream, spawnCollisionDamagePerSecond);
        StreamUtil.writeDouble(stream, lootingTime);
        StreamUtil.writeInt(stream, botPlayers);
        StreamUtil.writeDouble(stream, unitRadius);
        StreamUtil.writeDouble(stream, unitHealth);
        StreamUtil.writeDouble(stream, healthRegenerationPerSecond);
        StreamUtil.writeDouble(stream, healthRegenerationDelay);
        StreamUtil.writeDouble(stream, maxShield);
        StreamUtil.writeDouble(stream, spawnShield);
        StreamUtil.writeInt(stream, extraLives);
        StreamUtil.writeDouble(stream, lastRespawnZoneRadius);
        StreamUtil.writeDouble(stream, fieldOfView);
        StreamUtil.writeDouble(stream, viewDistance);
        StreamUtil.writeBoolean(stream, viewBlocking);
        StreamUtil.writeDouble(stream, rotationSpeed);
        StreamUtil.writeDouble(stream, spawnMovementSpeed);
        StreamUtil.writeDouble(stream, maxUnitForwardSpeed);
        StreamUtil.writeDouble(stream, maxUnitBackwardSpeed);
        StreamUtil.writeDouble(stream, unitAcceleration);
        StreamUtil.writeBoolean(stream, friendlyFire);
        StreamUtil.writeDouble(stream, killScore);
        StreamUtil.writeDouble(stream, damageScoreMultiplier);
        StreamUtil.writeDouble(stream, scorePerPlace);
        StreamUtil.writeInt(stream, weapons.length);
        for (ai_cup_22.model.WeaponProperties weaponsElement : weapons) {
            weaponsElement.writeTo(stream);
        }
        if (startingWeapon == null) {
            StreamUtil.writeBoolean(stream, false);
        } else {
            StreamUtil.writeBoolean(stream, true);
            StreamUtil.writeInt(stream, startingWeapon);
        }
        StreamUtil.writeInt(stream, startingWeaponAmmo);
        StreamUtil.writeInt(stream, maxShieldPotionsInInventory);
        StreamUtil.writeDouble(stream, shieldPerPotion);
        StreamUtil.writeDouble(stream, shieldPotionUseTime);
        StreamUtil.writeInt(stream, sounds.length);
        for (ai_cup_22.model.SoundProperties soundsElement : sounds) {
            soundsElement.writeTo(stream);
        }
        if (stepsSoundTypeIndex == null) {
            StreamUtil.writeBoolean(stream, false);
        } else {
            StreamUtil.writeBoolean(stream, true);
            StreamUtil.writeInt(stream, stepsSoundTypeIndex);
        }
        StreamUtil.writeDouble(stream, stepsSoundTravelDistance);
        StreamUtil.writeInt(stream, obstacles.length);
        for (ai_cup_22.model.Obstacle obstaclesElement : obstacles) {
            obstaclesElement.writeTo(stream);
        }
    }

    /**
     * Get string representation of Constants
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Constants { ");
        stringBuilder.append("ticksPerSecond: ");
        stringBuilder.append(String.valueOf(ticksPerSecond));
        stringBuilder.append(", ");
        stringBuilder.append("teamSize: ");
        stringBuilder.append(String.valueOf(teamSize));
        stringBuilder.append(", ");
        stringBuilder.append("initialZoneRadius: ");
        stringBuilder.append(String.valueOf(initialZoneRadius));
        stringBuilder.append(", ");
        stringBuilder.append("zoneSpeed: ");
        stringBuilder.append(String.valueOf(zoneSpeed));
        stringBuilder.append(", ");
        stringBuilder.append("zoneDamagePerSecond: ");
        stringBuilder.append(String.valueOf(zoneDamagePerSecond));
        stringBuilder.append(", ");
        stringBuilder.append("spawnTime: ");
        stringBuilder.append(String.valueOf(spawnTime));
        stringBuilder.append(", ");
        stringBuilder.append("spawnCollisionDamagePerSecond: ");
        stringBuilder.append(String.valueOf(spawnCollisionDamagePerSecond));
        stringBuilder.append(", ");
        stringBuilder.append("lootingTime: ");
        stringBuilder.append(String.valueOf(lootingTime));
        stringBuilder.append(", ");
        stringBuilder.append("botPlayers: ");
        stringBuilder.append(String.valueOf(botPlayers));
        stringBuilder.append(", ");
        stringBuilder.append("unitRadius: ");
        stringBuilder.append(String.valueOf(unitRadius));
        stringBuilder.append(", ");
        stringBuilder.append("unitHealth: ");
        stringBuilder.append(String.valueOf(unitHealth));
        stringBuilder.append(", ");
        stringBuilder.append("healthRegenerationPerSecond: ");
        stringBuilder.append(String.valueOf(healthRegenerationPerSecond));
        stringBuilder.append(", ");
        stringBuilder.append("healthRegenerationDelay: ");
        stringBuilder.append(String.valueOf(healthRegenerationDelay));
        stringBuilder.append(", ");
        stringBuilder.append("maxShield: ");
        stringBuilder.append(String.valueOf(maxShield));
        stringBuilder.append(", ");
        stringBuilder.append("spawnShield: ");
        stringBuilder.append(String.valueOf(spawnShield));
        stringBuilder.append(", ");
        stringBuilder.append("extraLives: ");
        stringBuilder.append(String.valueOf(extraLives));
        stringBuilder.append(", ");
        stringBuilder.append("lastRespawnZoneRadius: ");
        stringBuilder.append(String.valueOf(lastRespawnZoneRadius));
        stringBuilder.append(", ");
        stringBuilder.append("fieldOfView: ");
        stringBuilder.append(String.valueOf(fieldOfView));
        stringBuilder.append(", ");
        stringBuilder.append("viewDistance: ");
        stringBuilder.append(String.valueOf(viewDistance));
        stringBuilder.append(", ");
        stringBuilder.append("viewBlocking: ");
        stringBuilder.append(String.valueOf(viewBlocking));
        stringBuilder.append(", ");
        stringBuilder.append("rotationSpeed: ");
        stringBuilder.append(String.valueOf(rotationSpeed));
        stringBuilder.append(", ");
        stringBuilder.append("spawnMovementSpeed: ");
        stringBuilder.append(String.valueOf(spawnMovementSpeed));
        stringBuilder.append(", ");
        stringBuilder.append("maxUnitForwardSpeed: ");
        stringBuilder.append(String.valueOf(maxUnitForwardSpeed));
        stringBuilder.append(", ");
        stringBuilder.append("maxUnitBackwardSpeed: ");
        stringBuilder.append(String.valueOf(maxUnitBackwardSpeed));
        stringBuilder.append(", ");
        stringBuilder.append("unitAcceleration: ");
        stringBuilder.append(String.valueOf(unitAcceleration));
        stringBuilder.append(", ");
        stringBuilder.append("friendlyFire: ");
        stringBuilder.append(String.valueOf(friendlyFire));
        stringBuilder.append(", ");
        stringBuilder.append("killScore: ");
        stringBuilder.append(String.valueOf(killScore));
        stringBuilder.append(", ");
        stringBuilder.append("damageScoreMultiplier: ");
        stringBuilder.append(String.valueOf(damageScoreMultiplier));
        stringBuilder.append(", ");
        stringBuilder.append("scorePerPlace: ");
        stringBuilder.append(String.valueOf(scorePerPlace));
        stringBuilder.append(", ");
        stringBuilder.append("weapons: ");
        stringBuilder.append("[ ");
        for (int weaponsIndex = 0; weaponsIndex < weapons.length; weaponsIndex++) {
            if (weaponsIndex != 0) {
                stringBuilder.append(", ");
            }
            ai_cup_22.model.WeaponProperties weaponsElement = weapons[weaponsIndex];
            stringBuilder.append(String.valueOf(weaponsElement));
        }
        stringBuilder.append(" ]");
        stringBuilder.append(", ");
        stringBuilder.append("startingWeapon: ");
        stringBuilder.append(String.valueOf(startingWeapon));
        stringBuilder.append(", ");
        stringBuilder.append("startingWeaponAmmo: ");
        stringBuilder.append(String.valueOf(startingWeaponAmmo));
        stringBuilder.append(", ");
        stringBuilder.append("maxShieldPotionsInInventory: ");
        stringBuilder.append(String.valueOf(maxShieldPotionsInInventory));
        stringBuilder.append(", ");
        stringBuilder.append("shieldPerPotion: ");
        stringBuilder.append(String.valueOf(shieldPerPotion));
        stringBuilder.append(", ");
        stringBuilder.append("shieldPotionUseTime: ");
        stringBuilder.append(String.valueOf(shieldPotionUseTime));
        stringBuilder.append(", ");
        stringBuilder.append("sounds: ");
        stringBuilder.append("[ ");
        for (int soundsIndex = 0; soundsIndex < sounds.length; soundsIndex++) {
            if (soundsIndex != 0) {
                stringBuilder.append(", ");
            }
            ai_cup_22.model.SoundProperties soundsElement = sounds[soundsIndex];
            stringBuilder.append(String.valueOf(soundsElement));
        }
        stringBuilder.append(" ]");
        stringBuilder.append(", ");
        stringBuilder.append("stepsSoundTypeIndex: ");
        stringBuilder.append(String.valueOf(stepsSoundTypeIndex));
        stringBuilder.append(", ");
        stringBuilder.append("stepsSoundTravelDistance: ");
        stringBuilder.append(String.valueOf(stepsSoundTravelDistance));
        stringBuilder.append(", ");
        stringBuilder.append("obstacles: ");
        stringBuilder.append("[ ");
        for (int obstaclesIndex = 0; obstaclesIndex < obstacles.length; obstaclesIndex++) {
            if (obstaclesIndex != 0) {
                stringBuilder.append(", ");
            }
            ai_cup_22.model.Obstacle obstaclesElement = obstacles[obstaclesIndex];
            stringBuilder.append(String.valueOf(obstaclesElement));
        }
        stringBuilder.append(" ]");
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}