# Model

## `WeaponProperties`

Свойства оружия

Поля:

- `name`: `string` &mdash; Название
- `rounds_per_second`: `float64` &mdash; Скорострельность (количество выстрелов в секунду)
- `spread`: `float64` &mdash; Точность (угол разброса) выстрела (в градусах)
- `aim_time`: `float64` &mdash; Cкорость прицеливания
- `aim_field_of_view`: `float64` &mdash; Угол обзора при полном прицеливании (в градусах)
- `aim_rotation_speed`: `float64` &mdash; Скорость поворота при полнов прицеливании (градусы в секунду)
- `aim_movement_speed_modifier`: `float64` &mdash; Модификатор скорости перемещения при полном прицеливании
- `projectile_speed`: `float64` &mdash; Скорость снарядов
- `projectile_damage`: `float64` &mdash; Урон от одного снаряда
- `projectile_life_time`: `float64` &mdash; Время жизни снарядов
- `shot_sound_type_index`: `Option<int32>` &mdash; Индекс типа звука при выстреле (начиная с 0), либо None
- `projectile_hit_sound_type_index`: `Option<int32>` &mdash; Индекс типа звука при попадании (начиная с 0), либо None
- `max_inventory_ammo`: `int32` &mdash; Максимальное количество патронов, переносимых в инвентаре

## `SoundProperties`

Свойства звука

Поля:

- `name`: `string` &mdash; Название
- `distance`: `float64` &mdash; Расстояние, на котором слышен звук
- `offset`: `float64` &mdash; Модификатор разброса

## `Vec2`

Вектор в 2-х мерном пространстве

Поля:

- `x`: `float64` &mdash; Координата x
- `y`: `float64` &mdash; Координата y

## `Obstacle`

Препятствие на карте

Поля:

- `id`: `int32` &mdash; Уникальный идентификатор
- `position`: `Vec2` &mdash; Позиция центра
- `radius`: `float64` &mdash; Радиус препятствия
- `can_see_through`: `boolean` &mdash; Является ли препятствие просматриваемым, либо блокирующим зрение
- `can_shoot_through`: `boolean` &mdash; Проходят ли снаряды сквозь препятствие

## `Constants`

Неменяющееся состояние игры

Поля:

- `ticks_per_second`: `float64` &mdash; Количество тиков в игровую секунду
- `team_size`: `int32` &mdash; Начальное количество юнитов в каждой команде
- `initial_zone_radius`: `float64` &mdash; Начальный радиус зоны
- `zone_speed`: `float64` &mdash; Скорость изменения радиуса зоны
- `zone_damage_per_second`: `float64` &mdash; Урон, наносимый юнитом за зоной в секунду
- `spawn_time`: `float64` &mdash; Время появления юнитов
- `spawn_collision_damage_per_second`: `float64` &mdash; Урон наносимый юнитам, пытающимся появиться на ненекорректной позиции в секунду
- `looting_time`: `float64` &mdash; Время выполнения действий с лутом (в секундах)
- `bot_players`: `int32` &mdash; Количество игроков (команд) ботов
- `unit_radius`: `float64` &mdash; Радиус юнитов
- `unit_health`: `float64` &mdash; Максимальное количество здоровья юнитов
- `health_regeneration_per_second`: `float64` &mdash; Количество здоровья, автоматически регенерируемого юнитом в секунду
- `health_regeneration_delay`: `float64` &mdash; Время до начала автоматической регенерации здоровья с момента последнего урона по здоровью (в секундах)
- `max_shield`: `float64` &mdash; Максимальное значение щита юнита
- `spawn_shield`: `float64` &mdash; Начальное значение щита юнита
- `extra_lives`: `int32` &mdash; Начальное количество дополнительных жизней юнитов
- `last_respawn_zone_radius`: `float64` &mdash; Радиус зоны, после которой недоступно перерождение (обнуляются дополнительные жизни)
- `field_of_view`: `float64` &mdash; Угол обзора юнитов без прицеливания (в градусах)
- `view_distance`: `float64` &mdash; Расстояние зрения юнитов
- `view_blocking`: `boolean` &mdash; Блокируется ли зрение юнитов препятствиями
- `rotation_speed`: `float64` &mdash; Скорость поворота юнита без прицеливания (градусы в секунду)
- `spawn_movement_speed`: `float64` &mdash; Скорость предвижения юнитов во время появления
- `max_unit_forward_speed`: `float64` &mdash; Максимальная скорость юнитов при движении вперед
- `max_unit_backward_speed`: `float64` &mdash; Максимальная скорость юнитов при движении назад
- `unit_acceleration`: `float64` &mdash; Максимальное ускорение юнитов
- `friendly_fire`: `boolean` &mdash; Можно ли нанести урон юнитам своей команды
- `kill_score`: `float64` &mdash; Количество очков, дающихся за ликвидацию вражеского юнита
- `damage_score_multiplier`: `float64` &mdash; Множитель очков за урон вражеским юнитам
- `score_per_place`: `float64` &mdash; Количество очков за каждую команду, выбывшую до вас
- `weapons`: `[WeaponProperties]` &mdash; Список свойств каждого из типов оружия
- `starting_weapon`: `Option<int32>` &mdash; Начальное оружие, с которым появляется юнит, либо None
- `starting_weapon_ammo`: `int32` &mdash; Начальное количество патронов для стартового оружия
- `max_shield_potions_in_inventory`: `int32` &mdash; Максимальное количество зелий щита в инвентаре юнита
- `shield_per_potion`: `float64` &mdash; Количество щита, восполняемого одним зельем
- `shield_potion_use_time`: `float64` &mdash; Время необходимое для выполнения действия выпивания зелья брони
- `sounds`: `[SoundProperties]` &mdash; Список свойств каждого из типов звуков
- `steps_sound_type_index`: `Option<int32>` &mdash; Индекс типа звука, издаваемого при ходьбе (начиная с 0), либо None
- `steps_sound_travel_distance`: `float64` &mdash; Расстояние, при котором звук ходьбы издастся со 100% вероятностью
- `obstacles`: `[Obstacle]` &mdash; Список препятствий на карте

