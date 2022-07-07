# Model

## `WeaponProperties`

Weapon properties

Fields:

- `name`: `string` &mdash; Name
- `rounds_per_second`: `float64` &mdash; Shooting speed (number of shots per second)
- `spread`: `float64` &mdash; Accuracy (spread angle) of a shot (in degrees)
- `aim_time`: `float64` &mdash; Aiming time
- `aim_field_of_view`: `float64` &mdash; Field of view in full aim (in degrees)
- `aim_rotation_speed`: `float64` &mdash; Rotation speed in full aim (degrees per second)
- `aim_movement_speed_modifier`: `float64` &mdash; Movement speed modifier in full aim
- `projectile_speed`: `float64` &mdash; Speed of projectiles
- `projectile_damage`: `float64` &mdash; Damage of a projectile
- `projectile_life_time`: `float64` &mdash; Projectiles' life time
- `shot_sound_type_index`: `Option<int32>` &mdash; Index of the sound when shooting (starting with 0), or None
- `projectile_hit_sound_type_index`: `Option<int32>` &mdash; Index of the sound when hitting something (starting with 0), or None
- `max_inventory_ammo`: `int32` &mdash; Max amount of ammo unit can hold in their inventory

## `SoundProperties`

Sound properties

Fields:

- `name`: `string` &mdash; Name
- `distance`: `float64` &mdash; Distance from which the sound can be heard
- `offset`: `float64` &mdash; Offset modifier

## `Vec2`

2 dimensional vector.

Fields:

- `x`: `float64` &mdash; `x` coordinate of the vector
- `y`: `float64` &mdash; `y` coordinate of the vector

## `Obstacle`

An obstacle on the map

Fields:

- `id`: `int32` &mdash; Unique id
- `position`: `Vec2` &mdash; Center position
- `radius`: `float64` &mdash; Obstacle's radius
- `can_see_through`: `boolean` &mdash; Whether units can see through this obstacle, or it blocks the view
- `can_shoot_through`: `boolean` &mdash; Whether projectiles can go through this obstacle

## `Constants`

Non changing game state

Fields:

- `ticks_per_second`: `float64` &mdash; Number of ticks per game second
- `team_size`: `int32` &mdash; Starting number of units in each team
- `initial_zone_radius`: `float64` &mdash; Initial zone radius
- `zone_speed`: `float64` &mdash; Speed of zone radius
- `zone_damage_per_second`: `float64` &mdash; Damage dealt to units outside of the zone per second
- `spawn_time`: `float64` &mdash; Unit spawning time
- `spawn_collision_damage_per_second`: `float64` &mdash; Damage dealt to units trying to spawn in incorrect position per second
- `looting_time`: `float64` &mdash; Time required to perform looting actions (in seconds)
- `bot_players`: `int32` &mdash; Number of bot players (teams)
- `unit_radius`: `float64` &mdash; Units' radius
- `unit_health`: `float64` &mdash; Max units' health
- `health_regeneration_per_second`: `float64` &mdash; Health automatically restored per second
- `health_regeneration_delay`: `float64` &mdash; Time until automatic health regeneration since last health damage (in seconds)
- `max_shield`: `float64` &mdash; Max value of unit's shield
- `spawn_shield`: `float64` &mdash; Initial value of unit's shield
- `extra_lives`: `int32` &mdash; Initial number of extra lives for units
- `last_respawn_zone_radius`: `float64` &mdash; Zone radius after which respawning is disabled
- `field_of_view`: `float64` &mdash; Units' field of view without aiming (in degrees)
- `view_distance`: `float64` &mdash; Units' view distance
- `view_blocking`: `boolean` &mdash; Whether units' view is blocked by obstacles
- `rotation_speed`: `float64` &mdash; Unit rotation speed without aiming (degrees per second)
- `spawn_movement_speed`: `float64` &mdash; Units' movement speed while spawning
- `max_unit_forward_speed`: `float64` &mdash; Max unit speed when walking forward
- `max_unit_backward_speed`: `float64` &mdash; Max unit speed when walking backward
- `unit_acceleration`: `float64` &mdash; Max unit acceleration
- `friendly_fire`: `boolean` &mdash; Whether a unit can damage units of the same team
- `kill_score`: `float64` &mdash; Score given for killing enemy unit
- `damage_score_multiplier`: `float64` &mdash; Score multiplier for damaging enemy units
- `score_per_place`: `float64` &mdash; Score given for every team killed before you
- `weapons`: `[WeaponProperties]` &mdash; List of properties of every weapon type
- `starting_weapon`: `Option<int32>` &mdash; Starting weapon with which units spawn, or None
- `starting_weapon_ammo`: `int32` &mdash; Ammo for starting weapon given when unit spawns
- `max_shield_potions_in_inventory`: `int32` &mdash; Max number of shield potions in unit's inventory
- `shield_per_potion`: `float64` &mdash; Amount of shield restored using one potion
- `shield_potion_use_time`: `float64` &mdash; Time required to perform action of using shield potion
- `sounds`: `[SoundProperties]` &mdash; List of properties of every sound type
- `steps_sound_type_index`: `Option<int32>` &mdash; Sound type index when moving (starting with 0), or None
- `steps_sound_travel_distance`: `float64` &mdash; Distance when steps sound will be 100% probability
- `obstacles`: `[Obstacle]` &mdash; List of obstacles on the map

## `Player`

Game's participant (team of units)

Fields:

