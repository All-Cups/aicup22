# Debugging

## `Color`

Цвет в RGBA формате

Поля:

- `r`: `float64` &mdash; Компонента красного цвета
- `g`: `float64` &mdash; Компонента зеленого цвета
- `b`: `float64` &mdash; Компонента синего цвета
- `a`: `float64` &mdash; Альфа компонента (непрозрачность)

## `ColoredVertex`

Точка + цвет

Поля:

- `position`: `Model::Vec2` &mdash; Позиция
- `color`: `Color` &mdash; Цвет

## `DebugData`

Данные для отладочной отрисовки

Варианты:

- `PlacedText` &mdash; Текст

  Поля:

  - `position`: `Model::Vec2` &mdash; Позиция
  - `text`: `string` &mdash; Текст
  - `alignment`: `Model::Vec2` &mdash; Выравнивание, отдельно по x и y. От 0 до 1. 0.5 - выравнивание по центру
  - `size`: `float64` &mdash; Размер
  - `color`: `Color` &mdash; Цвет

- `Circle` &mdash; Круг

  Поля:

  - `position`: `Model::Vec2` &mdash; Позиция центра
  - `radius`: `float64` &mdash; Радиус
  - `color`: `Color` &mdash; Цвет

- `GradientCircle` &mdash; Круг с заливкой градиентом

  Поля:

  - `position`: `Model::Vec2` &mdash; Позиция центра
  - `radius`: `float64` &mdash; Радиус
  - `inner_color`: `Color` &mdash; Цвет центра
  - `outer_color`: `Color` &mdash; Цвет границы

- `Ring` &mdash; Кольцо (окружность)

  Поля:

  - `position`: `Model::Vec2` &mdash; Позиция центра
  - `radius`: `float64` &mdash; Радиус
  - `width`: `float64` &mdash; Толщина
  - `color`: `Color` &mdash; Цвет

- `Pie` &mdash; Сектор круга

  Поля:

  - `position`: `Model::Vec2` &mdash; Позиция центра
  - `radius`: `float64` &mdash; Радиус
  - `start_angle`: `float64` &mdash; Угол начала
  - `end_angle`: `float64` &mdash; Угол конца
  - `color`: `Color` &mdash; Цвет

- `Arc` &mdash; Дуга

  Поля:

  - `position`: `Model::Vec2` &mdash; Позиция центра
  - `radius`: `float64` &mdash; Радиус
  - `width`: `float64` &mdash; Толщина
  - `start_angle`: `float64` &mdash; Угол начала
  - `end_angle`: `float64` &mdash; Угол конца
  - `color`: `Color` &mdash; Цвет

- `Rect` &mdash; Прямоугольник

  Поля:

  - `bottom_left`: `Model::Vec2` &mdash; Позиция нижнего левого угла
  - `size`: `Model::Vec2` &mdash; Размер
  - `color`: `Color` &mdash; Цвет

- `Polygon` &mdash; Многоугольник (выпуклый)

  Поля:

  - `vertices`: `[Model::Vec2]` &mdash; Позиции вершин в порядке обхода
  - `color`: `Color` &mdash; Цвет

- `GradientPolygon` &mdash; Многоугольник с заливкой градиентом

  Поля:

  - `vertices`: `[ColoredVertex]` &mdash; Список вершин в порядке обхода

- `Segment` &mdash; Отрезок

  Поля:

  - `first_end`: `Model::Vec2` &mdash; Позиция первого конца
  - `second_end`: `Model::Vec2` &mdash; Позиция второго конца
  - `width`: `float64` &mdash; Толщина
  - `color`: `Color` &mdash; Цвет

- `GradientSegment` &mdash; Отрезок с заливкой градиентом

  Поля:

  - `first_end`: `Model::Vec2` &mdash; Позиция первого конца
  - `first_color`: `Color` &mdash; Цвет первого конца
  - `second_end`: `Model::Vec2` &mdash; Позиция второго конца
  - `second_color`: `Color` &mdash; Цвет второго конца
  - `width`: `float64` &mdash; Толщина

- `PolyLine` &mdash; Ломаная

  Поля:

  - `vertices`: `[Model::Vec2]` &mdash; Список точек в порядке
  - `width`: `float64` &mdash; Толшина
  - `color`: `Color` &mdash; Цвет

- `GradientPolyLine` &mdash; Ломаная с градиентной заливкой

  Поля:

  - `vertices`: `[ColoredVertex]` &mdash; Список точек и цветов в порядке
  - `width`: `float64` &mdash; Толшина

## `DebugCommand`

Команды, которые могут быть отправлены приложению для помощи в отладке

Варианты:

- `Add` &mdash; Добавить отладочные данные в текущий тик

  Поля:

  - `debug_data`: `DebugData` &mdash; Данные для добавления

- `Clear` &mdash; Очистить отладочные данные текущего тика

  Нет полей

- `SetAutoFlush` &mdash; Включить/выключить автоматическое выполнение команд

  Поля:

  - `enable`: `boolean` &mdash; Включить/выключить автоматическое выполнение

- `Flush` &mdash; Выполнить все присланные ранее команды

  Нет полей

## `Camera`

Состояние камеры

Поля:

- `center`: `Model::Vec2` &mdash; Центр камеры
- `rotation`: `float64` &mdash; Поворот
- `attack`: `float64` &mdash; Угол наклона
- `fov`: `float64` &mdash; Поле зрения по вертикали

## `DebugState`

Состояние визуализатора

Поля:

- `pressed_keys`: `[string]` &mdash; Нажатые кнопки
- `cursor_world_position`: `Model::Vec2` &mdash; Позиция курсора в игровых координатах
- `locked_unit`: `Option<int32>` &mdash; Идентификатор юнита, за которым следит камера, либо None
- `camera`: `Camera` &mdash; Текущее состояние камеры