## `Player`

Участник игры (команда юнитов)

Поля:

- `id`: `int32` &mdash; Уникальный идентификатор
- `kills`: `int32` &mdash; Количество ликвидаций
- `damage`: `float64` &mdash; Суммарный нанесенный урон противникам
- `place`: `int32` &mdash; Место выживания (количество выживших команд на текущий момент/момент ликвидации)
- `score`: `float64` &mdash; Счет команды

## `ActionType`

Тип действия, выполняемого юнитом

Варианты:

* `Looting` &mdash; Подбирание или сбрасывание лута
* `UseShieldPotion` &mdash; Использование зелья щита

## `Action`

Действие, выполняемое юнитом

Поля:

- `finish_tick`: `int32` &mdash; Тик, в который действие будет завершено
- `action_type`: `ActionType` &mdash; Тип действия

## `Unit`

Юнит

Поля:

- `id`: `int32` &mdash; Уникальный идентификатор
- `player_id`: `int32` &mdash; Идентификатор игрока (команды), управляющей юнитом
- `health`: `float64` &mdash; Текущее здоровье
- `shield`: `float64` &mdash; Текущее значение щита
- `extra_lives`: `int32` &mdash; Оставшиеся дополнительные жизни юнита
- `position`: `Vec2` &mdash; Текущая позиция центра юнита
- `remaining_spawn_time`: `Option<float64>` &mdash; Оставшееся время до появления, либо None
- `velocity`: `Vec2` &mdash; Текущая скорость
- `direction`: `Vec2` &mdash; Текущее направление зрения (вектор длины 1)
- `aim`: `float64` &mdash; Значение, определяющее процесс прицеливания (0 - не в прицеле, 1 - готов к стрельбе)
- `action`: `Option<Action>` &mdash; Текущее действие, выполняемое юнитом, либо None
- `health_regeneration_start_tick`: `int32` &mdash; Тик в который начнется восстановление здоровья (может быть меньше текущего тика игры)
- `weapon`: `Option<int32>` &mdash; Индекс оружия, которое держит юнит (начиная с 0), либо None
- `next_shot_tick`: `int32` &mdash; Следующий тик в который юнит сможет произвести выстрел (может быть меньше текущего тика игры)
- `ammo`: `[int32]` &mdash; Список патронов в инвентаре юнита для каждого типа оружия
- `shield_potions`: `int32` &mdash; Количество зелий щита в инвентаре

