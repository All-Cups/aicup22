# CHANGELOG

## v1.2.3

- Fixed units sometimes visible in corners of the view
- Time used & crash tick for players in results
- Fixed incorrect displayed_tick sent to the client

## v1.2.2

- Show health & shield bars in fancy mode
- Show player names above unit in schematic mode
- Middle mouse drag rotates the camera
- Fixed app crashes for some users

## v1.2.1

- Player and bot ids are now randomly shuffled
- Increased Staff `rounds_per_second` to 15 and decreased `spread` to 15
- `bot_strength >= 3` adds simple avoiding projectiles bot behavior
- Fixed shown tick in the app
- Added alternative C++ client using `std::variant` instead of abstract classes for variadic types
- Added clang compiler option for C++

## v1.2.0

- fixed occasional server crash
- show current alive teams/units count
- show player tags above units (togglable with `N` key)
- show cursor coordinates in schematic mode (togglable with `C` key)
- handle multiline `PlacedText` and fix its size & alignment
- view speed control
- improved camera following the unit
- `U` hotkey to toggle drawing data sent through debug interface

## v1.1.1

- camera now centers at unit's position without considering its direction when following
- allow max zoom to full map
- fixed `--repeat` mode of the app

## v1.1.0

- antialias is now turned off by default (app was crashing with it for some users)
- fixed debug interface placed text alignment
- fixed loot (and other things) not visible inside the unit, but not in the view sector
- highlight player of the followed unit in the scoreboard
- added `--fullscreen`, `--window-width/--window-height`, `--start-paused` options to the app
- new client versions also receive displayed tick in `debug_update` method
- automatic follow units in the beginning of viewing the game and when currently followed unit dies
- click on player score will cycle through player's units to follow
