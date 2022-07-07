# App for local testing

You can run and debug games locally using the app. Download and extract the archive for your operating system.

When you run the app you will see configuration screen.
Here you can choose players participating in the game as well as configure some options.
If you want to test your strategy, choose `TCP` player, and then run your code. By default port `31001` is used.
After successful connection, you can start the game.

You can also view a replay of a previous game. You will need to save game log (see controls, batch mode).

You can also save configuration to a file, and run the app later using `--config <file>`, skipping configuration screen.
Full list of options is available using `--help` option.

If you want to change TCP port, e.g. to connect multiple strategies simultaneously, you can set host and port when running the client.
For example, `python main.py localhost 31002`.

After all players have connected, besides starting a new game, you can also:

- Repeat a game.

  Loads log of a previous game and replays it similar to regular replay.
  But, unlike regular replay, your strategy will receive data about the game.
  All orders sent by your strategy will be ignored though.

  To run repeat mode from command line, use option `--repeat <file>`.
  You will also need to use `--config` option in this case (seed and game configuration will be ignored).

<!-- - Load game state.

  Loads previously saved game state and continues the game from there, instead of generating initial state. -->
  
## Config file format

When using `--config <file>` option you can edit configuration file for more detailed control.

- `seed`: number/`null` - seed for initializing game's random number generator
- `game`: game configuration.

  - You may choose one of the existing presets:

    ```json
    {
      "Create": "Round1"
    }
    ```

  - You may customize all the options manually:

    ```json
    {
      "Create": {
        "Custom": {
          "game_option_1": ...,
          "game_option_2": ...,
          ...
        }
      }
    }
    ```

  - Or override existing preset modifying several options:

    ```json
    {
      "Create": {
        "Override": {
          "preset": "Round1",
          "game_option_1": ...,
          "game_option_2": ...
        }
      }
    }
    ```

- `players`: List of player configurations

### TCP player

Options for customizing TCP player:

- `host`: string/`null` - host to bind.
  Defaults to `localhost` (`127.0.0.1`),
  changing this to `0.0.0.0` allows remote connections
- `port`: port to listen for client connection
- `accept_timeout`: number/`null` - if specified, time to wait for connection, in seconds
- `single_timeout`: number/`null` - if specified, time limits for TCP operations (limit for 1 game tick)
- `total_time_limit`: number/`null` - if specified, total time limit for getting orders.
  If exceeded connection will be closed
- `token`: string/`null` - special token (password) for connection. Used when testing on the server
- `run`: optional object, a client process will be automatically ran if specified.
  You can specify following fields:
  - `working_directory` - directory where to launch build/run commands
  - `build_command` - if specified, command to build the client.
    Launched before starting to listen for connection, and is not counted for `accept_timeout`
  - `run_command` - run command (without host/port/token arguments).
    Host/port/token will be automatically added according to the configuration

  Build/run commands - list, where first element is the program and other are arguments

Example:

```json
{
  "Tcp": {
    "port": 31001,
    "accept_timeout": 10,
    "single_timeout": 1,
    "total_time_limit": null,
    "run": {
      "working_directory": "client-cpp",
      "build_command": [
        "cmake",
        "--build",
        ".",
        "--config",
        "Release"
      ],
      "run_command": [
        ".\\Release\\client.exe"
      ]
    }
  }
}
```

## Controls

- `Ctrl-S` - save current game to a file (you can replay or repeat it later)
<!-- - `Ctrl-E` - save current game state (you can load this game state later to continue from it) -->
- `P` - pause/continue
- `Left`/`Right` - move to the next/previous tick (on pause).
- `F2` - toggle fast mode
- `F` - toggle fullscreen mode
- `Escape` - quit / return to configuration screen

## Batch mode

The app can run in batch mode, i.e. without visualization.
To turn it on, use `--batch-mode` option.

You can save game log in batch mode using `--save-replay <file>`, and save game results using `--save-results <file>`.
