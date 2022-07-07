unit UWeaponProperties;

{$mode delphi}{$H+}

interface

uses
    Nullable,
    Stream,
    SysUtils;

type
    // Weapon properties
    TWeaponProperties = class
        // Name
        name: String;
        // Shooting speed (number of shots per second)
        roundsPerSecond: Double;
        // Accuracy (spread angle) of a shot (in degrees)
        spread: Double;
        // Aiming time
        aimTime: Double;
        // Field of view in full aim (in degrees)
        aimFieldOfView: Double;
        // Rotation speed in full aim (degrees per second)
        aimRotationSpeed: Double;
        // Movement speed modifier in full aim
        aimMovementSpeedModifier: Double;
        // Speed of projectiles
        projectileSpeed: Double;
        // Damage of a projectile
        projectileDamage: Double;
        // Projectiles' life time
        projectileLifeTime: Double;
        // Index of the sound when shooting (starting with 0), or None
        shotSoundTypeIndex: TNullable<Int32>;
        // Index of the sound when hitting something (starting with 0), or None
        projectileHitSoundTypeIndex: TNullable<Int32>;
        // Max amount of ammo unit can hold in their inventory
        maxInventoryAmmo: Int32;
        constructor Create(name: String; roundsPerSecond: Double; spread: Double; aimTime: Double; aimFieldOfView: Double; aimRotationSpeed: Double; aimMovementSpeedModifier: Double; projectileSpeed: Double; projectileDamage: Double; projectileLifeTime: Double; shotSoundTypeIndex: TNullable<Int32>; projectileHitSoundTypeIndex: TNullable<Int32>; maxInventoryAmmo: Int32);
        // Read WeaponProperties from input stream
        class function ReadFrom(stream: TStream): TWeaponProperties; static;
        // Write WeaponProperties to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TWeaponProperties.Create(name: String; roundsPerSecond: Double; spread: Double; aimTime: Double; aimFieldOfView: Double; aimRotationSpeed: Double; aimMovementSpeedModifier: Double; projectileSpeed: Double; projectileDamage: Double; projectileLifeTime: Double; shotSoundTypeIndex: TNullable<Int32>; projectileHitSoundTypeIndex: TNullable<Int32>; maxInventoryAmmo: Int32);
begin
    self.name := name;
    self.roundsPerSecond := roundsPerSecond;
    self.spread := spread;
    self.aimTime := aimTime;
    self.aimFieldOfView := aimFieldOfView;
    self.aimRotationSpeed := aimRotationSpeed;
    self.aimMovementSpeedModifier := aimMovementSpeedModifier;
    self.projectileSpeed := projectileSpeed;
    self.projectileDamage := projectileDamage;
    self.projectileLifeTime := projectileLifeTime;
    self.shotSoundTypeIndex := shotSoundTypeIndex;
    self.projectileHitSoundTypeIndex := projectileHitSoundTypeIndex;
    self.maxInventoryAmmo := maxInventoryAmmo;
end;

class function TWeaponProperties.ReadFrom(stream: TStream): TWeaponProperties;
var aimFieldOfView: Double;
var aimMovementSpeedModifier: Double;
var aimRotationSpeed: Double;
var aimTime: Double;
var maxInventoryAmmo: Int32;
var name: String;
var projectileDamage: Double;
var projectileHitSoundTypeIndex: TNullable<Int32>;
var projectileHitSoundTypeIndexValue: Int32;
var projectileLifeTime: Double;
var projectileSpeed: Double;
var roundsPerSecond: Double;
var shotSoundTypeIndex: TNullable<Int32>;
var shotSoundTypeIndexValue: Int32;
var spread: Double;
begin
    name := stream.ReadString;
    roundsPerSecond := stream.ReadDouble;
    spread := stream.ReadDouble;
    aimTime := stream.ReadDouble;
    aimFieldOfView := stream.ReadDouble;
    aimRotationSpeed := stream.ReadDouble;
    aimMovementSpeedModifier := stream.ReadDouble;
    projectileSpeed := stream.ReadDouble;
    projectileDamage := stream.ReadDouble;
    projectileLifeTime := stream.ReadDouble;
    if stream.ReadBoolean then begin
        shotSoundTypeIndexValue := stream.ReadInt32;
        shotSoundTypeIndex := shotSoundTypeIndexValue;
    end else
        shotSoundTypeIndex := nil;
    if stream.ReadBoolean then begin
        projectileHitSoundTypeIndexValue := stream.ReadInt32;
        projectileHitSoundTypeIndex := projectileHitSoundTypeIndexValue;
    end else
        projectileHitSoundTypeIndex := nil;
    maxInventoryAmmo := stream.ReadInt32;
    result := TWeaponProperties.Create(name, roundsPerSecond, spread, aimTime, aimFieldOfView, aimRotationSpeed, aimMovementSpeedModifier, projectileSpeed, projectileDamage, projectileLifeTime, shotSoundTypeIndex, projectileHitSoundTypeIndex, maxInventoryAmmo);
