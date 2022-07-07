unit UClientMessage;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UDebugCommand in 'Debugging/UDebugCommand.pas',
    UOrder in 'Model/UOrder.pas';

type
    // Message sent from client
    TClientMessage = class
        // Write ClientMessage to output stream
        procedure WriteTo(stream: TStream); virtual; abstract;
        // Read ClientMessage from input stream
        class function ReadFrom(stream: TStream): TClientMessage; static;
    end;

type
    // Ask app to perform new debug command
    TClientMessageDebugMessage = class (TClientMessage)
        // Command to perform
        command: TDebugCommand;
        constructor Create(command: TDebugCommand);
        // Read ClientMessageDebugMessage from input stream
        class function ReadFrom(stream: TStream): TClientMessageDebugMessage; static;
        // Write ClientMessageDebugMessage to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Reply for ServerMessage::GetOrder
    TClientMessageOrderMessage = class (TClientMessage)
        // Player's order
        order: TOrder;
        constructor Create(order: TOrder);
        // Read ClientMessageOrderMessage from input stream
        class function ReadFrom(stream: TStream): TClientMessageOrderMessage; static;
        // Write ClientMessageOrderMessage to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Signifies finish of the debug update
    TClientMessageDebugUpdateDone = class (TClientMessage)
        constructor Create();
        // Read ClientMessageDebugUpdateDone from input stream
        class function ReadFrom(stream: TStream): TClientMessageDebugUpdateDone; static;
        // Write ClientMessageDebugUpdateDone to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Request debug state from the app
    TClientMessageRequestDebugState = class (TClientMessage)
        constructor Create();
        // Read ClientMessageRequestDebugState from input stream
        class function ReadFrom(stream: TStream): TClientMessageRequestDebugState; static;
        // Write ClientMessageRequestDebugState to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

implementation

class function TClientMessage.ReadFrom(stream: TStream): TClientMessage;
var tag: Int32;
begin
    tag := stream.ReadInt32;
    case tag of
        0: result := TClientMessageDebugMessage.ReadFrom(stream);
        1: result := TClientMessageOrderMessage.ReadFrom(stream);
        2: result := TClientMessageDebugUpdateDone.ReadFrom(stream);
        3: result := TClientMessageRequestDebugState.ReadFrom(stream);
        else raise Exception.Create('Unexpected tag value');
    end;
end;

constructor TClientMessageDebugMessage.Create(command: TDebugCommand);
begin
    self.command := command;
end;

class function TClientMessageDebugMessage.ReadFrom(stream: TStream): TClientMessageDebugMessage;
var command: TDebugCommand;
begin
    command := TDebugCommand.ReadFrom(stream);
    result := TClientMessageDebugMessage.Create(command);
end;

procedure TClientMessageDebugMessage.WriteTo(stream: TStream);
begin
    stream.WriteInt32(0);
    command.WriteTo(stream);
end;

function TClientMessageDebugMessage.ToString: ansistring;
begin
    result := 'DebugMessage {';
    result += 'command=';
    result += command.ToString;
    result += '}';
end;

constructor TClientMessageOrderMessage.Create(order: TOrder);
begin
    self.order := order;
end;

class function TClientMessageOrderMessage.ReadFrom(stream: TStream): TClientMessageOrderMessage;
var order: TOrder;
begin
    order := TOrder.ReadFrom(stream);
    result := TClientMessageOrderMessage.Create(order);
end;

procedure TClientMessageOrderMessage.WriteTo(stream: TStream);
begin
    stream.WriteInt32(1);
    order.WriteTo(stream);
end;

function TClientMessageOrderMessage.ToString: ansistring;
begin
    result := 'OrderMessage {';
    result += 'order=';
    result += order.ToString;
    result += '}';
end;

constructor TClientMessageDebugUpdateDone.Create();
begin
end;

class function TClientMessageDebugUpdateDone.ReadFrom(stream: TStream): TClientMessageDebugUpdateDone;
begin
    result := TClientMessageDebugUpdateDone.Create();
end;

procedure TClientMessageDebugUpdateDone.WriteTo(stream: TStream);
begin
    stream.WriteInt32(2);
end;

function TClientMessageDebugUpdateDone.ToString: ansistring;
begin
    result := 'DebugUpdateDone {';
    result += '}';
end;

constructor TClientMessageRequestDebugState.Create();
begin
end;

class function TClientMessageRequestDebugState.ReadFrom(stream: TStream): TClientMessageRequestDebugState;
begin
    result := TClientMessageRequestDebugState.Create();
end;

procedure TClientMessageRequestDebugState.WriteTo(stream: TStream);
begin
    stream.WriteInt32(3);
end;

function TClientMessageRequestDebugState.ToString: ansistring;
begin
    result := 'RequestDebugState {';
    result += '}';
end;

end.