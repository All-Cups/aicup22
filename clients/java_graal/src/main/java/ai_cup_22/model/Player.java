package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Game's participant (team of units)
 */
public class Player {
    /**
     * Unique id
     */
    private int id;

    /**
     * Unique id
     */
    public int getId() {
        return id;
    }

    /**
     * Unique id
     */
    public void setId(int value) {
        this.id = value;
    }
    /**
     * Number of kills
     */
    private int kills;

    /**
     * Number of kills
     */
    public int getKills() {
        return kills;
    }

    /**
     * Number of kills
     */
    public void setKills(int value) {
        this.kills = value;
    }
    /**
     * Total damage dealt to enemies
     */
    private double damage;

    /**
     * Total damage dealt to enemies
     */
    public double getDamage() {
        return damage;
    }

    /**
     * Total damage dealt to enemies
     */
    public void setDamage(double value) {
        this.damage = value;
    }
    /**
     * Survival place (number of survivor teams currently/at the moment of death)
     */
    private int place;

    /**
     * Survival place (number of survivor teams currently/at the moment of death)
     */
    public int getPlace() {
        return place;
    }

    /**
     * Survival place (number of survivor teams currently/at the moment of death)
     */
    public void setPlace(int value) {
        this.place = value;
    }
    /**
     * Team score
     */
    private double score;

    /**
     * Team score
     */
    public double getScore() {
        return score;
    }

    /**
     * Team score
     */
    public void setScore(double value) {
        this.score = value;
    }

    public Player(int id, int kills, double damage, int place, double score) {
        this.id = id;
        this.kills = kills;
        this.damage = damage;
        this.place = place;
        this.score = score;
    }

    /**
     * Read Player from input stream
     */
    public static Player readFrom(java.io.InputStream stream) throws java.io.IOException {
        int id;
        id = StreamUtil.readInt(stream);
        int kills;
        kills = StreamUtil.readInt(stream);
        double damage;
        damage = StreamUtil.readDouble(stream);
        int place;
        place = StreamUtil.readInt(stream);
        double score;
        score = StreamUtil.readDouble(stream);
        return new Player(id, kills, damage, place, score);
    }

    /**
     * Write Player to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeInt(stream, id);
        StreamUtil.writeInt(stream, kills);
        StreamUtil.writeDouble(stream, damage);
        StreamUtil.writeInt(stream, place);
        StreamUtil.writeDouble(stream, score);
    }

    /**
     * Get string representation of Player
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Player { ");
        stringBuilder.append("id: ");
        stringBuilder.append(String.valueOf(id));
        stringBuilder.append(", ");
        stringBuilder.append("kills: ");
        stringBuilder.append(String.valueOf(kills));
        stringBuilder.append(", ");
        stringBuilder.append("damage: ");
        stringBuilder.append(String.valueOf(damage));
        stringBuilder.append(", ");
        stringBuilder.append("place: ");
        stringBuilder.append(String.valueOf(place));
        stringBuilder.append(", ");
        stringBuilder.append("score: ");
        stringBuilder.append(String.valueOf(score));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}