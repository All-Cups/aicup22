# Codegame

## `ServerMessage`

Сообщение отправляемое сервером

Варианты:

- `UpdateConstants` &mdash; Обновление констант

  Поля:

  - `constants`: `Model::Constants` &mdash; Новые константы

- `GetOrder` &mdash; Получить приказ для следующего тика

  Поля:

  - `player_view`: `Model::Game` &mdash; Информация доступная игроку
  - `debug_available`: `boolean` &mdash; Доступен ли отладочный интерфейс приложения

- `Finish` &mdash; Сигнализирует конец игры

  Нет полей

- `DebugUpdate` &mdash; Отладочное обновление

  Поля:

  - `displayed_tick`: `int32` &mdash; Текущий отрисовываемый тик

## `ClientMessage`

Сообщение отправляемое клиентом

Варианты:

- `DebugMessage` &mdash; Отправить отладочную команду приложению

  Поля:

  - `command`: `Debugging::DebugCommand` &mdash; Команда для исполнения

- `OrderMessage` &mdash; Ответ на ServerMessage::GetOrder

  Поля:

  - `order`: `Model::Order` &mdash; Действие игрока

- `DebugUpdateDone` &mdash; Сигнализирует окончание отладочного обновления

  Нет полей

- `RequestDebugState` &mdash; Запросить отладочное состояние приложения

  Нет полей