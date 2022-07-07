#include "MyStrategy.hpp"
#include <exception>

MyStrategy::MyStrategy(const model::Constants& constants) {}

model::Order MyStrategy::getOrder(const model::Game& game, DebugInterface* debugInterface)
{
    return model::Order(std::unordered_map<int, model::UnitOrder>());
}

void MyStrategy::debugUpdate(DebugInterface& debugInterface) {}

void MyStrategy::finish() {}