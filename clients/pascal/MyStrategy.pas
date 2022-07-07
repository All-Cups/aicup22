unit MyStrategy;

{$mode delphi}{$H+}

interface

uses
    UConstants in 'Model/UConstants.pas',
    UGame in 'Model/UGame.pas',
    UOrder in 'Model/UOrder.pas',
    Generics.Collections,
        Stream,
        SysUtils,
        UUnitOrder in 'Model/UUnitOrder.pas';

type
    TMyStrategy = class
        constructor Create(constants: TConstants);
        function GetOrder(game: TGame): TOrder;
        procedure Finish();
    end;

implementation

constructor TMyStrategy.Create(constants: TConstants);
begin
end;

function TMyStrategy.GetOrder(game: TGame): TOrder;
begin
    result := TOrder.Create(TDictionary<Int32, TUnitOrder>.Create);
end;

procedure TMyStrategy.Finish();
begin
end;

end.