# CHANGELOG

## v1.1.0

- antialias is now turned off by default (app was crashing with it for some users)
- fixed debug interface placed text alignment
- fixed loot (and other things) not visible inside the unit, but not in the view sector
- highlight player of the followed unit in the scoreboard
- added `--fullscreen`, `--window-width/--window-height`, `--start-paused` options to the app
- new client versions also receive displayed tick in `debug_update` method
- automatic follow units in the beginning of viewing the game and when currently followed unit dies
- click on player score will cycle through player's units to follow
