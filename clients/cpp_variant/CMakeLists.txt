cmake_minimum_required(VERSION 3.5)
set (CMAKE_CXX_STANDARD 20)
project(ai_cup_22)

# OS and compiler checks.
if(WIN32)
    add_definitions(-DWIN32)
    SET(PROJECT_LIBS Ws2_32.lib)
endif()

set(HEADERS
    "DebugInterface.hpp"
    "MyStrategy.hpp"
    "Stream.hpp"
    "TcpStream.hpp"
    "codegame/ClientMessage.hpp"
    "codegame/ServerMessage.hpp"
    "debugging/Camera.hpp"
    "debugging/Color.hpp"
    "debugging/ColoredVertex.hpp"
    "debugging/DebugCommand.hpp"
    "debugging/DebugData.hpp"
    "debugging/DebugState.hpp"
    "model/Action.hpp"
    "model/ActionOrder.hpp"
    "model/ActionType.hpp"
    "model/Constants.hpp"
    "model/Game.hpp"
    "model/Item.hpp"
    "model/Loot.hpp"
    "model/Obstacle.hpp"
    "model/Order.hpp"
    "model/Player.hpp"
    "model/Projectile.hpp"
    "model/Sound.hpp"
    "model/SoundProperties.hpp"
    "model/Unit.hpp"
    "model/UnitOrder.hpp"
    "model/Vec2.hpp"
    "model/WeaponProperties.hpp"
    "model/Zone.hpp"
)
set (SRC
    "DebugInterface.cpp"
    "MyStrategy.cpp"
    "Stream.cpp"
    "TcpStream.cpp"
    "codegame/ClientMessage.cpp"
    "codegame/ServerMessage.cpp"
    "debugging/Camera.cpp"
    "debugging/Color.cpp"
    "debugging/ColoredVertex.cpp"
    "debugging/DebugCommand.cpp"
    "debugging/DebugData.cpp"
    "debugging/DebugState.cpp"
    "main.cpp"
    "model/Action.cpp"
    "model/ActionOrder.cpp"
    "model/ActionType.cpp"
    "model/Constants.cpp"
    "model/Game.cpp"
    "model/Item.cpp"
    "model/Loot.cpp"
    "model/Obstacle.cpp"
    "model/Order.cpp"
    "model/Player.cpp"
    "model/Projectile.cpp"
    "model/Sound.cpp"
    "model/SoundProperties.cpp"
    "model/Unit.cpp"
    "model/UnitOrder.cpp"
    "model/Vec2.cpp"
    "model/WeaponProperties.cpp"
    "model/Zone.cpp"
)
SET_SOURCE_FILES_PROPERTIES(${HEADERS} PROPERTIES HEADER_FILE_ONLY TRUE)
include_directories(".")
add_executable(ai_cup_22 ${HEADERS} ${SRC})
TARGET_LINK_LIBRARIES(ai_cup_22 ${PROJECT_LIBS})