end;

procedure TWeaponProperties.WriteTo(stream: TStream);
var projectileHitSoundTypeIndexValue: Int32;
var shotSoundTypeIndexValue: Int32;
begin
    stream.WriteString(name);
    stream.WriteDouble(roundsPerSecond);
    stream.WriteDouble(spread);
    stream.WriteDouble(aimTime);
    stream.WriteDouble(aimFieldOfView);
    stream.WriteDouble(aimRotationSpeed);
    stream.WriteDouble(aimMovementSpeedModifier);
    stream.WriteDouble(projectileSpeed);
    stream.WriteDouble(projectileDamage);
    stream.WriteDouble(projectileLifeTime);
    if shotSoundTypeIndex.HasValue then begin
        stream.WriteBoolean(true);
        shotSoundTypeIndexValue := shotSoundTypeIndex.Value;
        stream.WriteInt32(shotSoundTypeIndexValue);
    end else
        stream.WriteBoolean(false);
    if projectileHitSoundTypeIndex.HasValue then begin
        stream.WriteBoolean(true);
        projectileHitSoundTypeIndexValue := projectileHitSoundTypeIndex.Value;
        stream.WriteInt32(projectileHitSoundTypeIndexValue);
    end else
        stream.WriteBoolean(false);
    stream.WriteInt32(maxInventoryAmmo);
end;

function TWeaponProperties.ToString: ansistring;
var projectileHitSoundTypeIndexValue: Int32;
var shotSoundTypeIndexValue: Int32;
begin
    result := 'WeaponProperties {';
    result += 'name=';
    result += '''';
    result += name;
    result += '''';
    result += ', ';  
    result += 'roundsPerSecond=';
    result += FloatToStr(roundsPerSecond);
    result += ', ';  
    result += 'spread=';
    result += FloatToStr(spread);
    result += ', ';  
    result += 'aimTime=';
    result += FloatToStr(aimTime);
    result += ', ';  
    result += 'aimFieldOfView=';
    result += FloatToStr(aimFieldOfView);
    result += ', ';  
    result += 'aimRotationSpeed=';
    result += FloatToStr(aimRotationSpeed);
    result += ', ';  
    result += 'aimMovementSpeedModifier=';
    result += FloatToStr(aimMovementSpeedModifier);
    result += ', ';  
    result += 'projectileSpeed=';
    result += FloatToStr(projectileSpeed);
    result += ', ';  
    result += 'projectileDamage=';
    result += FloatToStr(projectileDamage);
    result += ', ';  
    result += 'projectileLifeTime=';
    result += FloatToStr(projectileLifeTime);
    result += ', ';  
    result += 'shotSoundTypeIndex=';
    if shotSoundTypeIndex.HasValue then begin
        shotSoundTypeIndexValue := shotSoundTypeIndex.Value;
        result += IntToStr(shotSoundTypeIndexValue);
    end else
        result += 'nil';
    result += ', ';  
    result += 'projectileHitSoundTypeIndex=';
    if projectileHitSoundTypeIndex.HasValue then begin
        projectileHitSoundTypeIndexValue := projectileHitSoundTypeIndex.Value;
        result += IntToStr(projectileHitSoundTypeIndexValue);
    end else
        result += 'nil';
    result += ', ';  
    result += 'maxInventoryAmmo=';
    result += IntToStr(maxInventoryAmmo);
    result += '}';
end;

end.