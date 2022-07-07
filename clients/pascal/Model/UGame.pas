unit UGame;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    ULoot in 'Model/ULoot.pas',
    UPlayer in 'Model/UPlayer.pas',
    UProjectile in 'Model/UProjectile.pas',
    USound in 'Model/USound.pas',
    UUnit in 'Model/UUnit.pas',
    UZone in 'Model/UZone.pas';

type
    // Current game's state
    TGame = class
        // Your player's id
        myId: Int32;
        // List of players (teams)
        players: TArray<TPlayer>;
        // Current tick
        currentTick: Int32;
        // List of units visible by your team
        units: TArray<TUnit>;
        // List of loot visible by your team
        loot: TArray<TLoot>;
        // List of projectiles visible by your team
        projectiles: TArray<TProjectile>;
        // Current state of game zone
        zone: TZone;
        // List of sounds heard by your team during last tick
        sounds: TArray<TSound>;
        constructor Create(myId: Int32; players: TArray<TPlayer>; currentTick: Int32; units: TArray<TUnit>; loot: TArray<TLoot>; projectiles: TArray<TProjectile>; zone: TZone; sounds: TArray<TSound>);
        // Read Game from input stream
        class function ReadFrom(stream: TStream): TGame; static;
        // Write Game to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TGame.Create(myId: Int32; players: TArray<TPlayer>; currentTick: Int32; units: TArray<TUnit>; loot: TArray<TLoot>; projectiles: TArray<TProjectile>; zone: TZone; sounds: TArray<TSound>);
begin
    self.myId := myId;
    self.players := players;
    self.currentTick := currentTick;
    self.units := units;
    self.loot := loot;
    self.projectiles := projectiles;
    self.zone := zone;
    self.sounds := sounds;
end;

class function TGame.ReadFrom(stream: TStream): TGame;
var currentTick: Int32;
var loot: TArray<TLoot>;
var lootElement: TLoot;
var lootIndex: Int32;
var myId: Int32;
var players: TArray<TPlayer>;
var playersElement: TPlayer;
var playersIndex: Int32;
var projectiles: TArray<TProjectile>;
var projectilesElement: TProjectile;
var projectilesIndex: Int32;
var sounds: TArray<TSound>;
var soundsElement: TSound;
var soundsIndex: Int32;
var units: TArray<TUnit>;
var unitsElement: TUnit;
var unitsIndex: Int32;
var zone: TZone;
begin
    myId := stream.ReadInt32;
    players := TArray<TPlayer>.Create;
    SetLength(players, stream.ReadInt32);
    for playersIndex := 0 to Length(players) - 1 do begin
        playersElement := TPlayer.ReadFrom(stream);
        players[playersIndex] := playersElement;
    end;
    currentTick := stream.ReadInt32;
    units := TArray<TUnit>.Create;
    SetLength(units, stream.ReadInt32);
    for unitsIndex := 0 to Length(units) - 1 do begin
        unitsElement := TUnit.ReadFrom(stream);
        units[unitsIndex] := unitsElement;
    end;
    loot := TArray<TLoot>.Create;
    SetLength(loot, stream.ReadInt32);
    for lootIndex := 0 to Length(loot) - 1 do begin
        lootElement := TLoot.ReadFrom(stream);
        loot[lootIndex] := lootElement;
    end;
    projectiles := TArray<TProjectile>.Create;
    SetLength(projectiles, stream.ReadInt32);
    for projectilesIndex := 0 to Length(projectiles) - 1 do begin
        projectilesElement := TProjectile.ReadFrom(stream);
        projectiles[projectilesIndex] := projectilesElement;
    end;
    zone := TZone.ReadFrom(stream);
    sounds := TArray<TSound>.Create;
    SetLength(sounds, stream.ReadInt32);
    for soundsIndex := 0 to Length(sounds) - 1 do begin
        soundsElement := TSound.ReadFrom(stream);
        sounds[soundsIndex] := soundsElement;
    end;
    result := TGame.Create(myId, players, currentTick, units, loot, projectiles, zone, sounds);
end;

procedure TGame.WriteTo(stream: TStream);
var lootElement: TLoot;
var playersElement: TPlayer;
var projectilesElement: TProjectile;
var soundsElement: TSound;
var unitsElement: TUnit;
begin
    stream.WriteInt32(myId);
    stream.WriteInt32(Length(players));
    for playersElement in players do begin
        playersElement.WriteTo(stream);
    end;
    stream.WriteInt32(currentTick);
    stream.WriteInt32(Length(units));
    for unitsElement in units do begin
        unitsElement.WriteTo(stream);
    end;
    stream.WriteInt32(Length(loot));
    for lootElement in loot do begin
        lootElement.WriteTo(stream);
    end;
    stream.WriteInt32(Length(projectiles));
    for projectilesElement in projectiles do begin
        projectilesElement.WriteTo(stream);
    end;
    zone.WriteTo(stream);
    stream.WriteInt32(Length(sounds));
    for soundsElement in sounds do begin
        soundsElement.WriteTo(stream);
    end;
end;

function TGame.ToString: ansistring;
var lootElement: TLoot;
var lootIndex: Int32;
var playersElement: TPlayer;
var playersIndex: Int32;
var projectilesElement: TProjectile;
var projectilesIndex: Int32;
var soundsElement: TSound;
var soundsIndex: Int32;
var unitsElement: TUnit;
var unitsIndex: Int32;
begin
    result := 'Game {';
    result += 'myId=';
    result += IntToStr(myId);
    result += ', ';  
    result += 'players=';
    result += '[';
    for playersIndex := 0 to Length(players) - 1 do begin
        if playersIndex <> 0 then
            result += ', ';
        playersElement := players[playersIndex];
        result += playersElement.ToString;;
    end;
    result += ']';
    result += ', ';  
    result += 'currentTick=';
    result += IntToStr(currentTick);
    result += ', ';  
    result += 'units=';
    result += '[';
    for unitsIndex := 0 to Length(units) - 1 do begin
        if unitsIndex <> 0 then
            result += ', ';
        unitsElement := units[unitsIndex];
        result += unitsElement.ToString;;
    end;
    result += ']';
    result += ', ';  
    result += 'loot=';
    result += '[';
    for lootIndex := 0 to Length(loot) - 1 do begin
        if lootIndex <> 0 then
            result += ', ';
        lootElement := loot[lootIndex];
        result += lootElement.ToString;;
    end;
    result += ']';
    result += ', ';  
    result += 'projectiles=';
    result += '[';
    for projectilesIndex := 0 to Length(projectiles) - 1 do begin
        if projectilesIndex <> 0 then
            result += ', ';
        projectilesElement := projectiles[projectilesIndex];
        result += projectilesElement.ToString;;
    end;
    result += ']';
    result += ', ';  
    result += 'zone=';
    result += zone.ToString;
    result += ', ';  
    result += 'sounds=';
    result += '[';
    for soundsIndex := 0 to Length(sounds) - 1 do begin
        if soundsIndex <> 0 then
            result += ', ';
        soundsElement := sounds[soundsIndex];
        result += soundsElement.ToString;;
    end;
    result += ']';
    result += '}';
end;

end.