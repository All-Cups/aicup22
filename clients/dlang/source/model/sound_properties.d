module model.sound_properties;

import stream;
import std.conv;
import std.typecons : Nullable;


/// Sound properties
struct SoundProperties {
    /// Name
    string name;
    /// Distance from which the sound can be heard
    double distance;
    /// Offset modifier
    double offset;

    this(string name, double distance, double offset) {
        this.name = name;
        this.distance = distance;
        this.offset = offset;
    }

    /// Read SoundProperties from reader
    static SoundProperties readFrom(Stream reader) {
        string name;
        name = reader.readString();
        double distance;
        distance = reader.readDouble();
        double offset;
        offset = reader.readDouble();
        return SoundProperties(name, distance, offset);
    }

    /// Write SoundProperties to writer
    void writeTo(Stream writer) const {
        writer.write(name);
        writer.write(distance);
        writer.write(offset);
    }
}