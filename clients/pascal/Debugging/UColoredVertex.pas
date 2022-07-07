unit UColoredVertex;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UColor in 'Debugging/UColor.pas',
    UVec2 in 'Model/UVec2.pas';

type
    // Point + color
    TColoredVertex = class
        // Position
        position: TVec2;
        // Color
        color: TColor;
        constructor Create(position: TVec2; color: TColor);
        // Read ColoredVertex from input stream
        class function ReadFrom(stream: TStream): TColoredVertex; static;
        // Write ColoredVertex to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TColoredVertex.Create(position: TVec2; color: TColor);
begin
    self.position := position;
    self.color := color;
end;

class function TColoredVertex.ReadFrom(stream: TStream): TColoredVertex;
var color: TColor;
var position: TVec2;
begin
    position := TVec2.ReadFrom(stream);
    color := TColor.ReadFrom(stream);
    result := TColoredVertex.Create(position, color);
end;

procedure TColoredVertex.WriteTo(stream: TStream);
begin
    position.WriteTo(stream);
    color.WriteTo(stream);
end;

function TColoredVertex.ToString: ansistring;
begin
    result := 'ColoredVertex {';
    result += 'position=';
    result += position.ToString;
    result += ', ';  
    result += 'color=';
    result += color.ToString;
    result += '}';
end;

end.