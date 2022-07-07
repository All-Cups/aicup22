unit UOrder;

{$mode delphi}{$H+}

interface

uses
    Generics.Collections,
    Stream,
    SysUtils,
    UUnitOrder in 'Model/UUnitOrder.pas';

type
    // Player's (team's) orders
    TOrder = class
        // Orders for each of your units
        unitOrders: TDictionary<Int32, TUnitOrder>;
        constructor Create(unitOrders: TDictionary<Int32, TUnitOrder>);
        // Read Order from input stream
        class function ReadFrom(stream: TStream): TOrder; static;
        // Write Order to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TOrder.Create(unitOrders: TDictionary<Int32, TUnitOrder>);
begin
    self.unitOrders := unitOrders;
end;

class function TOrder.ReadFrom(stream: TStream): TOrder;
var unitOrders: TDictionary<Int32, TUnitOrder>;
var unitOrdersIndex: Int32;
var unitOrdersKey: Int32;
var unitOrdersSize: Int32;
var unitOrdersValue: TUnitOrder;
begin
    unitOrders := TDictionary<Int32, TUnitOrder>.Create;
    unitOrdersSize := stream.ReadInt32;
    for unitOrdersIndex := 1 to unitOrdersSize do begin
        unitOrdersKey := stream.ReadInt32;
        unitOrdersValue := TUnitOrder.ReadFrom(stream);
        unitOrders.Add(unitOrdersKey, unitOrdersValue);
    end;
    result := TOrder.Create(unitOrders);
end;

procedure TOrder.WriteTo(stream: TStream);
var unitOrdersKey: Int32;
var unitOrdersValue: TUnitOrder;
begin
    stream.WriteInt32(unitOrders.Count);
    for unitOrdersKey in unitOrders.Keys do begin
        unitOrdersValue := unitOrders.Items[unitOrdersKey];
        stream.WriteInt32(unitOrdersKey);
        unitOrdersValue.WriteTo(stream);
    end;
end;

function TOrder.ToString: ansistring;
var unitOrdersFirst: Boolean;
var unitOrdersKey: Int32;
var unitOrdersValue: TUnitOrder;
begin
    result := 'Order {';
    result += 'unitOrders=';
    result += '[';
    unitOrdersFirst := true;
    for unitOrdersKey in unitOrders.Keys do begin
        if not unitOrdersFirst then
            result += ', ';
        unitOrdersFirst := false;
        unitOrdersValue := unitOrders.Items[unitOrdersKey];
        result += IntToStr(unitOrdersKey);;
        result += ': ';
        result += unitOrdersValue.ToString;;
    end;
    result += ']';
    result += '}';
end;

end.