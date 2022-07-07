unit UUnit;

{$mode delphi}{$H+}

interface

uses
    Nullable,
    Stream,
    SysUtils,
    UAction in 'Model/UAction.pas',
    UVec2 in 'Model/UVec2.pas';

type
    // A unit
    TUnit = class
        // Unique id
        id: Int32;
        // Id of the player (team) controlling the unit
        playerId: Int32;
        // Current health
        health: Double;
        // Current shield value
        shield: Double;
        // Left extra lives of this unit
        extraLives: Int32;
        // Current position of unit's center
        position: TVec2;
        // Remaining time until unit will be spawned, or None
        remainingSpawnTime: TNullable<Double>;
        // Current velocity
        velocity: TVec2;
        // Current view direction (vector of length 1)
        direction: TVec2;
        // Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
        aim: Double;
        // Current action unit is performing, or None
        action: TNullable<TAction>;
        // Tick when health regeneration will start (can be less than current game tick)
        healthRegenerationStartTick: Int32;
        // Index of the weapon this unit is holding (starting with 0), or None
        weapon: TNullable<Int32>;
        // Next tick when unit can shoot again (can be less than current game tick)
        nextShotTick: Int32;
        // List of ammo in unit's inventory for every weapon type
        ammo: TArray<Int32>;
        // Number of shield potions in inventory
        shieldPotions: Int32;
        constructor Create(id: Int32; playerId: Int32; health: Double; shield: Double; extraLives: Int32; position: TVec2; remainingSpawnTime: TNullable<Double>; velocity: TVec2; direction: TVec2; aim: Double; action: TNullable<TAction>; healthRegenerationStartTick: Int32; weapon: TNullable<Int32>; nextShotTick: Int32; ammo: TArray<Int32>; shieldPotions: Int32);
        // Read Unit from input stream
        class function ReadFrom(stream: TStream): TUnit; static;
        // Write Unit to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TUnit.Create(id: Int32; playerId: Int32; health: Double; shield: Double; extraLives: Int32; position: TVec2; remainingSpawnTime: TNullable<Double>; velocity: TVec2; direction: TVec2; aim: Double; action: TNullable<TAction>; healthRegenerationStartTick: Int32; weapon: TNullable<Int32>; nextShotTick: Int32; ammo: TArray<Int32>; shieldPotions: Int32);
begin
    self.id := id;
    self.playerId := playerId;
    self.health := health;
    self.shield := shield;
    self.extraLives := extraLives;
    self.position := position;
    self.remainingSpawnTime := remainingSpawnTime;
    self.velocity := velocity;
    self.direction := direction;
    self.aim := aim;
    self.action := action;
    self.healthRegenerationStartTick := healthRegenerationStartTick;
    self.weapon := weapon;
    self.nextShotTick := nextShotTick;
    self.ammo := ammo;
    self.shieldPotions := shieldPotions;
end;

class function TUnit.ReadFrom(stream: TStream): TUnit;
var action: TNullable<TAction>;
var actionValue: TAction;
var aim: Double;
var ammo: TArray<Int32>;
var ammoElement: Int32;
var ammoIndex: Int32;
var direction: TVec2;
var extraLives: Int32;
var health: Double;
var healthRegenerationStartTick: Int32;
var id: Int32;
var nextShotTick: Int32;
var playerId: Int32;
var position: TVec2;
var remainingSpawnTime: TNullable<Double>;
var remainingSpawnTimeValue: Double;
var shield: Double;
var shieldPotions: Int32;
var velocity: TVec2;
var weapon: TNullable<Int32>;
var weaponValue: Int32;
begin
    id := stream.ReadInt32;
    playerId := stream.ReadInt32;
    health := stream.ReadDouble;
    shield := stream.ReadDouble;
    extraLives := stream.ReadInt32;
    position := TVec2.ReadFrom(stream);
    if stream.ReadBoolean then begin
        remainingSpawnTimeValue := stream.ReadDouble;
        remainingSpawnTime := remainingSpawnTimeValue;
    end else
        remainingSpawnTime := nil;
    velocity := TVec2.ReadFrom(stream);
    direction := TVec2.ReadFrom(stream);
    aim := stream.ReadDouble;
    if stream.ReadBoolean then begin
        actionValue := TAction.ReadFrom(stream);
        action := actionValue;
    end else
        action := nil;
    healthRegenerationStartTick := stream.ReadInt32;
    if stream.ReadBoolean then begin
        weaponValue := stream.ReadInt32;
        weapon := weaponValue;
    end else
        weapon := nil;
    nextShotTick := stream.ReadInt32;
    ammo := TArray<Int32>.Create;
    SetLength(ammo, stream.ReadInt32);
    for ammoIndex := 0 to Length(ammo) - 1 do begin
        ammoElement := stream.ReadInt32;
        ammo[ammoIndex] := ammoElement;
    end;
    shieldPotions := stream.ReadInt32;
    result := TUnit.Create(id, playerId, health, shield, extraLives, position, remainingSpawnTime, velocity, direction, aim, action, healthRegenerationStartTick, weapon, nextShotTick, ammo, shieldPotions);
