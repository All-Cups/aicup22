module model.constants;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.obstacle;
import model.sound_properties;
import model.weapon_properties;

/// Non changing game state
struct Constants {
    /// Number of ticks per game second
    double ticksPerSecond;
    /// Starting number of units in each team
    int teamSize;
    /// Initial zone radius
    double initialZoneRadius;
    /// Speed of zone radius
    double zoneSpeed;
    /// Damage dealt to units outside of the zone per second
    double zoneDamagePerSecond;
    /// Unit spawning time
    double spawnTime;
    /// Damage dealt to units trying to spawn in incorrect position per second
    double spawnCollisionDamagePerSecond;
    /// Time required to perform looting actions (in seconds)
    double lootingTime;
    /// Number of bot players (teams)
    int botPlayers;
    /// Units' radius
    double unitRadius;
    /// Max units' health
    double unitHealth;
    /// Health automatically restored per second
    double healthRegenerationPerSecond;
    /// Time until automatic health regeneration since last health damage (in seconds)
    double healthRegenerationDelay;
    /// Max value of unit's shield
    double maxShield;
    /// Initial value of unit's shield
    double spawnShield;
    /// Initial number of extra lives for units
    int extraLives;
    /// Zone radius after which respawning is disabled
    double lastRespawnZoneRadius;
    /// Units' field of view without aiming (in degrees)
    double fieldOfView;
    /// Units' view distance
    double viewDistance;
    /// Whether units' view is blocked by obstacles
    bool viewBlocking;
    /// Unit rotation speed without aiming (degrees per second)
    double rotationSpeed;
    /// Units' movement speed while spawning
    double spawnMovementSpeed;
    /// Max unit speed when walking forward
    double maxUnitForwardSpeed;
    /// Max unit speed when walking backward
    double maxUnitBackwardSpeed;
    /// Max unit acceleration
    double unitAcceleration;
    /// Whether a unit can damage units of the same team
    bool friendlyFire;
    /// Score given for killing enemy unit
    double killScore;
    /// Score multiplier for damaging enemy units
    double damageScoreMultiplier;
    /// Score given for every team killed before you
    double scorePerPlace;
    /// List of properties of every weapon type
    model.WeaponProperties[] weapons;
    /// Starting weapon with which units spawn, or None
    Nullable!(int) startingWeapon;
    /// Ammo for starting weapon given when unit spawns
    int startingWeaponAmmo;
    /// Max number of shield potions in unit's inventory
    int maxShieldPotionsInInventory;
    /// Amount of shield restored using one potion
    double shieldPerPotion;
    /// Time required to perform action of using shield potion
    double shieldPotionUseTime;
    /// List of properties of every sound type
    model.SoundProperties[] sounds;
    /// Sound type index when moving (starting with 0), or None
    Nullable!(int) stepsSoundTypeIndex;
    /// Distance when steps sound will be 100% probability
    double stepsSoundTravelDistance;
    /// List of obstacles on the map
    model.Obstacle[] obstacles;

