unit UDebugState;

{$mode delphi}{$H+}

interface

uses
    Nullable,
    Stream,
    SysUtils,
    UCamera in 'Debugging/UCamera.pas',
    UVec2 in 'Model/UVec2.pas';

type
    // Renderer's state
    TDebugState = class
        // Pressed keys
        pressedKeys: TArray<String>;
        // Cursor's position in game coordinates
        cursorWorldPosition: TVec2;
        // Id of unit which is followed by the camera, or None
        lockedUnit: TNullable<Int32>;
        // Current camera state
        camera: TCamera;
        constructor Create(pressedKeys: TArray<String>; cursorWorldPosition: TVec2; lockedUnit: TNullable<Int32>; camera: TCamera);
        // Read DebugState from input stream
        class function ReadFrom(stream: TStream): TDebugState; static;
        // Write DebugState to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TDebugState.Create(pressedKeys: TArray<String>; cursorWorldPosition: TVec2; lockedUnit: TNullable<Int32>; camera: TCamera);
begin
    self.pressedKeys := pressedKeys;
    self.cursorWorldPosition := cursorWorldPosition;
    self.lockedUnit := lockedUnit;
    self.camera := camera;
end;

class function TDebugState.ReadFrom(stream: TStream): TDebugState;
var camera: TCamera;
var cursorWorldPosition: TVec2;
var lockedUnit: TNullable<Int32>;
var lockedUnitValue: Int32;
var pressedKeys: TArray<String>;
var pressedKeysElement: String;
var pressedKeysIndex: Int32;
begin
    pressedKeys := TArray<String>.Create;
    SetLength(pressedKeys, stream.ReadInt32);
    for pressedKeysIndex := 0 to Length(pressedKeys) - 1 do begin
        pressedKeysElement := stream.ReadString;
        pressedKeys[pressedKeysIndex] := pressedKeysElement;
    end;
    cursorWorldPosition := TVec2.ReadFrom(stream);
    if stream.ReadBoolean then begin
        lockedUnitValue := stream.ReadInt32;
        lockedUnit := lockedUnitValue;
    end else
        lockedUnit := nil;
    camera := TCamera.ReadFrom(stream);
    result := TDebugState.Create(pressedKeys, cursorWorldPosition, lockedUnit, camera);
end;

procedure TDebugState.WriteTo(stream: TStream);
var lockedUnitValue: Int32;
var pressedKeysElement: String;
begin
    stream.WriteInt32(Length(pressedKeys));
    for pressedKeysElement in pressedKeys do begin
        stream.WriteString(pressedKeysElement);
    end;
    cursorWorldPosition.WriteTo(stream);
    if lockedUnit.HasValue then begin
        stream.WriteBoolean(true);
        lockedUnitValue := lockedUnit.Value;
        stream.WriteInt32(lockedUnitValue);
    end else
        stream.WriteBoolean(false);
    camera.WriteTo(stream);
end;

function TDebugState.ToString: ansistring;
var lockedUnitValue: Int32;
var pressedKeysElement: String;
var pressedKeysIndex: Int32;
begin
    result := 'DebugState {';
    result += 'pressedKeys=';
    result += '[';
    for pressedKeysIndex := 0 to Length(pressedKeys) - 1 do begin
        if pressedKeysIndex <> 0 then
            result += ', ';
        pressedKeysElement := pressedKeys[pressedKeysIndex];
        result += '''';
        result += pressedKeysElement;
        result += '''';;
    end;
    result += ']';
    result += ', ';  
    result += 'cursorWorldPosition=';
    result += cursorWorldPosition.ToString;
    result += ', ';  
    result += 'lockedUnit=';
    if lockedUnit.HasValue then begin
        lockedUnitValue := lockedUnit.Value;
        result += IntToStr(lockedUnitValue);
    end else
        result += 'nil';
    result += ', ';  
    result += 'camera=';
    result += camera.ToString;
    result += '}';
end;

end.