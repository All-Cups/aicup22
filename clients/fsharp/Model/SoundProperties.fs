#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// Sound properties
type SoundProperties = {
    /// Name
    Name: string;
    /// Distance from which the sound can be heard
    Distance: double;
    /// Offset modifier
    Offset: double;
} with

    /// Write SoundProperties to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        let nameData : byte[] = System.Text.Encoding.UTF8.GetBytes this.Name
        writer.Write nameData.Length
        writer.Write nameData
        writer.Write this.Distance
        writer.Write this.Offset
        ()

    /// Read SoundProperties from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Name = reader.ReadInt32() |> reader.ReadBytes |> System.Text.Encoding.UTF8.GetString
        Distance = reader.ReadDouble()
        Offset = reader.ReadDouble()
    }