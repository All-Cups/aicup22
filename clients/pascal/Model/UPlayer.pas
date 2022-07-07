unit UPlayer;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils;

type
    // Game's participant (team of units)
    TPlayer = class
        // Unique id
        id: Int32;
        // Number of kills
        kills: Int32;
        // Total damage dealt to enemies
        damage: Double;
        // Survival place (number of survivor teams currently/at the moment of death)
        place: Int32;
        // Team score
        score: Double;
        constructor Create(id: Int32; kills: Int32; damage: Double; place: Int32; score: Double);
        // Read Player from input stream
        class function ReadFrom(stream: TStream): TPlayer; static;
        // Write Player to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TPlayer.Create(id: Int32; kills: Int32; damage: Double; place: Int32; score: Double);
begin
    self.id := id;
    self.kills := kills;
    self.damage := damage;
    self.place := place;
    self.score := score;
end;

class function TPlayer.ReadFrom(stream: TStream): TPlayer;
var damage: Double;
var id: Int32;
var kills: Int32;
var place: Int32;
var score: Double;
begin
    id := stream.ReadInt32;
    kills := stream.ReadInt32;
    damage := stream.ReadDouble;
    place := stream.ReadInt32;
    score := stream.ReadDouble;
    result := TPlayer.Create(id, kills, damage, place, score);
end;

procedure TPlayer.WriteTo(stream: TStream);
begin
    stream.WriteInt32(id);
    stream.WriteInt32(kills);
    stream.WriteDouble(damage);
    stream.WriteInt32(place);
    stream.WriteDouble(score);
end;

function TPlayer.ToString: ansistring;
begin
    result := 'Player {';
    result += 'id=';
    result += IntToStr(id);
    result += ', ';  
    result += 'kills=';
    result += IntToStr(kills);
    result += ', ';  
    result += 'damage=';
    result += FloatToStr(damage);
    result += ', ';  
    result += 'place=';
    result += IntToStr(place);
    result += ', ';  
    result += 'score=';
    result += FloatToStr(score);
    result += '}';
end;

end.