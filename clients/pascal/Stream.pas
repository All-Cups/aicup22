
Unit Stream;

{$mode delphi}{$H+}

Interface

Type 
  TByteArray = Array Of Byte;
  TStream = Class
    Public 
      Function ReadBytesAtMost(byteCount: Integer): TByteArray;
      virtual;
      abstract;

      Procedure Write(bytes: TByteArray);
      virtual;
      abstract;

      Procedure Flush;
      virtual;
      abstract;

      Function ReadBytes(byteCount: Integer): TByteArray;
      Function ReadBoolean: Boolean;
      Function ReadInt32: Int32;
      Function ReadInt64: Int64;
      Function ReadSingle: Single;
      Function ReadDouble: Double;
      Function ReadString: String;

      Procedure WriteBoolean(value: Boolean);
      Procedure WriteInt32(value: Int32);
      Procedure WriteInt64(value: Int64);
      Procedure WriteSingle(value: Single);
      Procedure WriteDouble(value: Double);
      Procedure WriteString(value: String);
  End;

Implementation

Uses SysUtils;

Type 
  TInt32Repr = array[0..3] Of Byte;
  TInt64Repr = array[0..7] Of Byte;
  TSingleRepr = array[0..3] Of Byte;
  TDoubleRepr = array[0..7] Of Byte;

Function TStream.ReadBytes(byteCount: Integer): TByteArray;

Var 
  buffer: TByteArray;
  start, i: Integer;
Begin
  result := TByteArray.Create;
  While Length(result) <> byteCount Do
    Begin
      start := Length(result);
      buffer := ReadBytesAtMost(byteCount - Length(result));
      If Length(buffer) = 0 Then
        raise Exception.Create('Unexpected EOF');
      SetLength(result, Length(result) + Length(buffer));
      For i := 0 To Length(buffer) - 1 Do
        result[start + i] := buffer[i];
    End;
End;

Function TStream.ReadBoolean: Boolean;
Begin
  result := ReadBytes(1)[0] <> 0;
End;

Function TStream.ReadInt32: Int32;

Var 
  repr: TInt32Repr;
  bytes: TByteArray;
  i: Integer;
Begin
  bytes := ReadBytes(Length(repr));
  For i := 0 To High(repr) Do
    repr[i] := bytes[i];
  result := LEtoN(Int32(repr));
End;

Function TStream.ReadInt64: Int64;

Var 
  repr: TInt64Repr;
  bytes: TByteArray;
  i: Integer;
Begin
  bytes := ReadBytes(Length(repr));
  For i := 0 To High(repr) Do
    repr[i] := bytes[i];
  result := LEtoN(Int64(repr));
End;

Function TStream.ReadSingle: Single;

Var 
  repr: TSingleRepr;
  bytes: TByteArray;
  i: Integer;
Begin
  bytes := ReadBytes(Length(repr));
  For i := 0 To High(repr) Do
    repr[i] := bytes[i];
  result := Single(repr);
End;

Function TStream.ReadDouble: Double;

Var 
  repr: TDoubleRepr;
  bytes: TByteArray;
  i: Integer;
Begin
  bytes := ReadBytes(Length(repr));
  For i := 0 To High(repr) Do
    repr[i] := bytes[i];
  result := Double(repr);
End;

Function TStream.ReadString: String;
Begin
  result := String(TEncoding.UTF8.GetString(ReadBytes(ReadInt32)));
End;

Procedure TStream.WriteBoolean(value: Boolean);
Begin
  Write(TByteArray.Create(ord(value)));
End;

Procedure TStream.WriteInt32(value: Int32);

Var 
  repr: TInt32Repr;
  bytes: TByteArray;
  i: Integer;

Begin
  repr := TInt32Repr(NtoLE(value));
  SetLength(bytes, Length(repr));
  For i := 0 To High(repr) Do
    bytes[i] := repr[i];
  Write(bytes);
  Finalize(bytes);
End;

Procedure TStream.WriteInt64(value: Int64);

Var 
  repr: TInt64Repr;
  bytes: TByteArray;
  i: Integer;

Begin
  repr := TInt64Repr(NtoLE(value));
  SetLength(bytes, Length(repr));
  For i := 0 To High(repr) Do
    bytes[i] := repr[i];
  Write(bytes);
  Finalize(bytes);
End;

Procedure TStream.WriteSingle(value: Single);

Var 
  repr: TSingleRepr;
  bytes: TByteArray;
  i: Integer;

Begin
  repr := TSingleRepr(value);
  SetLength(bytes, Length(repr));
  For i := 0 To High(repr) Do
    bytes[i] := repr[i];
  Write(bytes);
  Finalize(bytes);
End;

Procedure TStream.WriteDouble(value: Double);

Var 
  repr: TDoubleRepr;
  bytes: TByteArray;
  i: Integer;

Begin
  repr := TDoubleRepr(value);
  SetLength(bytes, Length(repr));
  For i := 0 To High(repr) Do
    bytes[i] := repr[i];
  Write(bytes);
  Finalize(bytes);
End;

Procedure TStream.WriteString(value: String);

Var 
  bytes: TByteArray;
Begin
  bytes := TEncoding.UTF8.GetBytes(UnicodeString(value));
  WriteInt32(Length(bytes));
  Write(bytes);
End;

End.
