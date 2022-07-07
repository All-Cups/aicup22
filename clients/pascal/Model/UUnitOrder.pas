unit UUnitOrder;

{$mode delphi}{$H+}

interface

uses
    Nullable,
    Stream,
    SysUtils,
    UActionOrder in 'Model/UActionOrder.pas',
    UVec2 in 'Model/UVec2.pas';

type
    // Order for specific unit
    TUnitOrder = class
        // Target moving velocity
        targetVelocity: TVec2;
        // Target view direction (vector length doesn't matter)
        targetDirection: TVec2;
        // Order to perform an action, or None
        action: TNullable<TActionOrder>;
        constructor Create(targetVelocity: TVec2; targetDirection: TVec2; action: TNullable<TActionOrder>);
        // Read UnitOrder from input stream
        class function ReadFrom(stream: TStream): TUnitOrder; static;
        // Write UnitOrder to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TUnitOrder.Create(targetVelocity: TVec2; targetDirection: TVec2; action: TNullable<TActionOrder>);
begin
    self.targetVelocity := targetVelocity;
    self.targetDirection := targetDirection;
    self.action := action;
end;

class function TUnitOrder.ReadFrom(stream: TStream): TUnitOrder;
var action: TNullable<TActionOrder>;
var actionValue: TActionOrder;
var targetDirection: TVec2;
var targetVelocity: TVec2;
begin
    targetVelocity := TVec2.ReadFrom(stream);
    targetDirection := TVec2.ReadFrom(stream);
    if stream.ReadBoolean then begin
        actionValue := TActionOrder.ReadFrom(stream);
        action := actionValue;
    end else
        action := nil;
    result := TUnitOrder.Create(targetVelocity, targetDirection, action);
end;

procedure TUnitOrder.WriteTo(stream: TStream);
var actionValue: TActionOrder;
begin
    targetVelocity.WriteTo(stream);
    targetDirection.WriteTo(stream);
    if action.HasValue then begin
        stream.WriteBoolean(true);
        actionValue := action.Value;
        actionValue.WriteTo(stream);
    end else
        stream.WriteBoolean(false);
end;

function TUnitOrder.ToString: ansistring;
var actionValue: TActionOrder;
begin
    result := 'UnitOrder {';
    result += 'targetVelocity=';
    result += targetVelocity.ToString;
    result += ', ';  
    result += 'targetDirection=';
    result += targetDirection.ToString;
    result += ', ';  
    result += 'action=';
    if action.HasValue then begin
        actionValue := action.Value;
        result += actionValue.ToString;
    end else
        result += 'nil';
    result += '}';
end;

end.