end;

procedure TUnit.WriteTo(stream: TStream);
var actionValue: TAction;
var ammoElement: Int32;
var remainingSpawnTimeValue: Double;
var weaponValue: Int32;
begin
    stream.WriteInt32(id);
    stream.WriteInt32(playerId);
    stream.WriteDouble(health);
    stream.WriteDouble(shield);
    stream.WriteInt32(extraLives);
    position.WriteTo(stream);
    if remainingSpawnTime.HasValue then begin
        stream.WriteBoolean(true);
        remainingSpawnTimeValue := remainingSpawnTime.Value;
        stream.WriteDouble(remainingSpawnTimeValue);
    end else
        stream.WriteBoolean(false);
    velocity.WriteTo(stream);
    direction.WriteTo(stream);
    stream.WriteDouble(aim);
    if action.HasValue then begin
        stream.WriteBoolean(true);
        actionValue := action.Value;
        actionValue.WriteTo(stream);
    end else
        stream.WriteBoolean(false);
    stream.WriteInt32(healthRegenerationStartTick);
    if weapon.HasValue then begin
        stream.WriteBoolean(true);
        weaponValue := weapon.Value;
        stream.WriteInt32(weaponValue);
    end else
        stream.WriteBoolean(false);
    stream.WriteInt32(nextShotTick);
    stream.WriteInt32(Length(ammo));
    for ammoElement in ammo do begin
        stream.WriteInt32(ammoElement);
    end;
    stream.WriteInt32(shieldPotions);
end;

function TUnit.ToString: ansistring;
var actionValue: TAction;
var ammoElement: Int32;
var ammoIndex: Int32;
var remainingSpawnTimeValue: Double;
var weaponValue: Int32;
begin
    result := 'Unit {';
    result += 'id=';
    result += IntToStr(id);
    result += ', ';  
    result += 'playerId=';
    result += IntToStr(playerId);
    result += ', ';  
    result += 'health=';
    result += FloatToStr(health);
    result += ', ';  
    result += 'shield=';
    result += FloatToStr(shield);
    result += ', ';  
    result += 'extraLives=';
    result += IntToStr(extraLives);
    result += ', ';  
    result += 'position=';
    result += position.ToString;
    result += ', ';  
    result += 'remainingSpawnTime=';
    if remainingSpawnTime.HasValue then begin
        remainingSpawnTimeValue := remainingSpawnTime.Value;
        result += FloatToStr(remainingSpawnTimeValue);
    end else
        result += 'nil';
    result += ', ';  
    result += 'velocity=';
    result += velocity.ToString;
    result += ', ';  
    result += 'direction=';
    result += direction.ToString;
    result += ', ';  
    result += 'aim=';
    result += FloatToStr(aim);
    result += ', ';  
    result += 'action=';
    if action.HasValue then begin
        actionValue := action.Value;
        result += actionValue.ToString;
    end else
        result += 'nil';
    result += ', ';  
    result += 'healthRegenerationStartTick=';
    result += IntToStr(healthRegenerationStartTick);
    result += ', ';  
    result += 'weapon=';
    if weapon.HasValue then begin
        weaponValue := weapon.Value;
        result += IntToStr(weaponValue);
    end else
        result += 'nil';
    result += ', ';  
    result += 'nextShotTick=';
    result += IntToStr(nextShotTick);
    result += ', ';  
    result += 'ammo=';
    result += '[';
    for ammoIndex := 0 to Length(ammo) - 1 do begin
        if ammoIndex <> 0 then
            result += ', ';
        ammoElement := ammo[ammoIndex];
        result += IntToStr(ammoElement);;
    end;
    result += ']';
    result += ', ';  
    result += 'shieldPotions=';
    result += IntToStr(shieldPotions);
    result += '}';
end;

end.