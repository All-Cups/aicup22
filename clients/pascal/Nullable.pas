unit Nullable;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils;

type
  TNullable<T> = record
  private
    FHasValue: Boolean;
    FValue: T;
    function GetValue: T;
    procedure SetValue(AValue: T);
  public
    procedure Clear;
    property HasValue: Boolean read FHasValue;
    property Value: T read GetValue write SetValue;
    class operator Implicit(A: T): TNullable<T>;
    class operator Implicit(A: Pointer): TNullable<T>;
  end;

implementation

{ TNullable }

function TNullable<T>.GetValue: T;
begin
  if FHasValue then
     Result := FValue
  else
    raise Exception.Create('Variable has no value');
end;

procedure TNullable<T>.SetValue(AValue: T);
begin
  FValue := AValue;
  FHasValue := True;
end;

procedure TNullable<T>.Clear;
begin
  FHasValue := False;
end;

class operator TNullable<T>.Implicit(A: T): TNullable<T>;
begin
  Result.Value := A;
end;

class operator TNullable<T>.Implicit(A: Pointer): TNullable<T>;
begin
  if A = nil then Result.Clear
  else raise Exception.Create('Pointer value not allowed');
end;

end.
