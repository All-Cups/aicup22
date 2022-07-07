# Debugging

## `Color`

RGBA Color

Fields:

- `r`: `float64` &mdash; Red component
- `g`: `float64` &mdash; Green component
- `b`: `float64` &mdash; Blue component
- `a`: `float64` &mdash; Alpha (opacity) component

## `ColoredVertex`

Point + color

Fields:

- `position`: `Model::Vec2` &mdash; Position
- `color`: `Color` &mdash; Color

## `DebugData`

Data for debug rendering

One of:

- `PlacedText` &mdash; Text

  Fields:

  - `position`: `Model::Vec2` &mdash; Position
  - `text`: `string` &mdash; Text
  - `alignment`: `Model::Vec2` &mdash; Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
  - `size`: `float64` &mdash; Size
  - `color`: `Color` &mdash; Color

- `Circle` &mdash; Circle

  Fields:

  - `position`: `Model::Vec2` &mdash; Position of the center
  - `radius`: `float64` &mdash; Radius
  - `color`: `Color` &mdash; Color

- `GradientCircle` &mdash; Circle with gradient fill

  Fields:

  - `position`: `Model::Vec2` &mdash; Position of the center
  - `radius`: `float64` &mdash; Radius
  - `inner_color`: `Color` &mdash; Color of the center
  - `outer_color`: `Color` &mdash; Color of the edge

- `Ring` &mdash; Ring

  Fields:

  - `position`: `Model::Vec2` &mdash; Position of the center
  - `radius`: `float64` &mdash; Radius
  - `width`: `float64` &mdash; Width
  - `color`: `Color` &mdash; Color

- `Pie` &mdash; Sector of a circle

  Fields:

  - `position`: `Model::Vec2` &mdash; Position of the center
  - `radius`: `float64` &mdash; Radius
  - `start_angle`: `float64` &mdash; Start angle
  - `end_angle`: `float64` &mdash; End angle
  - `color`: `Color` &mdash; Color

- `Arc` &mdash; Arc

  Fields:

  - `position`: `Model::Vec2` &mdash; Position of the center
  - `radius`: `float64` &mdash; Radius
  - `width`: `float64` &mdash; Width
  - `start_angle`: `float64` &mdash; Start angle
  - `end_angle`: `float64` &mdash; End angle
  - `color`: `Color` &mdash; Color

- `Rect` &mdash; Rectancle

  Fields:

  - `bottom_left`: `Model::Vec2` &mdash; Bottom left position
  - `size`: `Model::Vec2` &mdash; Size
  - `color`: `Color` &mdash; Color

- `Polygon` &mdash; Polygon (convex)

  Fields:

  - `vertices`: `[Model::Vec2]` &mdash; Positions of vertices in order
  - `color`: `Color` &mdash; Color

- `GradientPolygon` &mdash; Polygon with gradient fill

  Fields:

  - `vertices`: `[ColoredVertex]` &mdash; List of vertices in order

- `Segment` &mdash; Segment

  Fields:

  - `first_end`: `Model::Vec2` &mdash; Position of the first end
  - `second_end`: `Model::Vec2` &mdash; Position of the second end
  - `width`: `float64` &mdash; Width
  - `color`: `Color` &mdash; Color

- `GradientSegment` &mdash; Segment with gradient fill

  Fields:

  - `first_end`: `Model::Vec2` &mdash; Position of the first end
  - `first_color`: `Color` &mdash; Color of the first end
  - `second_end`: `Model::Vec2` &mdash; Position of the second end
  - `second_color`: `Color` &mdash; Color of the second end
  - `width`: `float64` &mdash; Width

- `PolyLine` &mdash; Poly line

  Fields:

  - `vertices`: `[Model::Vec2]` &mdash; List of points in order
  - `width`: `float64` &mdash; Width
  - `color`: `Color` &mdash; Color

- `GradientPolyLine` &mdash; Poly line with gradient fill

  Fields:

  - `vertices`: `[ColoredVertex]` &mdash; List of points and colors in order
  - `width`: `float64` &mdash; Width

## `DebugCommand`

Debug commands that can be sent while debugging with the app

One of:

- `Add` &mdash; Add debug data to current tick

  Fields:

  - `debug_data`: `DebugData` &mdash; Data to add

- `Clear` &mdash; Clear current tick's debug data

  No fields

- `SetAutoFlush` &mdash; Enable/disable auto performing of commands

  Fields:

  - `enable`: `boolean` &mdash; Enable/disable autoflush

- `Flush` &mdash; Perform all previously sent commands

  No fields

## `Camera`

Camera state

Fields:

- `center`: `Model::Vec2` &mdash; Center
- `rotation`: `float64` &mdash; Rotation
- `attack`: `float64` &mdash; Attack angle
- `fov`: `float64` &mdash; Vertical field of view

## `DebugState`

Renderer's state

Fields:

- `pressed_keys`: `[string]` &mdash; Pressed keys
- `cursor_world_position`: `Model::Vec2` &mdash; Cursor's position in game coordinates
- `locked_unit`: `Option<int32>` &mdash; Id of unit which is followed by the camera, or None
- `camera`: `Camera` &mdash; Current camera state