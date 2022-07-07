unit UZone;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UVec2 in 'Model/UVec2.pas';

type
    // Current state of the game zone
    TZone = class
        // Current center
        currentCenter: TVec2;
        // Current radius
        currentRadius: Double;
        // Next center
        nextCenter: TVec2;
        // Next radius
        nextRadius: Double;
        constructor Create(currentCenter: TVec2; currentRadius: Double; nextCenter: TVec2; nextRadius: Double);
        // Read Zone from input stream
        class function ReadFrom(stream: TStream): TZone; static;
        // Write Zone to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TZone.Create(currentCenter: TVec2; currentRadius: Double; nextCenter: TVec2; nextRadius: Double);
begin
    self.currentCenter := currentCenter;
    self.currentRadius := currentRadius;
    self.nextCenter := nextCenter;
    self.nextRadius := nextRadius;
end;

class function TZone.ReadFrom(stream: TStream): TZone;
var currentCenter: TVec2;
var currentRadius: Double;
var nextCenter: TVec2;
var nextRadius: Double;
begin
    currentCenter := TVec2.ReadFrom(stream);
    currentRadius := stream.ReadDouble;
    nextCenter := TVec2.ReadFrom(stream);
    nextRadius := stream.ReadDouble;
    result := TZone.Create(currentCenter, currentRadius, nextCenter, nextRadius);
end;

procedure TZone.WriteTo(stream: TStream);
begin
    currentCenter.WriteTo(stream);
    stream.WriteDouble(currentRadius);
    nextCenter.WriteTo(stream);
    stream.WriteDouble(nextRadius);
end;

function TZone.ToString: ansistring;
begin
    result := 'Zone {';
    result += 'currentCenter=';
    result += currentCenter.ToString;
    result += ', ';  
    result += 'currentRadius=';
    result += FloatToStr(currentRadius);
    result += ', ';  
    result += 'nextCenter=';
    result += nextCenter.ToString;
    result += ', ';  
    result += 'nextRadius=';
    result += FloatToStr(nextRadius);
    result += '}';
end;

end.