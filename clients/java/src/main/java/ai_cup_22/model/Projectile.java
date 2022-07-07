package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Weapon projectile
 */
public class Projectile {
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
     * Index of the weapon this projectile was shot from (starts with 0)
     */
    private int weaponTypeIndex;

    /**
     * Index of the weapon this projectile was shot from (starts with 0)
     */
    public int getWeaponTypeIndex() {
        return weaponTypeIndex;
    }

    /**
     * Index of the weapon this projectile was shot from (starts with 0)
     */
    public void setWeaponTypeIndex(int value) {
        this.weaponTypeIndex = value;
    }
    /**
     * Id of unit who made the shot
     */
    private int shooterId;

    /**
     * Id of unit who made the shot
     */
    public int getShooterId() {
        return shooterId;
    }

    /**
     * Id of unit who made the shot
     */
    public void setShooterId(int value) {
        this.shooterId = value;
    }
    /**
     * Id of player (team), whose unit made the shot
     */
    private int shooterPlayerId;

    /**
     * Id of player (team), whose unit made the shot
     */
    public int getShooterPlayerId() {
        return shooterPlayerId;
    }

    /**
     * Id of player (team), whose unit made the shot
     */
    public void setShooterPlayerId(int value) {
        this.shooterPlayerId = value;
    }
    /**
     * Current position
     */
    private ai_cup_22.model.Vec2 position;

    /**
     * Current position
     */
    public ai_cup_22.model.Vec2 getPosition() {
        return position;
    }

    /**
     * Current position
     */
    public void setPosition(ai_cup_22.model.Vec2 value) {
        this.position = value;
    }
    /**
     * Projectile's velocity
     */
    private ai_cup_22.model.Vec2 velocity;

    /**
     * Projectile's velocity
     */
    public ai_cup_22.model.Vec2 getVelocity() {
        return velocity;
    }

    /**
     * Projectile's velocity
     */
    public void setVelocity(ai_cup_22.model.Vec2 value) {
        this.velocity = value;
    }
    /**
     * Left time of projectile's life
     */
    private double lifeTime;

    /**
     * Left time of projectile's life
     */
    public double getLifeTime() {
        return lifeTime;
    }

    /**
     * Left time of projectile's life
     */
    public void setLifeTime(double value) {
        this.lifeTime = value;
    }

    public Projectile(int id, int weaponTypeIndex, int shooterId, int shooterPlayerId, ai_cup_22.model.Vec2 position, ai_cup_22.model.Vec2 velocity, double lifeTime) {
        this.id = id;
        this.weaponTypeIndex = weaponTypeIndex;
        this.shooterId = shooterId;
        this.shooterPlayerId = shooterPlayerId;
        this.position = position;
        this.velocity = velocity;
        this.lifeTime = lifeTime;
    }

    /**
     * Read Projectile from input stream
     */
    public static Projectile readFrom(java.io.InputStream stream) throws java.io.IOException {
        int id;
        id = StreamUtil.readInt(stream);
        int weaponTypeIndex;
        weaponTypeIndex = StreamUtil.readInt(stream);
        int shooterId;
        shooterId = StreamUtil.readInt(stream);
        int shooterPlayerId;
        shooterPlayerId = StreamUtil.readInt(stream);
        ai_cup_22.model.Vec2 position;
        position = ai_cup_22.model.Vec2.readFrom(stream);
        ai_cup_22.model.Vec2 velocity;
        velocity = ai_cup_22.model.Vec2.readFrom(stream);
        double lifeTime;
        lifeTime = StreamUtil.readDouble(stream);
        return new Projectile(id, weaponTypeIndex, shooterId, shooterPlayerId, position, velocity, lifeTime);
    }

    /**
     * Write Projectile to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeInt(stream, id);
        StreamUtil.writeInt(stream, weaponTypeIndex);
        StreamUtil.writeInt(stream, shooterId);
        StreamUtil.writeInt(stream, shooterPlayerId);
        position.writeTo(stream);
        velocity.writeTo(stream);
        StreamUtil.writeDouble(stream, lifeTime);
    }

    /**
     * Get string representation of Projectile
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Projectile { ");
        stringBuilder.append("id: ");
        stringBuilder.append(String.valueOf(id));
        stringBuilder.append(", ");
        stringBuilder.append("weaponTypeIndex: ");
        stringBuilder.append(String.valueOf(weaponTypeIndex));
        stringBuilder.append(", ");
        stringBuilder.append("shooterId: ");
        stringBuilder.append(String.valueOf(shooterId));
        stringBuilder.append(", ");
        stringBuilder.append("shooterPlayerId: ");
        stringBuilder.append(String.valueOf(shooterPlayerId));
        stringBuilder.append(", ");
        stringBuilder.append("position: ");
        stringBuilder.append(String.valueOf(position));
        stringBuilder.append(", ");
        stringBuilder.append("velocity: ");
        stringBuilder.append(String.valueOf(velocity));
        stringBuilder.append(", ");
        stringBuilder.append("lifeTime: ");
        stringBuilder.append(String.valueOf(lifeTime));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}