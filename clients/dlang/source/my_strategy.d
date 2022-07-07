import model.order;
import model.game;
import model.constants;
import std.typecons;
import std.conv;
import debug_interface;

class MyStrategy
{
    this(model.Constants constants) {}
    model.Order getOrder(model.Game game, DebugInterface debugInterface)
    {
        return model.Order((model.UnitOrder[int]).init);
    }
    void debugUpdate(DebugInterface debugInterface) {}
    void finish() {}
}