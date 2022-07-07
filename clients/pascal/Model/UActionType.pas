unit UActionType;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils;

type
    // Type of action a unit is currently performing
    {$scopedEnums on}
    TActionType = (
        // Picking up or dropping loot
        Looting = 0,
        // Using a shield potion
        UseShieldPotion = 1);

implementation

end.