# Codegame

## `ServerMessage`

Message sent from server

One of:

- `UpdateConstants` &mdash; Update constants

  Fields:

  - `constants`: `Model::Constants` &mdash; New constants

- `GetOrder` &mdash; Get order for next tick

  Fields:

  - `player_view`: `Model::Game` &mdash; Player's view
  - `debug_available`: `boolean` &mdash; Whether app is running with debug interface available

- `Finish` &mdash; Signifies end of the game

  No fields

- `DebugUpdate` &mdash; Debug update

  No fields

## `ClientMessage`

Message sent from client

One of:

- `DebugMessage` &mdash; Ask app to perform new debug command

  Fields:

  - `command`: `Debugging::DebugCommand` &mdash; Command to perform

- `OrderMessage` &mdash; Reply for ServerMessage::GetOrder

  Fields:

  - `order`: `Model::Order` &mdash; Player's order

- `DebugUpdateDone` &mdash; Signifies finish of the debug update

  No fields

- `RequestDebugState` &mdash; Request debug state from the app

  No fields