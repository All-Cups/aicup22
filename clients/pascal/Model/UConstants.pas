unit UConstants;

{$mode delphi}{$H+}

interface

uses
    Nullable,
    Stream,
    SysUtils,
    UObstacle in 'Model/UObstacle.pas',
    USoundProperties in 'Model/USoundProperties.pas',
    UWeaponProperties in 'Model/UWeaponProperties.pas';

type
    // Non changing game state
    TConstants = class
        // Number of ticks per game second
        ticksPerSecond: Double;
        // Starting number of units in each team
        teamSize: Int32;
        // Initial zone radius
        initialZoneRadius: Double;
        // Speed of zone radius
        zoneSpeed: Double;
        // Damage dealt to units outside of the zone per second
        zoneDamagePerSecond: Double;
        // Unit spawning time
        spawnTime: Double;
        // Damage dealt to units trying to spawn in incorrect position per second
        spawnCollisionDamagePerSecond: Double;
        // Time required to perform looting actions (in seconds)
        lootingTime: Double;
        // Number of bot players (teams)
        botPlayers: Int32;
        // Units' radius
        unitRadius: Double;
        // Max units' health
        unitHealth: Double;
        // Health automatically restored per second
        healthRegenerationPerSecond: Double;
        // Time until automatic health regeneration since last health damage (in seconds)
        healthRegenerationDelay: Double;
        // Max value of unit's shield
        maxShield: Double;
        // Initial value of unit's shield
        spawnShield: Double;
        // Initial number of extra lives for units
        extraLives: Int32;
        // Zone radius after which respawning is disabled
        lastRespawnZoneRadius: Double;
        // Units' field of view without aiming (in degrees)
        fieldOfView: Double;
        // Units' view distance
        viewDistance: Double;
        // Whether units' view is blocked by obstacles
        viewBlocking: Boolean;
        // Unit rotation speed without aiming (degrees per second)
        rotationSpeed: Double;
        // Units' movement speed while spawning
        spawnMovementSpeed: Double;
        // Max unit speed when walking forward
        maxUnitForwardSpeed: Double;
        // Max unit speed when walking backward
        maxUnitBackwardSpeed: Double;
        // Max unit acceleration
        unitAcceleration: Double;
        // Whether a unit can damage units of the same team
        friendlyFire: Boolean;
        // Score given for killing enemy unit
        killScore: Double;
        // Score multiplier for damaging enemy units
        damageScoreMultiplier: Double;
        // Score given for every team killed before you
        scorePerPlace: Double;
        // List of properties of every weapon type
        weapons: TArray<TWeaponProperties>;
        // Starting weapon with which units spawn, or None
        startingWeapon: TNullable<Int32>;
        // Ammo for starting weapon given when unit spawns
        startingWeaponAmmo: Int32;
        // Max number of shield potions in unit's inventory
        maxShieldPotionsInInventory: Int32;
        // Amount of shield restored using one potion
        shieldPerPotion: Double;
        // Time required to perform action of using shield potion
        shieldPotionUseTime: Double;
        // List of properties of every sound type
        sounds: TArray<TSoundProperties>;
        // Sound type index when moving (starting with 0), or None
        stepsSoundTypeIndex: TNullable<Int32>;
        // Distance when steps sound will be 100% probability
        stepsSoundTravelDistance: Double;
        // List of obstacles on the map
        obstacles: TArray<TObstacle>;
        constructor Create(ticksPerSecond: Double; teamSize: Int32; initialZoneRadius: Double; zoneSpeed: Double; zoneDamagePerSecond: Double; spawnTime: Double; spawnCollisionDamagePerSecond: Double; lootingTime: Double; botPlayers: Int32; unitRadius: Double; unitHealth: Double; healthRegenerationPerSecond: Double; healthRegenerationDelay: Double; maxShield: Double; spawnShield: Double; extraLives: Int32; lastRespawnZoneRadius: Double; fieldOfView: Double; viewDistance: Double; viewBlocking: Boolean; rotationSpeed: Double; spawnMovementSpeed: Double; maxUnitForwardSpeed: Double; maxUnitBackwardSpeed: Double; unitAcceleration: Double; friendlyFire: Boolean; killScore: Double; damageScoreMultiplier: Double; scorePerPlace: Double; weapons: TArray<TWeaponProperties>; startingWeapon: TNullable<Int32>; startingWeaponAmmo: Int32; maxShieldPotionsInInventory: Int32; shieldPerPotion: Double; shieldPotionUseTime: Double; sounds: TArray<TSoundProperties>; stepsSoundTypeIndex: TNullable<Int32>; stepsSoundTravelDistance: Double; obstacles: TArray<TObstacle>);
        // Read Constants from input stream
        class function ReadFrom(stream: TStream): TConstants; static;
        // Write Constants to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TConstants.Create(ticksPerSecond: Double; teamSize: Int32; initialZoneRadius: Double; zoneSpeed: Double; zoneDamagePerSecond: Double; spawnTime: Double; spawnCollisionDamagePerSecond: Double; lootingTime: Double; botPlayers: Int32; unitRadius: Double; unitHealth: Double; healthRegenerationPerSecond: Double; healthRegenerationDelay: Double; maxShield: Double; spawnShield: Double; extraLives: Int32; lastRespawnZoneRadius: Double; fieldOfView: Double; viewDistance: Double; viewBlocking: Boolean; rotationSpeed: Double; spawnMovementSpeed: Double; maxUnitForwardSpeed: Double; maxUnitBackwardSpeed: Double; unitAcceleration: Double; friendlyFire: Boolean; killScore: Double; damageScoreMultiplier: Double; scorePerPlace: Double; weapons: TArray<TWeaponProperties>; startingWeapon: TNullable<Int32>; startingWeaponAmmo: Int32; maxShieldPotionsInInventory: Int32; shieldPerPotion: Double; shieldPotionUseTime: Double; sounds: TArray<TSoundProperties>; stepsSoundTypeIndex: TNullable<Int32>; stepsSoundTravelDistance: Double; obstacles: TArray<TObstacle>);
