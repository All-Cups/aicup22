unit UActionOrder;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils;

type
    // Order to perform an action for unit
    TActionOrder = class
        // Write ActionOrder to output stream
        procedure WriteTo(stream: TStream); virtual; abstract;
        // Read ActionOrder from input stream
        class function ReadFrom(stream: TStream): TActionOrder; static;
    end;

type
    // Pick up loot
    TActionOrderPickup = class (TActionOrder)
        // Loot id
        loot: Int32;
        constructor Create(loot: Int32);
        // Read ActionOrderPickup from input stream
        class function ReadFrom(stream: TStream): TActionOrderPickup; static;
        // Write ActionOrderPickup to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Use shield potion
    TActionOrderUseShieldPotion = class (TActionOrder)
        constructor Create();
        // Read ActionOrderUseShieldPotion from input stream
        class function ReadFrom(stream: TStream): TActionOrderUseShieldPotion; static;
        // Write ActionOrderUseShieldPotion to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Drop shield potions on the ground
    TActionOrderDropShieldPotions = class (TActionOrder)
        // Amount of potions
        amount: Int32;
        constructor Create(amount: Int32);
        // Read ActionOrderDropShieldPotions from input stream
        class function ReadFrom(stream: TStream): TActionOrderDropShieldPotions; static;
        // Write ActionOrderDropShieldPotions to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Drop current weapon
    TActionOrderDropWeapon = class (TActionOrder)
        constructor Create();
        // Read ActionOrderDropWeapon from input stream
        class function ReadFrom(stream: TStream): TActionOrderDropWeapon; static;
        // Write ActionOrderDropWeapon to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Drop ammo
    TActionOrderDropAmmo = class (TActionOrder)
        // Weapon type index (starting with 0)
        weaponTypeIndex: Int32;
        // Amount of ammo
        amount: Int32;
        constructor Create(weaponTypeIndex: Int32; amount: Int32);
        // Read ActionOrderDropAmmo from input stream
        class function ReadFrom(stream: TStream): TActionOrderDropAmmo; static;
        // Write ActionOrderDropAmmo to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Start/continue aiming
    TActionOrderAim = class (TActionOrder)
        // Shoot (only possible in full aim)
        shoot: Boolean;
        constructor Create(shoot: Boolean);
        // Read ActionOrderAim from input stream
        class function ReadFrom(stream: TStream): TActionOrderAim; static;
        // Write ActionOrderAim to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

implementation

class function TActionOrder.ReadFrom(stream: TStream): TActionOrder;
var tag: Int32;
begin
    tag := stream.ReadInt32;
    case tag of
        0: result := TActionOrderPickup.ReadFrom(stream);
        1: result := TActionOrderUseShieldPotion.ReadFrom(stream);
        2: result := TActionOrderDropShieldPotions.ReadFrom(stream);
        3: result := TActionOrderDropWeapon.ReadFrom(stream);
        4: result := TActionOrderDropAmmo.ReadFrom(stream);
        5: result := TActionOrderAim.ReadFrom(stream);
        else raise Exception.Create('Unexpected tag value');
    end;
end;

constructor TActionOrderPickup.Create(loot: Int32);
begin
    self.loot := loot;
end;

class function TActionOrderPickup.ReadFrom(stream: TStream): TActionOrderPickup;
var loot: Int32;
begin
    loot := stream.ReadInt32;
    result := TActionOrderPickup.Create(loot);
end;

procedure TActionOrderPickup.WriteTo(stream: TStream);
begin
    stream.WriteInt32(0);
    stream.WriteInt32(loot);
end;

function TActionOrderPickup.ToString: ansistring;
begin
    result := 'Pickup {';
    result += 'loot=';
    result += IntToStr(loot);
    result += '}';
end;

constructor TActionOrderUseShieldPotion.Create();
begin
end;

class function TActionOrderUseShieldPotion.ReadFrom(stream: TStream): TActionOrderUseShieldPotion;
begin
    result := TActionOrderUseShieldPotion.Create();
end;

procedure TActionOrderUseShieldPotion.WriteTo(stream: TStream);
begin
    stream.WriteInt32(1);
end;

function TActionOrderUseShieldPotion.ToString: ansistring;
begin
    result := 'UseShieldPotion {';
    result += '}';
end;

constructor TActionOrderDropShieldPotions.Create(amount: Int32);
begin
    self.amount := amount;
end;

class function TActionOrderDropShieldPotions.ReadFrom(stream: TStream): TActionOrderDropShieldPotions;
var amount: Int32;
begin
    amount := stream.ReadInt32;
    result := TActionOrderDropShieldPotions.Create(amount);
end;

procedure TActionOrderDropShieldPotions.WriteTo(stream: TStream);
begin
    stream.WriteInt32(2);
    stream.WriteInt32(amount);
end;

function TActionOrderDropShieldPotions.ToString: ansistring;
begin
    result := 'DropShieldPotions {';
    result += 'amount=';
    result += IntToStr(amount);
    result += '}';
end;

constructor TActionOrderDropWeapon.Create();
begin
end;

class function TActionOrderDropWeapon.ReadFrom(stream: TStream): TActionOrderDropWeapon;
begin
    result := TActionOrderDropWeapon.Create();
end;

procedure TActionOrderDropWeapon.WriteTo(stream: TStream);
begin
    stream.WriteInt32(3);
end;

function TActionOrderDropWeapon.ToString: ansistring;
begin
    result := 'DropWeapon {';
    result += '}';
end;

constructor TActionOrderDropAmmo.Create(weaponTypeIndex: Int32; amount: Int32);
begin
    self.weaponTypeIndex := weaponTypeIndex;
    self.amount := amount;
end;

class function TActionOrderDropAmmo.ReadFrom(stream: TStream): TActionOrderDropAmmo;
var amount: Int32;
var weaponTypeIndex: Int32;
begin
    weaponTypeIndex := stream.ReadInt32;
    amount := stream.ReadInt32;
    result := TActionOrderDropAmmo.Create(weaponTypeIndex, amount);
end;

procedure TActionOrderDropAmmo.WriteTo(stream: TStream);
begin
    stream.WriteInt32(4);
    stream.WriteInt32(weaponTypeIndex);
    stream.WriteInt32(amount);
end;

function TActionOrderDropAmmo.ToString: ansistring;
begin
    result := 'DropAmmo {';
    result += 'weaponTypeIndex=';
    result += IntToStr(weaponTypeIndex);
    result += ', ';  
    result += 'amount=';
    result += IntToStr(amount);
    result += '}';
end;

constructor TActionOrderAim.Create(shoot: Boolean);
begin
    self.shoot := shoot;
end;

class function TActionOrderAim.ReadFrom(stream: TStream): TActionOrderAim;
var shoot: Boolean;
begin
    shoot := stream.ReadBoolean;
    result := TActionOrderAim.Create(shoot);
end;

procedure TActionOrderAim.WriteTo(stream: TStream);
begin
    stream.WriteInt32(5);
    stream.WriteBoolean(shoot);
end;

function TActionOrderAim.ToString: ansistring;
begin
    result := 'Aim {';
    result += 'shoot=';
    result += BoolToStr(shoot);
    result += '}';
end;

end.