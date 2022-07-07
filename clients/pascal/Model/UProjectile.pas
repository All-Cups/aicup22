unit UProjectile;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UVec2 in 'Model/UVec2.pas';

type
    // Weapon projectile
    TProjectile = class
        // Unique id
        id: Int32;
        // Index of the weapon this projectile was shot from (starts with 0)
        weaponTypeIndex: Int32;
        // Id of unit who made the shot
        shooterId: Int32;
        // Id of player (team), whose unit made the shot
        shooterPlayerId: Int32;
        // Current position
        position: TVec2;
        // Projectile's velocity
        velocity: TVec2;
        // Left time of projectile's life
        lifeTime: Double;
        constructor Create(id: Int32; weaponTypeIndex: Int32; shooterId: Int32; shooterPlayerId: Int32; position: TVec2; velocity: TVec2; lifeTime: Double);
        // Read Projectile from input stream
        class function ReadFrom(stream: TStream): TProjectile; static;
        // Write Projectile to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TProjectile.Create(id: Int32; weaponTypeIndex: Int32; shooterId: Int32; shooterPlayerId: Int32; position: TVec2; velocity: TVec2; lifeTime: Double);
begin
    self.id := id;
    self.weaponTypeIndex := weaponTypeIndex;
    self.shooterId := shooterId;
    self.shooterPlayerId := shooterPlayerId;
    self.position := position;
    self.velocity := velocity;
    self.lifeTime := lifeTime;
end;

class function TProjectile.ReadFrom(stream: TStream): TProjectile;
var id: Int32;
var lifeTime: Double;
var position: TVec2;
var shooterId: Int32;
var shooterPlayerId: Int32;
var velocity: TVec2;
var weaponTypeIndex: Int32;
begin
    id := stream.ReadInt32;
    weaponTypeIndex := stream.ReadInt32;
    shooterId := stream.ReadInt32;
    shooterPlayerId := stream.ReadInt32;
    position := TVec2.ReadFrom(stream);
    velocity := TVec2.ReadFrom(stream);
    lifeTime := stream.ReadDouble;
    result := TProjectile.Create(id, weaponTypeIndex, shooterId, shooterPlayerId, position, velocity, lifeTime);
end;

procedure TProjectile.WriteTo(stream: TStream);
begin
    stream.WriteInt32(id);
    stream.WriteInt32(weaponTypeIndex);
    stream.WriteInt32(shooterId);
    stream.WriteInt32(shooterPlayerId);
    position.WriteTo(stream);
    velocity.WriteTo(stream);
    stream.WriteDouble(lifeTime);
end;

function TProjectile.ToString: ansistring;
begin
    result := 'Projectile {';
    result += 'id=';
    result += IntToStr(id);
    result += ', ';  
    result += 'weaponTypeIndex=';
    result += IntToStr(weaponTypeIndex);
    result += ', ';  
    result += 'shooterId=';
    result += IntToStr(shooterId);
    result += ', ';  
    result += 'shooterPlayerId=';
    result += IntToStr(shooterPlayerId);
    result += ', ';  
    result += 'position=';
    result += position.ToString;
    result += ', ';  
    result += 'velocity=';
    result += velocity.ToString;
    result += ', ';  
    result += 'lifeTime=';
    result += FloatToStr(lifeTime);
    result += '}';
end;

end.