begin
    self.ticksPerSecond := ticksPerSecond;
    self.teamSize := teamSize;
    self.initialZoneRadius := initialZoneRadius;
    self.zoneSpeed := zoneSpeed;
    self.zoneDamagePerSecond := zoneDamagePerSecond;
    self.spawnTime := spawnTime;
    self.spawnCollisionDamagePerSecond := spawnCollisionDamagePerSecond;
    self.lootingTime := lootingTime;
    self.botPlayers := botPlayers;
    self.unitRadius := unitRadius;
    self.unitHealth := unitHealth;
    self.healthRegenerationPerSecond := healthRegenerationPerSecond;
    self.healthRegenerationDelay := healthRegenerationDelay;
    self.maxShield := maxShield;
    self.spawnShield := spawnShield;
    self.extraLives := extraLives;
    self.lastRespawnZoneRadius := lastRespawnZoneRadius;
    self.fieldOfView := fieldOfView;
    self.viewDistance := viewDistance;
    self.viewBlocking := viewBlocking;
    self.rotationSpeed := rotationSpeed;
    self.spawnMovementSpeed := spawnMovementSpeed;
    self.maxUnitForwardSpeed := maxUnitForwardSpeed;
    self.maxUnitBackwardSpeed := maxUnitBackwardSpeed;
    self.unitAcceleration := unitAcceleration;
    self.friendlyFire := friendlyFire;
    self.killScore := killScore;
    self.damageScoreMultiplier := damageScoreMultiplier;
    self.scorePerPlace := scorePerPlace;
    self.weapons := weapons;
    self.startingWeapon := startingWeapon;
    self.startingWeaponAmmo := startingWeaponAmmo;
    self.maxShieldPotionsInInventory := maxShieldPotionsInInventory;
    self.shieldPerPotion := shieldPerPotion;
    self.shieldPotionUseTime := shieldPotionUseTime;
    self.sounds := sounds;
    self.stepsSoundTypeIndex := stepsSoundTypeIndex;
    self.stepsSoundTravelDistance := stepsSoundTravelDistance;
    self.obstacles := obstacles;
end;

