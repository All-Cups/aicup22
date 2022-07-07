unit UAction;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UActionType in 'Model/UActionType.pas';

type
    // Action unit is currently performing
    TAction = class
        // Tick when the action will be finished
        finishTick: Int32;
        // Type of the action
        actionType: TActionType;
        constructor Create(finishTick: Int32; actionType: TActionType);
        // Read Action from input stream
        class function ReadFrom(stream: TStream): TAction; static;
        // Write Action to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TAction.Create(finishTick: Int32; actionType: TActionType);
begin
    self.finishTick := finishTick;
    self.actionType := actionType;
end;

class function TAction.ReadFrom(stream: TStream): TAction;
var actionType: TActionType;
var finishTick: Int32;
begin
    finishTick := stream.ReadInt32;
    actionType := TActionType(stream.ReadInt32);
    result := TAction.Create(finishTick, actionType);
end;

procedure TAction.WriteTo(stream: TStream);
begin
    stream.WriteInt32(finishTick);
    stream.WriteInt32(ord(actionType));
end;

function TAction.ToString: ansistring;
var actionTypeName: String;
begin
    result := 'Action {';
    result += 'finishTick=';
    result += IntToStr(finishTick);
    result += ', ';  
    result += 'actionType=';
    WriteStr(actionTypeName, actionType);
    result += actionTypeName;
    result += '}';
end;

end.