## `Item`

Подбираемый предмет

Варианты:

- `Weapon` &mdash; Оружие

  Поля:

  - `type_index`: `int32` &mdash; Индекс типа оружия (начиная с 0)

- `ShieldPotions` &mdash; Зелья щита

  Поля:

  - `amount`: `int32` &mdash; Количество зелий

- `Ammo` &mdash; Патроны

  Поля:

  - `weapon_type_index`: `int32` &mdash; Индекс типа оружия (начиная с 0)
  - `amount`: `int32` &mdash; Количество патронов

## `Loot`

Лут, лежащий на земле

Поля:

- `id`: `int32` &mdash; Уникальный идентификатор
- `position`: `Vec2` &mdash; Позиция
- `item`: `Item` &mdash; Предмет

## `Projectile`

Снаряд, выпущенный из оружия

Поля:

- `id`: `int32` &mdash; Уникальный идентификатор
- `weapon_type_index`: `int32` &mdash; Индекс оружия, из которого был произведен выстрел (начиная с 0)
- `shooter_id`: `int32` &mdash; Идентификатор юнита, сделавшего выстрел
- `shooter_player_id`: `int32` &mdash; Идентификатор игрока (команды), чей юнит сделал выстрел
- `position`: `Vec2` &mdash; Текущая позиция
- `velocity`: `Vec2` &mdash; Скорость снаряда
- `life_time`: `float64` &mdash; Оставшееся время жизни снаряда

## `Zone`

Текущее состояние игровой зоны

Поля:

- `current_center`: `Vec2` &mdash; Текущий центр зоны
- `current_radius`: `float64` &mdash; Текущий радиус зоны
- `next_center`: `Vec2` &mdash; Следующий центр зоны
- `next_radius`: `float64` &mdash; Следующий радиус зоны

## `Sound`

Звук, услышанный одним из ваших юнитов

Поля:

- `type_index`: `int32` &mdash; Индекс типа звука (начиная с 0)
- `unit_id`: `int32` &mdash; Идентификатор юнита, услышавшего звук
- `position`: `Vec2` &mdash; Позиция в которой был услышан звук (отличается от позиции источника звука)

## `Game`

Текущее состояние игры

Поля:

- `my_id`: `int32` &mdash; Идентификатор вашего игрока
- `players`: `[Player]` &mdash; Список игроков (команд)
- `current_tick`: `int32` &mdash; Текущий тик
- `units`: `[Unit]` &mdash; Список юнитов, видимых для вашей команды
- `loot`: `[Loot]` &mdash; Список лута, видимого вашей командой
- `projectiles`: `[Projectile]` &mdash; Список снарядов, видимых вашей командой
- `zone`: `Zone` &mdash; Текущее состояние игровой зоны
- `sounds`: `[Sound]` &mdash; Список звуков, услышанных вашей командой за прошлый тик

## `ActionOrder`

Приказ выполнения действия для юнита

Варианты:

- `Pickup` &mdash; Подобрать лут

  Поля:

  - `loot`: `int32` &mdash; Идентификатор лута

- `UseShieldPotion` &mdash; Использовать зелье щита

  Нет полей

- `DropShieldPotions` &mdash; Выбросить зелья щита на землю

  Поля:

  - `amount`: `int32` &mdash; Количество зелий

- `DropWeapon` &mdash; Выбросить оружие

  Нет полей

- `DropAmmo` &mdash; Выбросить патроны

  Поля:

  - `weapon_type_index`: `int32` &mdash; Индекс типа оружия (начиная с 0)
  - `amount`: `int32` &mdash; Количество патронов

- `Aim` &mdash; Начать/продолжить прицеливание

  Поля:

  - `shoot`: `boolean` &mdash; Стрелять (возможно только при полном прицеливании)

## `UnitOrder`

Приказ для конкретного юнита

Поля:

- `target_velocity`: `Vec2` &mdash; Целевая скорость перемещения
- `target_direction`: `Vec2` &mdash; Целевое направление зрения (длина вектора не имеет значения)
- `action`: `Option<ActionOrder>` &mdash; Приказ выполнения действия, либо None

## `Order`

Приказы игрока (команды)

Поля:

- `unit_orders`: `Map<int32 -> UnitOrder>` &mdash; Приказы для каждого из ваших юнитов