class function TConstants.ReadFrom(stream: TStream): TConstants;
var botPlayers: Int32;
var damageScoreMultiplier: Double;
var extraLives: Int32;
var fieldOfView: Double;
var friendlyFire: Boolean;
var healthRegenerationDelay: Double;
var healthRegenerationPerSecond: Double;
var initialZoneRadius: Double;
var killScore: Double;
var lastRespawnZoneRadius: Double;
var lootingTime: Double;
var maxShield: Double;
var maxShieldPotionsInInventory: Int32;
var maxUnitBackwardSpeed: Double;
var maxUnitForwardSpeed: Double;
var obstacles: TArray<TObstacle>;
var obstaclesElement: TObstacle;
var obstaclesIndex: Int32;
var rotationSpeed: Double;
var scorePerPlace: Double;
var shieldPerPotion: Double;
var shieldPotionUseTime: Double;
var sounds: TArray<TSoundProperties>;
var soundsElement: TSoundProperties;
var soundsIndex: Int32;
var spawnCollisionDamagePerSecond: Double;
var spawnMovementSpeed: Double;
var spawnShield: Double;
var spawnTime: Double;
var startingWeapon: TNullable<Int32>;
var startingWeaponAmmo: Int32;
var startingWeaponValue: Int32;
var stepsSoundTravelDistance: Double;
var stepsSoundTypeIndex: TNullable<Int32>;
var stepsSoundTypeIndexValue: Int32;
var teamSize: Int32;
var ticksPerSecond: Double;
var unitAcceleration: Double;
var unitHealth: Double;
var unitRadius: Double;
var viewBlocking: Boolean;
var viewDistance: Double;
var weapons: TArray<TWeaponProperties>;
var weaponsElement: TWeaponProperties;
var weaponsIndex: Int32;
var zoneDamagePerSecond: Double;
var zoneSpeed: Double;
begin
    ticksPerSecond := stream.ReadDouble;
    teamSize := stream.ReadInt32;
    initialZoneRadius := stream.ReadDouble;
    zoneSpeed := stream.ReadDouble;
    zoneDamagePerSecond := stream.ReadDouble;
    spawnTime := stream.ReadDouble;
    spawnCollisionDamagePerSecond := stream.ReadDouble;
    lootingTime := stream.ReadDouble;
    botPlayers := stream.ReadInt32;
    unitRadius := stream.ReadDouble;
    unitHealth := stream.ReadDouble;
    healthRegenerationPerSecond := stream.ReadDouble;
    healthRegenerationDelay := stream.ReadDouble;
    maxShield := stream.ReadDouble;
    spawnShield := stream.ReadDouble;
    extraLives := stream.ReadInt32;
    lastRespawnZoneRadius := stream.ReadDouble;
    fieldOfView := stream.ReadDouble;
    viewDistance := stream.ReadDouble;
    viewBlocking := stream.ReadBoolean;
    rotationSpeed := stream.ReadDouble;
    spawnMovementSpeed := stream.ReadDouble;
    maxUnitForwardSpeed := stream.ReadDouble;
    maxUnitBackwardSpeed := stream.ReadDouble;
    unitAcceleration := stream.ReadDouble;
    friendlyFire := stream.ReadBoolean;
    killScore := stream.ReadDouble;
    damageScoreMultiplier := stream.ReadDouble;
    scorePerPlace := stream.ReadDouble;
    weapons := TArray<TWeaponProperties>.Create;
    SetLength(weapons, stream.ReadInt32);
    for weaponsIndex := 0 to Length(weapons) - 1 do begin
        weaponsElement := TWeaponProperties.ReadFrom(stream);
        weapons[weaponsIndex] := weaponsElement;
    end;
    if stream.ReadBoolean then begin
        startingWeaponValue := stream.ReadInt32;
        startingWeapon := startingWeaponValue;
    end else
        startingWeapon := nil;
    startingWeaponAmmo := stream.ReadInt32;
    maxShieldPotionsInInventory := stream.ReadInt32;
    shieldPerPotion := stream.ReadDouble;
    shieldPotionUseTime := stream.ReadDouble;
    sounds := TArray<TSoundProperties>.Create;
    SetLength(sounds, stream.ReadInt32);
    for soundsIndex := 0 to Length(sounds) - 1 do begin
        soundsElement := TSoundProperties.ReadFrom(stream);
        sounds[soundsIndex] := soundsElement;
    end;
    if stream.ReadBoolean then begin
        stepsSoundTypeIndexValue := stream.ReadInt32;
        stepsSoundTypeIndex := stepsSoundTypeIndexValue;
    end else
        stepsSoundTypeIndex := nil;
    stepsSoundTravelDistance := stream.ReadDouble;
    obstacles := TArray<TObstacle>.Create;
    SetLength(obstacles, stream.ReadInt32);
    for obstaclesIndex := 0 to Length(obstacles) - 1 do begin
        obstaclesElement := TObstacle.ReadFrom(stream);
        obstacles[obstaclesIndex] := obstaclesElement;
    end;
    result := TConstants.Create(ticksPerSecond, teamSize, initialZoneRadius, zoneSpeed, zoneDamagePerSecond, spawnTime, spawnCollisionDamagePerSecond, lootingTime, botPlayers, unitRadius, unitHealth, healthRegenerationPerSecond, healthRegenerationDelay, maxShield, spawnShield, extraLives, lastRespawnZoneRadius, fieldOfView, viewDistance, viewBlocking, rotationSpeed, spawnMovementSpeed, maxUnitForwardSpeed, maxUnitBackwardSpeed, unitAcceleration, friendlyFire, killScore, damageScoreMultiplier, scorePerPlace, weapons, startingWeapon, startingWeaponAmmo, maxShieldPotionsInInventory, shieldPerPotion, shieldPotionUseTime, sounds, stepsSoundTypeIndex, stepsSoundTravelDistance, obstacles);