    this(double ticksPerSecond, int teamSize, double initialZoneRadius, double zoneSpeed, double zoneDamagePerSecond, double spawnTime, double spawnCollisionDamagePerSecond, double lootingTime, int botPlayers, double unitRadius, double unitHealth, double healthRegenerationPerSecond, double healthRegenerationDelay, double maxShield, double spawnShield, int extraLives, double lastRespawnZoneRadius, double fieldOfView, double viewDistance, bool viewBlocking, double rotationSpeed, double spawnMovementSpeed, double maxUnitForwardSpeed, double maxUnitBackwardSpeed, double unitAcceleration, bool friendlyFire, double killScore, double damageScoreMultiplier, double scorePerPlace, model.WeaponProperties[] weapons, Nullable!(int) startingWeapon, int startingWeaponAmmo, int maxShieldPotionsInInventory, double shieldPerPotion, double shieldPotionUseTime, model.SoundProperties[] sounds, Nullable!(int) stepsSoundTypeIndex, double stepsSoundTravelDistance, model.Obstacle[] obstacles) {
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

    /// Read Constants from reader
    static Constants readFrom(Stream reader) {
        double ticksPerSecond;
        ticksPerSecond = reader.readDouble();
        int teamSize;
        teamSize = reader.readInt();
        double initialZoneRadius;
        initialZoneRadius = reader.readDouble();
        double zoneSpeed;
        zoneSpeed = reader.readDouble();
        double zoneDamagePerSecond;
        zoneDamagePerSecond = reader.readDouble();
        double spawnTime;
        spawnTime = reader.readDouble();
        double spawnCollisionDamagePerSecond;
        spawnCollisionDamagePerSecond = reader.readDouble();
        double lootingTime;
        lootingTime = reader.readDouble();
        int botPlayers;
        botPlayers = reader.readInt();
        double unitRadius;
        unitRadius = reader.readDouble();
        double unitHealth;
        unitHealth = reader.readDouble();
        double healthRegenerationPerSecond;
        healthRegenerationPerSecond = reader.readDouble();
        double healthRegenerationDelay;
        healthRegenerationDelay = reader.readDouble();
        double maxShield;
        maxShield = reader.readDouble();
        double spawnShield;
        spawnShield = reader.readDouble();
        int extraLives;
        extraLives = reader.readInt();
        double lastRespawnZoneRadius;
        lastRespawnZoneRadius = reader.readDouble();
        double fieldOfView;
        fieldOfView = reader.readDouble();
        double viewDistance;
        viewDistance = reader.readDouble();
        bool viewBlocking;
        viewBlocking = reader.readBool();
        double rotationSpeed;
        rotationSpeed = reader.readDouble();
        double spawnMovementSpeed;
        spawnMovementSpeed = reader.readDouble();
        double maxUnitForwardSpeed;
        maxUnitForwardSpeed = reader.readDouble();
        double maxUnitBackwardSpeed;
        maxUnitBackwardSpeed = reader.readDouble();
        double unitAcceleration;
        unitAcceleration = reader.readDouble();
        bool friendlyFire;
        friendlyFire = reader.readBool();
        double killScore;
        killScore = reader.readDouble();
        double damageScoreMultiplier;
        damageScoreMultiplier = reader.readDouble();
        double scorePerPlace;
        scorePerPlace = reader.readDouble();
        model.WeaponProperties[] weapons;
        weapons = new model.WeaponProperties[reader.readInt()];
        for (int weaponsIndex = 0; weaponsIndex < weapons.length; weaponsIndex++) {
            model.WeaponProperties weaponsKey;
            weaponsKey = model.WeaponProperties.readFrom(reader);
            weapons[weaponsIndex] = weaponsKey;
        }
        Nullable!(int) startingWeapon;
        if (reader.readBool()) {
            startingWeapon = reader.readInt();
        } else {
            startingWeapon.nullify();
        }
        int startingWeaponAmmo;
        startingWeaponAmmo = reader.readInt();
        int maxShieldPotionsInInventory;
        maxShieldPotionsInInventory = reader.readInt();
        double shieldPerPotion;
        shieldPerPotion = reader.readDouble();
        double shieldPotionUseTime;
        shieldPotionUseTime = reader.readDouble();
        model.SoundProperties[] sounds;
        sounds = new model.SoundProperties[reader.readInt()];
        for (int soundsIndex = 0; soundsIndex < sounds.length; soundsIndex++) {
            model.SoundProperties soundsKey;
            soundsKey = model.SoundProperties.readFrom(reader);
            sounds[soundsIndex] = soundsKey;
        }
        Nullable!(int) stepsSoundTypeIndex;
        if (reader.readBool()) {
            stepsSoundTypeIndex = reader.readInt();
        } else {
            stepsSoundTypeIndex.nullify();
        }
        double stepsSoundTravelDistance;
        stepsSoundTravelDistance = reader.readDouble();
        model.Obstacle[] obstacles;
        obstacles = new model.Obstacle[reader.readInt()];
        for (int obstaclesIndex = 0; obstaclesIndex < obstacles.length; obstaclesIndex++) {
            model.Obstacle obstaclesKey;
            obstaclesKey = model.Obstacle.readFrom(reader);
            obstacles[obstaclesIndex] = obstaclesKey;
        }
        return Constants(ticksPerSecond, teamSize, initialZoneRadius, zoneSpeed, zoneDamagePerSecond, spawnTime, spawnCollisionDamagePerSecond, lootingTime, botPlayers, unitRadius, unitHealth, healthRegenerationPerSecond, healthRegenerationDelay, maxShield, spawnShield, extraLives, lastRespawnZoneRadius, fieldOfView, viewDistance, viewBlocking, rotationSpeed, spawnMovementSpeed, maxUnitForwardSpeed, maxUnitBackwardSpeed, unitAcceleration, friendlyFire, killScore, damageScoreMultiplier, scorePerPlace, weapons, startingWeapon, startingWeaponAmmo, maxShieldPotionsInInventory, shieldPerPotion, shieldPotionUseTime, sounds, stepsSoundTypeIndex, stepsSoundTravelDistance, obstacles);
    }

    /// Write Constants to writer
    void writeTo(Stream writer) const {
        writer.write(ticksPerSecond);
        writer.write(teamSize);
        writer.write(initialZoneRadius);
        writer.write(zoneSpeed);
        writer.write(zoneDamagePerSecond);
        writer.write(spawnTime);
        writer.write(spawnCollisionDamagePerSecond);
        writer.write(lootingTime);
        writer.write(botPlayers);
        writer.write(unitRadius);
        writer.write(unitHealth);
        writer.write(healthRegenerationPerSecond);
        writer.write(healthRegenerationDelay);
        writer.write(maxShield);
        writer.write(spawnShield);
        writer.write(extraLives);
        writer.write(lastRespawnZoneRadius);
        writer.write(fieldOfView);
        writer.write(viewDistance);
        writer.write(viewBlocking);
        writer.write(rotationSpeed);
        writer.write(spawnMovementSpeed);
        writer.write(maxUnitForwardSpeed);
        writer.write(maxUnitBackwardSpeed);
        writer.write(unitAcceleration);
        writer.write(friendlyFire);
        writer.write(killScore);
        writer.write(damageScoreMultiplier);
        writer.write(scorePerPlace);
        writer.write(cast(int)(weapons.length));
        foreach (weaponsElement; weapons) {
            weaponsElement.writeTo(writer);
        }
        if (startingWeapon.isNull()) {
            writer.write(false);
        } else {
            writer.write(true);
            auto startingWeaponValue = startingWeapon.get;
            writer.write(startingWeaponValue);
        }
        writer.write(startingWeaponAmmo);
        writer.write(maxShieldPotionsInInventory);
        writer.write(shieldPerPotion);
        writer.write(shieldPotionUseTime);
        writer.write(cast(int)(sounds.length));
        foreach (soundsElement; sounds) {
            soundsElement.writeTo(writer);
        }
        if (stepsSoundTypeIndex.isNull()) {
            writer.write(false);
        } else {
            writer.write(true);
            auto stepsSoundTypeIndexValue = stepsSoundTypeIndex.get;
            writer.write(stepsSoundTypeIndexValue);
        }
        writer.write(stepsSoundTravelDistance);
        writer.write(cast(int)(obstacles.length));
        foreach (obstaclesElement; obstacles) {
            obstaclesElement.writeTo(writer);
        }
    }
}