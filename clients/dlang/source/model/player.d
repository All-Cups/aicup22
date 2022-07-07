module model.player;

import stream;
import std.conv;
import std.typecons : Nullable;


/// Game's participant (team of units)
struct Player {
    /// Unique id
    int id;
    /// Number of kills
    int kills;
    /// Total damage dealt to enemies
    double damage;
    /// Survival place (number of survivor teams currently/at the moment of death)
    int place;
    /// Team score
    double score;

    this(int id, int kills, double damage, int place, double score) {
        this.id = id;
        this.kills = kills;
        this.damage = damage;
        this.place = place;
        this.score = score;
    }

    /// Read Player from reader
    static Player readFrom(Stream reader) {
        int id;
        id = reader.readInt();
        int kills;
        kills = reader.readInt();
        double damage;
        damage = reader.readDouble();
        int place;
        place = reader.readInt();
        double score;
        score = reader.readDouble();
        return Player(id, kills, damage, place, score);
    }

    /// Write Player to writer
    void writeTo(Stream writer) const {
        writer.write(id);
        writer.write(kills);
        writer.write(damage);
        writer.write(place);
        writer.write(score);
    }
}