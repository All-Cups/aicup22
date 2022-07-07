unit UItem;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils;

type
    // Lootable item
    TItem = class
        // Write Item to output stream
        procedure WriteTo(stream: TStream); virtual; abstract;
        // Read Item from input stream
        class function ReadFrom(stream: TStream): TItem; static;
    end;

type
    // Weapon
    TItemWeapon = class (TItem)
        // Weapon type index (starting with 0)
        typeIndex: Int32;
        constructor Create(typeIndex: Int32);
        // Read ItemWeapon from input stream
        class function ReadFrom(stream: TStream): TItemWeapon; static;
        // Write ItemWeapon to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Shield potions
    TItemShieldPotions = class (TItem)
        // Amount of potions
        amount: Int32;
        constructor Create(amount: Int32);
        // Read ItemShieldPotions from input stream
        class function ReadFrom(stream: TStream): TItemShieldPotions; static;
        // Write ItemShieldPotions to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Ammo
    TItemAmmo = class (TItem)
        // Weapon type index (starting with 0)
        weaponTypeIndex: Int32;
        // Amount of ammo
        amount: Int32;
        constructor Create(weaponTypeIndex: Int32; amount: Int32);
        // Read ItemAmmo from input stream
        class function ReadFrom(stream: TStream): TItemAmmo; static;
        // Write ItemAmmo to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

implementation

class function TItem.ReadFrom(stream: TStream): TItem;
var tag: Int32;
begin
    tag := stream.ReadInt32;
    case tag of
        0: result := TItemWeapon.ReadFrom(stream);
        1: result := TItemShieldPotions.ReadFrom(stream);
        2: result := TItemAmmo.ReadFrom(stream);
        else raise Exception.Create('Unexpected tag value');
    end;
end;

constructor TItemWeapon.Create(typeIndex: Int32);
begin
    self.typeIndex := typeIndex;
end;

class function TItemWeapon.ReadFrom(stream: TStream): TItemWeapon;
var typeIndex: Int32;
begin
    typeIndex := stream.ReadInt32;
    result := TItemWeapon.Create(typeIndex);
end;

procedure TItemWeapon.WriteTo(stream: TStream);
begin
    stream.WriteInt32(0);
    stream.WriteInt32(typeIndex);
end;

function TItemWeapon.ToString: ansistring;
begin
    result := 'Weapon {';
    result += 'typeIndex=';
    result += IntToStr(typeIndex);
    result += '}';
end;

constructor TItemShieldPotions.Create(amount: Int32);
begin
    self.amount := amount;
end;

class function TItemShieldPotions.ReadFrom(stream: TStream): TItemShieldPotions;
var amount: Int32;
begin
    amount := stream.ReadInt32;
    result := TItemShieldPotions.Create(amount);
end;

procedure TItemShieldPotions.WriteTo(stream: TStream);
begin
    stream.WriteInt32(1);
    stream.WriteInt32(amount);
end;

function TItemShieldPotions.ToString: ansistring;
begin
    result := 'ShieldPotions {';
    result += 'amount=';
    result += IntToStr(amount);
    result += '}';
end;

constructor TItemAmmo.Create(weaponTypeIndex: Int32; amount: Int32);
begin
    self.weaponTypeIndex := weaponTypeIndex;
    self.amount := amount;
end;

class function TItemAmmo.ReadFrom(stream: TStream): TItemAmmo;
var amount: Int32;
var weaponTypeIndex: Int32;
begin
    weaponTypeIndex := stream.ReadInt32;
    amount := stream.ReadInt32;
    result := TItemAmmo.Create(weaponTypeIndex, amount);
end;

procedure TItemAmmo.WriteTo(stream: TStream);
begin
    stream.WriteInt32(2);
    stream.WriteInt32(weaponTypeIndex);
    stream.WriteInt32(amount);
end;

function TItemAmmo.ToString: ansistring;
begin
    result := 'Ammo {';
    result += 'weaponTypeIndex=';
    result += IntToStr(weaponTypeIndex);
    result += ', ';  
    result += 'amount=';
    result += IntToStr(amount);
    result += '}';
end;

end.