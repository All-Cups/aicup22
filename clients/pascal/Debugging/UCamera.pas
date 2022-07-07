unit UCamera;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UVec2 in 'Model/UVec2.pas';

type
    // Camera state
    TCamera = class
        // Center
        center: TVec2;
        // Rotation
        rotation: Double;
        // Attack angle
        attack: Double;
        // Vertical field of view
        fov: Double;
        constructor Create(center: TVec2; rotation: Double; attack: Double; fov: Double);
        // Read Camera from input stream
        class function ReadFrom(stream: TStream): TCamera; static;
        // Write Camera to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TCamera.Create(center: TVec2; rotation: Double; attack: Double; fov: Double);
begin
    self.center := center;
    self.rotation := rotation;
    self.attack := attack;
    self.fov := fov;
end;

class function TCamera.ReadFrom(stream: TStream): TCamera;
var attack: Double;
var center: TVec2;
var fov: Double;
var rotation: Double;
begin
    center := TVec2.ReadFrom(stream);
    rotation := stream.ReadDouble;
    attack := stream.ReadDouble;
    fov := stream.ReadDouble;
    result := TCamera.Create(center, rotation, attack, fov);
end;

procedure TCamera.WriteTo(stream: TStream);
begin
    center.WriteTo(stream);
    stream.WriteDouble(rotation);
    stream.WriteDouble(attack);
    stream.WriteDouble(fov);
end;

function TCamera.ToString: ansistring;
begin
    result := 'Camera {';
    result += 'center=';
    result += center.ToString;
    result += ', ';  
    result += 'rotation=';
    result += FloatToStr(rotation);
    result += ', ';  
    result += 'attack=';
    result += FloatToStr(attack);
    result += ', ';  
    result += 'fov=';
    result += FloatToStr(fov);
    result += '}';
end;

end.