end;

procedure TConstants.WriteTo(stream: TStream);
var obstaclesElement: TObstacle;
var soundsElement: TSoundProperties;
var startingWeaponValue: Int32;
var stepsSoundTypeIndexValue: Int32;
var weaponsElement: TWeaponProperties;
begin
    stream.WriteDouble(ticksPerSecond);
    stream.WriteInt32(teamSize);
    stream.WriteDouble(initialZoneRadius);
    stream.WriteDouble(zoneSpeed);
    stream.WriteDouble(zoneDamagePerSecond);
    stream.WriteDouble(spawnTime);
    stream.WriteDouble(spawnCollisionDamagePerSecond);
    stream.WriteDouble(lootingTime);
    stream.WriteInt32(botPlayers);
    stream.WriteDouble(unitRadius);
    stream.WriteDouble(unitHealth);
    stream.WriteDouble(healthRegenerationPerSecond);
    stream.WriteDouble(healthRegenerationDelay);
    stream.WriteDouble(maxShield);
    stream.WriteDouble(spawnShield);
    stream.WriteInt32(extraLives);
    stream.WriteDouble(lastRespawnZoneRadius);
    stream.WriteDouble(fieldOfView);
    stream.WriteDouble(viewDistance);
    stream.WriteBoolean(viewBlocking);
    stream.WriteDouble(rotationSpeed);
    stream.WriteDouble(spawnMovementSpeed);
    stream.WriteDouble(maxUnitForwardSpeed);
    stream.WriteDouble(maxUnitBackwardSpeed);
    stream.WriteDouble(unitAcceleration);
    stream.WriteBoolean(friendlyFire);
    stream.WriteDouble(killScore);
    stream.WriteDouble(damageScoreMultiplier);
    stream.WriteDouble(scorePerPlace);
    stream.WriteInt32(Length(weapons));
    for weaponsElement in weapons do begin
        weaponsElement.WriteTo(stream);
    end;
    if startingWeapon.HasValue then begin
        stream.WriteBoolean(true);
        startingWeaponValue := startingWeapon.Value;
        stream.WriteInt32(startingWeaponValue);
    end else
        stream.WriteBoolean(false);
    stream.WriteInt32(startingWeaponAmmo);
    stream.WriteInt32(maxShieldPotionsInInventory);
    stream.WriteDouble(shieldPerPotion);
    stream.WriteDouble(shieldPotionUseTime);
    stream.WriteInt32(Length(sounds));
    for soundsElement in sounds do begin
        soundsElement.WriteTo(stream);
    end;
    if stepsSoundTypeIndex.HasValue then begin
        stream.WriteBoolean(true);
        stepsSoundTypeIndexValue := stepsSoundTypeIndex.Value;
        stream.WriteInt32(stepsSoundTypeIndexValue);
    end else
        stream.WriteBoolean(false);
    stream.WriteDouble(stepsSoundTravelDistance);
    stream.WriteInt32(Length(obstacles));
    for obstaclesElement in obstacles do begin
        obstaclesElement.WriteTo(stream);
    end;
end;