- `id`: `int32` &mdash; Unique id
- `kills`: `int32` &mdash; Number of kills
- `damage`: `float64` &mdash; Total damage dealt to enemies
- `place`: `int32` &mdash; Survival place (number of survivor teams currently/at the moment of death)
- `score`: `float64` &mdash; Team score

## `ActionType`

Type of action a unit is currently performing

Variants:

* `Looting` &mdash; Picking up or dropping loot
* `UseShieldPotion` &mdash; Using a shield potion

## `Action`

Action unit is currently performing

Fields:

- `finish_tick`: `int32` &mdash; Tick when the action will be finished
- `action_type`: `ActionType` &mdash; Type of the action

## `Unit`

A unit

Fields:

- `id`: `int32` &mdash; Unique id
- `player_id`: `int32` &mdash; Id of the player (team) controlling the unit
- `health`: `float64` &mdash; Current health
- `shield`: `float64` &mdash; Current shield value
- `extra_lives`: `int32` &mdash; Left extra lives of this unit
- `position`: `Vec2` &mdash; Current position of unit's center
- `remaining_spawn_time`: `Option<float64>` &mdash; Remaining time until unit will be spawned, or None
- `velocity`: `Vec2` &mdash; Current velocity
- `direction`: `Vec2` &mdash; Current view direction (vector of length 1)
- `aim`: `float64` &mdash; Value describing process of aiming (0 - not aiming, 1 - ready to shoot)
- `action`: `Option<Action>` &mdash; Current action unit is performing, or None
- `health_regeneration_start_tick`: `int32` &mdash; Tick when health regeneration will start (can be less than current game tick)
- `weapon`: `Option<int32>` &mdash; Index of the weapon this unit is holding (starting with 0), or None
- `next_shot_tick`: `int32` &mdash; Next tick when unit can shoot again (can be less than current game tick)
- `ammo`: `[int32]` &mdash; List of ammo in unit's inventory for every weapon type
- `shield_potions`: `int32` &mdash; Number of shield potions in inventory

## `Item`

Lootable item

One of:

- `Weapon` &mdash; Weapon

  Fields:

  - `type_index`: `int32` &mdash; Weapon type index (starting with 0)

- `ShieldPotions` &mdash; Shield potions

  Fields:

  - `amount`: `int32` &mdash; Amount of potions

- `Ammo` &mdash; Ammo

  Fields:

  - `weapon_type_index`: `int32` &mdash; Weapon type index (starting with 0)
  - `amount`: `int32` &mdash; Amount of ammo

## `Loot`

Loot lying on the ground

Fields:

- `id`: `int32` &mdash; Unique id
- `position`: `Vec2` &mdash; Position
- `item`: `Item` &mdash; Item

## `Projectile`

Weapon projectile

Fields:

- `id`: `int32` &mdash; Unique id
- `weapon_type_index`: `int32` &mdash; Index of the weapon this projectile was shot from (starts with 0)
- `shooter_id`: `int32` &mdash; Id of unit who made the shot
- `shooter_player_id`: `int32` &mdash; Id of player (team), whose unit made the shot
- `position`: `Vec2` &mdash; Current position
- `velocity`: `Vec2` &mdash; Projectile's velocity
- `life_time`: `float64` &mdash; Left time of projectile's life

## `Zone`

Current state of the game zone

Fields:

- `current_center`: `Vec2` &mdash; Current center
- `current_radius`: `float64` &mdash; Current radius
- `next_center`: `Vec2` &mdash; Next center
- `next_radius`: `float64` &mdash; Next radius

## `Sound`

Sound heard by one of your units

Fields:

- `type_index`: `int32` &mdash; Sound type index (starting with 0)
- `unit_id`: `int32` &mdash; Id of unit that heard this sound
- `position`: `Vec2` &mdash; Position where sound was heard (different from sound source position)

## `Game`

Current game's state

Fields:

- `my_id`: `int32` &mdash; Your player's id
- `players`: `[Player]` &mdash; List of players (teams)
- `current_tick`: `int32` &mdash; Current tick
- `units`: `[Unit]` &mdash; List of units visible by your team
- `loot`: `[Loot]` &mdash; List of loot visible by your team
- `projectiles`: `[Projectile]` &mdash; List of projectiles visible by your team
- `zone`: `Zone` &mdash; Current state of game zone
- `sounds`: `[Sound]` &mdash; List of sounds heard by your team during last tick

## `ActionOrder`

Order to perform an action for unit

One of:

- `Pickup` &mdash; Pick up loot

  Fields:

  - `loot`: `int32` &mdash; Loot id

- `UseShieldPotion` &mdash; Use shield potion

  No fields

- `DropShieldPotions` &mdash; Drop shield potions on the ground

  Fields:

  - `amount`: `int32` &mdash; Amount of potions

- `DropWeapon` &mdash; Drop current weapon

  No fields

- `DropAmmo` &mdash; Drop ammo

  Fields:

  - `weapon_type_index`: `int32` &mdash; Weapon type index (starting with 0)
  - `amount`: `int32` &mdash; Amount of ammo

- `Aim` &mdash; Start/continue aiming

  Fields:

  - `shoot`: `boolean` &mdash; Shoot (only possible in full aim)

## `UnitOrder`

Order for specific unit

Fields:

- `target_velocity`: `Vec2` &mdash; Target moving velocity
- `target_direction`: `Vec2` &mdash; Target view direction (vector length doesn't matter)
- `action`: `Option<ActionOrder>` &mdash; Order to perform an action, or None

## `Order`

Player's (team's) orders

Fields:

- `unit_orders`: `Map<int32 -> UnitOrder>` &mdash; Orders for each of your units