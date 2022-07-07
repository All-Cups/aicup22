unit UObstacle;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UVec2 in 'Model/UVec2.pas';

type
    // An obstacle on the map
    TObstacle = class
        // Unique id
        id: Int32;
        // Center position
        position: TVec2;
        // Obstacle's radius
        radius: Double;
        // Whether units can see through this obstacle, or it blocks the view
        canSeeThrough: Boolean;
        // Whether projectiles can go through this obstacle
        canShootThrough: Boolean;
        constructor Create(id: Int32; position: TVec2; radius: Double; canSeeThrough: Boolean; canShootThrough: Boolean);
        // Read Obstacle from input stream
        class function ReadFrom(stream: TStream): TObstacle; static;
        // Write Obstacle to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TObstacle.Create(id: Int32; position: TVec2; radius: Double; canSeeThrough: Boolean; canShootThrough: Boolean);
begin
    self.id := id;
    self.position := position;
    self.radius := radius;
    self.canSeeThrough := canSeeThrough;
    self.canShootThrough := canShootThrough;
end;

class function TObstacle.ReadFrom(stream: TStream): TObstacle;
var canSeeThrough: Boolean;
var canShootThrough: Boolean;
var id: Int32;
var position: TVec2;
var radius: Double;
begin
    id := stream.ReadInt32;
    position := TVec2.ReadFrom(stream);
    radius := stream.ReadDouble;
    canSeeThrough := stream.ReadBoolean;
    canShootThrough := stream.ReadBoolean;
    result := TObstacle.Create(id, position, radius, canSeeThrough, canShootThrough);
end;

procedure TObstacle.WriteTo(stream: TStream);
begin
    stream.WriteInt32(id);
    position.WriteTo(stream);
    stream.WriteDouble(radius);
    stream.WriteBoolean(canSeeThrough);
    stream.WriteBoolean(canShootThrough);
end;

function TObstacle.ToString: ansistring;
begin
    result := 'Obstacle {';
    result += 'id=';
    result += IntToStr(id);
    result += ', ';  
    result += 'position=';
    result += position.ToString;
    result += ', ';  
    result += 'radius=';
    result += FloatToStr(radius);
    result += ', ';  
    result += 'canSeeThrough=';
    result += BoolToStr(canSeeThrough);
    result += ', ';  
    result += 'canShootThrough=';
    result += BoolToStr(canShootThrough);
    result += '}';
end;

end.