function TConstants.ToString: ansistring;
var obstaclesElement: TObstacle;
var obstaclesIndex: Int32;
var soundsElement: TSoundProperties;
var soundsIndex: Int32;
var startingWeaponValue: Int32;
var stepsSoundTypeIndexValue: Int32;
var weaponsElement: TWeaponProperties;
var weaponsIndex: Int32;
begin
    result := 'Constants {';
    result += 'ticksPerSecond=';
    result += FloatToStr(ticksPerSecond);
    result += ', ';  
    result += 'teamSize=';
    result += IntToStr(teamSize);
    result += ', ';  
    result += 'initialZoneRadius=';
    result += FloatToStr(initialZoneRadius);
    result += ', ';  
    result += 'zoneSpeed=';
    result += FloatToStr(zoneSpeed);
    result += ', ';  
    result += 'zoneDamagePerSecond=';
    result += FloatToStr(zoneDamagePerSecond);
    result += ', ';  
    result += 'spawnTime=';
    result += FloatToStr(spawnTime);
    result += ', ';  
    result += 'spawnCollisionDamagePerSecond=';
    result += FloatToStr(spawnCollisionDamagePerSecond);
    result += ', ';  
    result += 'lootingTime=';
    result += FloatToStr(lootingTime);
    result += ', ';  
    result += 'botPlayers=';
    result += IntToStr(botPlayers);
    result += ', ';  
    result += 'unitRadius=';
    result += FloatToStr(unitRadius);
    result += ', ';  
    result += 'unitHealth=';
    result += FloatToStr(unitHealth);
    result += ', ';  
    result += 'healthRegenerationPerSecond=';
    result += FloatToStr(healthRegenerationPerSecond);
    result += ', ';  
    result += 'healthRegenerationDelay=';
    result += FloatToStr(healthRegenerationDelay);
    result += ', ';  
    result += 'maxShield=';
    result += FloatToStr(maxShield);
    result += ', ';  
    result += 'spawnShield=';
    result += FloatToStr(spawnShield);
    result += ', ';  
    result += 'extraLives=';
    result += IntToStr(extraLives);
    result += ', ';  
    result += 'lastRespawnZoneRadius=';
    result += FloatToStr(lastRespawnZoneRadius);
    result += ', ';  
    result += 'fieldOfView=';
    result += FloatToStr(fieldOfView);
    result += ', ';  
    result += 'viewDistance=';
    result += FloatToStr(viewDistance);
    result += ', ';  
    result += 'viewBlocking=';
    result += BoolToStr(viewBlocking);
    result += ', ';  
    result += 'rotationSpeed=';
    result += FloatToStr(rotationSpeed);
    result += ', ';  
    result += 'spawnMovementSpeed=';
    result += FloatToStr(spawnMovementSpeed);
    result += ', ';  
    result += 'maxUnitForwardSpeed=';
    result += FloatToStr(maxUnitForwardSpeed);
    result += ', ';  
    result += 'maxUnitBackwardSpeed=';
    result += FloatToStr(maxUnitBackwardSpeed);
    result += ', ';  
    result += 'unitAcceleration=';
    result += FloatToStr(unitAcceleration);
    result += ', ';  
    result += 'friendlyFire=';
    result += BoolToStr(friendlyFire);
    result += ', ';  
    result += 'killScore=';
    result += FloatToStr(killScore);
    result += ', ';  
    result += 'damageScoreMultiplier=';
    result += FloatToStr(damageScoreMultiplier);
    result += ', ';  
    result += 'scorePerPlace=';
    result += FloatToStr(scorePerPlace);
    result += ', ';  
    result += 'weapons=';
    result += '[';
    for weaponsIndex := 0 to Length(weapons) - 1 do begin
        if weaponsIndex <> 0 then
            result += ', ';
        weaponsElement := weapons[weaponsIndex];
        result += weaponsElement.ToString;;
    end;
    result += ']';
    result += ', ';  
    result += 'startingWeapon=';
    if startingWeapon.HasValue then begin
        startingWeaponValue := startingWeapon.Value;
        result += IntToStr(startingWeaponValue);
    end else
        result += 'nil';
    result += ', ';  
    result += 'startingWeaponAmmo=';
    result += IntToStr(startingWeaponAmmo);
    result += ', ';  
    result += 'maxShieldPotionsInInventory=';
    result += IntToStr(maxShieldPotionsInInventory);
    result += ', ';  
    result += 'shieldPerPotion=';
    result += FloatToStr(shieldPerPotion);
    result += ', ';  
    result += 'shieldPotionUseTime=';
    result += FloatToStr(shieldPotionUseTime);
    result += ', ';  
    result += 'sounds=';
    result += '[';
    for soundsIndex := 0 to Length(sounds) - 1 do begin
        if soundsIndex <> 0 then
            result += ', ';
        soundsElement := sounds[soundsIndex];
        result += soundsElement.ToString;;
    end;
    result += ']';
    result += ', ';  
    result += 'stepsSoundTypeIndex=';
    if stepsSoundTypeIndex.HasValue then begin
        stepsSoundTypeIndexValue := stepsSoundTypeIndex.Value;
        result += IntToStr(stepsSoundTypeIndexValue);
    end else
        result += 'nil';
    result += ', ';  
    result += 'stepsSoundTravelDistance=';
    result += FloatToStr(stepsSoundTravelDistance);
    result += ', ';  
    result += 'obstacles=';
    result += '[';
    for obstaclesIndex := 0 to Length(obstacles) - 1 do begin
        if obstaclesIndex <> 0 then
            result += ', ';
        obstaclesElement := obstacles[obstaclesIndex];
        result += obstaclesElement.ToString;;
    end;
    result += ']';
    result += '}';
end;

end.