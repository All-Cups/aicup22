unit ULoot;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UItem in 'Model/UItem.pas',
    UVec2 in 'Model/UVec2.pas';

type
    // Loot lying on the ground
    TLoot = class
        // Unique id
        id: Int32;
        // Position
        position: TVec2;
        // Item
        item: TItem;
        constructor Create(id: Int32; position: TVec2; item: TItem);
        // Read Loot from input stream
        class function ReadFrom(stream: TStream): TLoot; static;
        // Write Loot to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TLoot.Create(id: Int32; position: TVec2; item: TItem);
begin
    self.id := id;
    self.position := position;
    self.item := item;
end;

class function TLoot.ReadFrom(stream: TStream): TLoot;
var id: Int32;
var item: TItem;
var position: TVec2;
begin
    id := stream.ReadInt32;
    position := TVec2.ReadFrom(stream);
    item := TItem.ReadFrom(stream);
    result := TLoot.Create(id, position, item);
end;

procedure TLoot.WriteTo(stream: TStream);
begin
    stream.WriteInt32(id);
    position.WriteTo(stream);
    item.WriteTo(stream);
end;

function TLoot.ToString: ansistring;
begin
    result := 'Loot {';
    result += 'id=';
    result += IntToStr(id);
    result += ', ';  
    result += 'position=';
    result += position.ToString;
    result += ', ';  
    result += 'item=';
    result += item.ToString;
    result += '}';
end;

end.