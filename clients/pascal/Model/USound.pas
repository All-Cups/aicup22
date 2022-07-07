unit USound;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UVec2 in 'Model/UVec2.pas';

type
    // Sound heard by one of your units
    TSound = class
        // Sound type index (starting with 0)
        typeIndex: Int32;
        // Id of unit that heard this sound
        unitId: Int32;
        // Position where sound was heard (different from sound source position)
        position: TVec2;
        constructor Create(typeIndex: Int32; unitId: Int32; position: TVec2);
        // Read Sound from input stream
        class function ReadFrom(stream: TStream): TSound; static;
        // Write Sound to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TSound.Create(typeIndex: Int32; unitId: Int32; position: TVec2);
begin
    self.typeIndex := typeIndex;
    self.unitId := unitId;
    self.position := position;
end;

class function TSound.ReadFrom(stream: TStream): TSound;
var position: TVec2;
var typeIndex: Int32;
var unitId: Int32;
begin
    typeIndex := stream.ReadInt32;
    unitId := stream.ReadInt32;
    position := TVec2.ReadFrom(stream);
    result := TSound.Create(typeIndex, unitId, position);
end;

procedure TSound.WriteTo(stream: TStream);
begin
    stream.WriteInt32(typeIndex);
    stream.WriteInt32(unitId);
    position.WriteTo(stream);
end;

function TSound.ToString: ansistring;
begin
    result := 'Sound {';
    result += 'typeIndex=';
    result += IntToStr(typeIndex);
    result += ', ';  
    result += 'unitId=';
    result += IntToStr(unitId);
    result += ', ';  
    result += 'position=';
    result += position.ToString;
    result += '}';
end;

end.