uses
    SysUtils,
    BufferedStream,
    TcpStream,
    MyStrategy,
    UServerMessage in 'Codegame/UServerMessage.pas',
    UClientMessage in 'Codegame/UClientMessage.pas';

{$mode delphi}{$H+}

var
    host: String;
    port: Integer;
    token: String;
    stream: TBufferedStream;
    strategy: TMyStrategy;
    message: TServerMessage;
begin
    if paramCount < 1 then
        host := '127.0.0.1'
    else
        host := paramStr(1);
    if paramCount < 2 then
        port := 31001
    else
        port := strToInt(paramStr(2));
    if paramCount < 3 then
        token := '0000000000000000'
    else
        token := paramStr(3);
    stream := TBufferedStream.Create(TTcpStream.Create(host, port));
    stream.WriteString(token);
    stream.WriteInt32(1);
    stream.WriteInt32(1);
    stream.WriteInt32(0);
    stream.Flush;

    while true do begin
        message := TServerMessage.readFrom(stream);
        if message is TServerMessageUpdateConstants then
            strategy := TMyStrategy.Create((message as TServerMessageUpdateConstants).constants)
        else if message is TServerMessageGetOrder then begin
            TClientMessageOrderMessage.Create(strategy.GetOrder((message as TServerMessageGetOrder).playerView)).WriteTo(stream);
            stream.Flush;
        end
        else if message is TServerMessageFinish then begin
            strategy.Finish;
            break;
        end
        else if message is TServerMessageDebugUpdate then begin
            TClientMessageDebugUpdateDone.Create().WriteTo(stream);
            stream.Flush;
        end
        else
            raise Exception.Create('Unexpected server message');
    end;
end.